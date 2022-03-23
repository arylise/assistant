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

    @NoArgsConstructor
    @AllArgsConstructor
    public class FloydMatrix {
        public List<Integer> index;
        public int[][] matrix;
        String[][] pathMatrix;
    }

    public FloydMatrix getFloydMatrix(List<MapNode> list) {
        int inf = Integer.MAX_VALUE;
        int n = list.size();
        int[][] matrix = new int[n][n];
        String[][] pathMatrix = new String[n][n];
        TestClass.showMe(list.toString());

        List<Integer> index = new ArrayList<>() {{
            for (MapNode m : list) {
                add(m.getNodeId());
            }
        }};

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = i == j ? 0 : inf;
                pathMatrix[i][j] = "";
            }
        }

        for (MapNode m : list) {
            for (Integer id : m.nextNodeList()) {
                int i = index.indexOf(m.getNodeId());
                int j = index.indexOf(id);
                int x = m.getX() - list.get(j).getX();
                int y = m.getY() - list.get(j).getY();
                matrix[i][j] = x * x + y * y;
                pathMatrix[i][j] = "" + m.getNodeId() + "," + id;
            }
        }

        for (int k = 0; k < n; k++) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    if (matrix[i][k] != inf && matrix[k][j] != inf && matrix[i][j] > matrix[i][k] + matrix[k][j]) {
                        matrix[i][j] = matrix[i][k] + matrix[k][j];
                        pathMatrix[i][j] = pathMatrix[i][k].split(",[\\w]+$")[0] + pathMatrix[k][j];
                        TestClass.showMe(pathMatrix[i][j]);
                    }
                }
            }
        }
        return new FloydMatrix(index, matrix, pathMatrix);
    }
}
