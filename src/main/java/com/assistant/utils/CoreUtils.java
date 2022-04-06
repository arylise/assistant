package com.assistant.utils;

import com.assistant.model.dto.ProCache;
import com.assistant.model.enity.Project;
import lombok.*;
import org.springframework.stereotype.Component;
import org.thymeleaf.util.ListUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequiredArgsConstructor
public class CoreUtils {
    private final CacheUtils cacheUtils;

    private long[][] floydMatrix;
    private List<Integer> floydIndex;
    private Map<Integer, Integer> timeMap;
    private List<Integer> timeList;
    private List<Integer> idList;

    private long weightPath;
    private long weightTime;
    private int n;
    private boolean[] v;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    public static class TspResult {
        long path;
        long time;
        long score;
        String resultPath;
    }

    public TspResult tsp(int index, int count, long cost, String path, int time, TspResult ans) {
        int currPos = floydIndex.indexOf(idList.get(index));
        int index_0 = floydIndex.indexOf(idList.get(0));

        if (count == n) {
            long score = weightPath * (cost + floydMatrix[index_0][currPos]) + weightTime * time;
            if (ans.score > score) {
                ans.resultPath = path;
                ans.score = score;
                ans.path = cost + floydMatrix[index_0][currPos];
                ans.time = time;
            }
            return ans;
        }

        /*
         * 回溯步骤（BACKTRACKING STEP）
         * 循环遍历currPos结点的邻接表，将计数增加1，并按floydMatrix[currPos][i]值增加成本
         * cost + floydMatrix[currPos][i]
         */

        for (int i = 0; i < n; i++) {
            int index_i = floydIndex.indexOf(idList.get(i));
            if (!v[i]) {
                // 标记结点被访问过
                v[i] = true;
                int id = idList.get(i);
                int timeContext = (time <= timeList.get(i) ? timeList.get(i) : time) + timeMap.get(id);
                ans = tsp(i, count + 1, cost + floydMatrix[index_i][currPos], path + "," + idList.get(i), timeContext, ans);
                // 标记结点没有被访问过
                v[i] = false;
            }
        }
        return ans;
    }

    private void parseList(List<Project> projectList) {
        if (ListUtils.isEmpty(projectList)) {
        // TODO TEST CODE
            this.timeMap = new HashMap<>() {{
                put(0, 0);
                put(10011, 1000);
                put(10015, 2000);
                put(10012, 1000);
            }};

            this.timeList = new ArrayList<>() {{
                add(0);
                add(10000);
                add(30000);
                add(25000);
            }};
            this.idList = new ArrayList<>() {{
                add(0);
                add(10011);
                add(10015);
                add(10012);
//            add(40007);
            }};
        } else {
            this.idList = new ArrayList<>() {{
                add(0);
                for (Project project : projectList) {
                    add(project.getNodeId());
                }
            }};

            this.timeMap = new HashMap<>();

            this.timeList = new ArrayList<>() {{
                for (Project project : projectList) {
                    ProCache cache = cacheUtils.getCache(project.getDepartment());
                    add(cache.getContextList().size() * cache.getProject().getAvetime());
                    timeMap.put(project.getNodeId(), cache.getProject().getAvetime());
                }
            }};

        }
    }


    public TspResult getBestPath(List<Project> projects, long weightPath, long weightTime) {
        parseList(projects);

        MapNodeUtils.FloydResult floydResult = cacheUtils.getFloydMatrix();
        this.floydMatrix = floydResult.getFloydMatrix();
        this.floydIndex = floydResult.getIndex();
        this.weightPath = weightPath;
        this.weightTime = weightTime;
        // 顶点（结点）的数量
        this.n = idList.size();
        // boolean类型的数组 v 用来标记一个城市结点是否被访问过
        this.v = new boolean[n];
        // 标记第 0 个 结点已经被访问过，所以v[0]=true
        v[0] = true;

        // 查找最小权重的汉密尔顿回路 Hamiltonian Cycle
        // 输出结果ans就是最小权重的汉密尔顿回路（ Hamiltonian Cycle）
        return tsp(0, 1, 0, "0", 0, TspResult.builder().score(Long.MAX_VALUE).build());
    }
}
