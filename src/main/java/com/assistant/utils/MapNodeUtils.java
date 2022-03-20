package com.assistant.utils;

import com.assistant.model.enity.MapNode;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class MapNodeUtils {

    @NoArgsConstructor
    @AllArgsConstructor
    public class AdjacencyMatrix {
        public List<Integer> index;
        public boolean[][] matrix;
    }

    public AdjacencyMatrix getAdjacencyMatrix(List<MapNode> list) {
        int n = list.size();
        boolean[][] ans = new boolean[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                ans[i][j] = false;
            }
        }

        List<Integer> index = new ArrayList<>() {{
            int i = 0;
            for (MapNode m : list) {
                add(m.getNodeId());
            }
        }};

        for (MapNode m : list) {
            for (Integer integer : m.nextNodeList()) {
                int i = index.indexOf(m.getNodeId());
                int j = index.indexOf(integer);
                ans[i][j] = true;
            }
        }


        return new AdjacencyMatrix(index, ans);
    }
}
