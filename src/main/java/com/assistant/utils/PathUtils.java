package com.assistant.utils;

import com.assistant.constant.AssistantContext;
import com.assistant.mapper.ProjectMapper;
import com.assistant.model.dto.QueueCache;
import com.assistant.model.enity.MapNode;
import com.assistant.model.enity.Project;
import com.assistant.service.intf.ElevatorService;
import lombok.*;
import org.springframework.stereotype.Component;
import org.thymeleaf.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class PathUtils {
    private final ElevatorService elevatorService;
    private final ProjectMapper projectMapper;
    private final CacheUtils cacheUtils;

    private long[][] floydMatrix;
    private String[][] floydPath;
    private List<String> floydIndex;
    private Map<String, Long> timeMap;
    private List<Long> timeList;
    private List<String> idList;

    private Map<String, MapNode> elevatorMap;
    private Map<String, int[]> elevatorTimeMap;

    private int weightPath;
    private int weightTime;
    private int n;
    private boolean[] v;

    private TspResult[][] dp;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    public static class TspResult {
        String action;
        long path;
        long time;
        long score;
        String resultPath;
        String mainPath;

        public List<String> getResultPath() {
            if (StringUtils.isEmpty(resultPath)) {
                return null;
            }
            return Arrays.stream(resultPath.split(",")).toList();
        }

        public List<String> getMainPath() {
            if (StringUtils.isEmpty(mainPath)) {
                return null;
            }
            return Arrays.stream(mainPath.split(",")).toList();
        }
    }

    private int parseV() {
        int ans = 1;
        for (int i = 0; i < n; i++) {
            ans = ans << 1;
            if (v[i]) {
                ans--;
            }
        }
        return ans-1;
    }

    private TspResult tsp(int index, int count, long cost, String path, String mainPath, long time, TspResult ans) {
        int i1 = parseV();

        if (dp[index][i1] != null) {
            return dp[index][i1];
        }


        int currPos = floydIndex.indexOf(idList.get(index));
        int index_0 = floydIndex.indexOf(idList.get(0));

        if (count == n) {
            long score = weightPath * (cost + floydMatrix[currPos][index_0]) + (long) weightTime * time;
            if (ans.score > score) {
                ans.resultPath = path;
                ans.score = score;
                ans.path = cost + floydMatrix[currPos][index_0];
                ans.time = time;
                ans.mainPath = mainPath;
            }
            return ans;
        }

        /*
         * 回溯步骤（BACKTRACKING STEP）
         * 循环遍历currPos结点的邻接表，将计数增加1，并按floydMatrix[currPos][i]值增加成本
         * cost + floydMatrix[currPos][i]
         */

        for (int i = 1; i < n; i++) {
            int index_i = floydIndex.indexOf(idList.get(i));
            if (!v[i]) {
                // 标记结点被访问过
                v[i] = true;
                String id = idList.get(i);
                int elevatorTime = 0;
                if (elevatorMap.containsKey(id)) {
                    MapNode mapNode = elevatorMap.get(id);
                    elevatorTime = elevatorTimeMap.get(mapNode.getElevatorId())[mapNode.getLevel() - 1];
                }
                long timeContext = (time <= timeList.get(i) ? timeList.get(i) : time) + timeMap.get(id) + elevatorTime;
                ans = tsp(i, count + 1, cost + floydMatrix[currPos][index_i], path + floydPath[currPos][index_i], mainPath + "," + id, timeContext, ans);
                // 标记结点没有被访问过
                v[i] = false;
            }
        }

        if (dp[index][i1] == null) {
            dp[index][i1] = ans;
        }

        return ans;
    }

    private void parseList(@NonNull List<String> projectIds) {
        List<Project> projectList = projectMapper.selectByIds(projectIds);
        this.idList = new ArrayList<>() {{
            add("10000");
            for (Project project : projectList) {
                add(project.getNodeId());
            }
        }};

        this.timeMap = new HashMap<>() {{
            put("10000", 0L);
        }};

        this.timeList = new ArrayList<>() {{
            add(0L);
            for (Project project : projectList) {
                QueueCache cache = cacheUtils.getQueueCache(project.getProject());
                add(cache.getNameList().size() * cache.getProject().getAvetime());
                timeMap.put(project.getNodeId(), cache.getProject().getAvetime());
            }
        }};
    }


    public TspResult getBestPath(List<String> projectIds, int weightPath, int weightTime, String action) {
        parseList(projectIds);
        MapNodeUtils.FloydResult floydResult;
        switch (action) {
            case AssistantContext.FLOYD_MATRIX_ALL:
                floydResult = cacheUtils.getFloydMatrix();
                break;
            case AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR:
                floydResult = cacheUtils.getFloydMatrixWithoutStair();
                break;
            case AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR:
                floydResult = cacheUtils.getFloydMatrixWithoutElevator();
                break;
            default:
                return null;
        }
        this.elevatorMap = cacheUtils.getElevatorMap();
        List<String> elevatorIdList = elevatorMap.values().stream().map(MapNode::getElevatorId).collect(Collectors.toList());
        this.elevatorTimeMap = elevatorService.getElevatorTimeMap(elevatorIdList);
        this.floydMatrix = floydResult.getFloydMatrix();
        this.floydIndex = floydResult.getIndex();
        this.floydPath = floydResult.getPathMatrix();
        this.weightPath = weightPath;
        this.weightTime = weightTime;
        // 顶点（结点）的数量
        this.n = idList.size();
        // boolean类型的数组 v 用来标记一个城市结点是否被访问过
        this.v = new boolean[n];
        // 标记第 0 个 结点已经被访问过，所以v[0]=true
        v[0] = true;
        int m = 1 << (n - 1);
        dp = new TspResult[n][m];

        // 查找最小权重的汉密尔顿回路 Hamiltonian Cycle
        // 输出结果ans就是最小权重的汉密尔顿回路（ Hamiltonian Cycle）
        return tsp(0, 1, 0, "10000", "10000", 0, TspResult.builder().action(action).score(Long.MAX_VALUE).build());
    }
}
