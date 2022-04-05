package com.assistant.utils;

import com.assistant.model.enity.Department;
import lombok.*;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
@RequiredArgsConstructor
public class CoreUtils {
    private final CacheUtils cacheUtils;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    public class TspResult {
        long path;
        long time;
        long score;
        String resultPath;
    }

    public TspResult tsp(MapNodeUtils.FloydMatrix floydMatrix, List<Integer> timeList, Map<Integer, Integer> timeMap, long weightPath, long weightTime, List<Integer> idList, int n, boolean[] v, int index, int count, long cost, String path, int time, TspResult ans) {
        long[][] graph = floydMatrix.getFloydMatrix();

        int currPos = floydMatrix.getIndex().indexOf(idList.get(index));
        int index_0 = floydMatrix.getIndex().indexOf(idList.get(0));

        if (count == n) {
            long score = weightPath * (cost + graph[index_0][currPos]) + weightTime * time;
            if (ans.score > score) {
                ans.resultPath = path;
                ans.score = score;
                ans.path = cost + graph[index_0][currPos];
                ans.time = time;
            }
            return ans;
        }

        /*
         * 回溯步骤（BACKTRACKING STEP）
         * 循环遍历currPos结点的邻接表，将计数增加1，并按graph[currPos][i]值增加成本
         * cost + graph[currPos][i]
         */

        for (int i = 0; i < n; i++) {
            int index_i = floydMatrix.getIndex().indexOf(idList.get(i));
            if (!v[i]) {
                // 标记结点被访问过
                v[i] = true;
                int id = idList.get(i);
                int timeContext = (time <= timeList.get(i) ? timeList.get(i) : time) + timeMap.get(id);
                ans = tsp(floydMatrix, timeList, timeMap, weightPath, weightTime, idList, n, v, i, count + 1, cost + graph[index_i][currPos], path + "," + idList.get(i), timeContext, ans);
                // 标记结点没有被访问过
                v[i] = false;
            }
        }
        return ans;
    }

    public TspResult getBestPath(List<Department> departmentList, long weightPath, long weightTime) {
        MapNodeUtils.FloydMatrix floydMatrix = cacheUtils.getFloydMatrix();
//
//        List<Integer> idList = new ArrayList<>() {{
//            add(0);
//            for (Department department : departmentList) {
//                add(department.getNodeId());
//            }
//        }};

//        Map<Integer, Integer> timeMap = new HashMap<>();
//
//        List<Integer> timeList = new ArrayList<>() {{
//            for (Department department : departmentList) {
//                ProCache cache = cacheUtils.getCache(department.getDepartment());
//                add(cache.getContextList().size() * cache.getDepartment().getAvetime());
//                timeMap.put(department.getNodeId(), cache.getDepartment().getAvetime());
//            }
//        }};
        Map<Integer, Integer> timeMap = new HashMap<>() {{
            put(0, 0);
            put(10011, 1000);
            put(10015, 2000);
            put(10012, 1000);
        }};

        List<Integer> timeList = new ArrayList<>() {{
            add(0);
            add(10000);
            add(30000);
            add(25000);
        }};

        List<Integer> idList = new ArrayList<>() {{
            add(0);
            add(10011);
            add(10015);
            add(10012);
//            add(40007);
        }};
        // 顶点（结点）的数量
        int n = idList.size();

        // boolean类型的数组 v 用来标记一个城市结点是否被访问过
        boolean[] v = new boolean[n];

        // 标记第 0 个 结点已经被访问过，所以v[0]=true
        v[0] = true;
        TspResult ans = TspResult.builder()
                .score(Long.MAX_VALUE)
                .resultPath("0")
                .build();

        // 查找最小权重的汉密尔顿回路 Hamiltonian Cycle
        // 输出结果ans就是最小权重的汉密尔顿回路（ Hamiltonian Cycle）
        return tsp(floydMatrix, timeList, timeMap, weightPath, weightTime, idList, n, v, 0, 1, 0, "0", 0, ans);
    }
}
