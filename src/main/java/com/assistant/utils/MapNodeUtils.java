package com.assistant.utils;

import com.assistant.constant.AssistantContext;
import com.assistant.model.enity.MapNode;
import lombok.*;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class MapNodeUtils {

    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    @Builder
    public class AdjacencyMatrix {
        List<Integer> index;
        boolean[][] adjacencyMatrix;
        List<MapNode> mapNode;
    }

    public AdjacencyMatrix adjacencyMatrix(List<MapNode> list) {
        int n = list.size();
        boolean[][] adjacencyMatrix = new boolean[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                adjacencyMatrix[i][j] = false;
            }
        }

        List<Integer> index = new ArrayList<>() {{
            for (MapNode m : list) {
                add(m.getNodeId());
            }
        }};

        for (MapNode m : list) {
            for (Integer integer : m.listOfNext()) {
                int i = index.indexOf(m.getNodeId());
                int j = index.indexOf(integer);
                adjacencyMatrix[i][j] = true;
            }
        }
        return AdjacencyMatrix.builder()
                .index(index)
                .adjacencyMatrix(adjacencyMatrix)
                .build();
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    @Builder
    public class FloydMatrix {
        String[][] pathMatrix;
        int[][] floydMatrix;
        List<Integer> index;
        List<MapNode> mapNode;
    }

    public FloydMatrix floydMatrix(List<MapNode> list) {
        return floydMatrix(list, AssistantContext.FLOYD_MATRIX_ALL);
    }

    public FloydMatrix floydMatrixNoStair(List<MapNode> list) {
        return floydMatrix(list, AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR);
    }

    public FloydMatrix floydMatrixNoElevator(List<MapNode> list) {
        return floydMatrix(list, AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR);
    }

    public FloydMatrix floydMatrix(List<MapNode> list, String without) {

        int inf = Integer.MAX_VALUE;
        int n = list.size();
        int[][] matrix = new int[n][n];
        String[][] pathMatrix = new String[n][n];

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
            if (m.listOfNext() != null) {
                for (Integer id : m.listOfNext()) {
                    int i = index.indexOf(m.getNodeId());
                    int j = index.indexOf(id);
                    int x = m.getX() - list.get(j).getX();
                    int y = m.getY() - list.get(j).getY();
                    matrix[i][j] = x * x + y * y;
                    pathMatrix[i][j] = "," + m.getNodeId() + "," + id;
                }
            }
        }

        if (!AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR.equals(without)) {
            for (MapNode m : list) {
                if (m.listOfStair() != null) {
                    for (Integer id : m.listOfStair()) {
                        int i = index.indexOf(m.getNodeId());
                        int j = index.indexOf(id);
                        int x = m.getX() - list.get(j).getX();
                        int y = m.getY() - list.get(j).getY();
                        matrix[i][j] = x * x + y * y;
                        pathMatrix[i][j] = "," + m.getNodeId() + "," + id;
                    }
                }
            }
        }

        if (!AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR.equals(without)) {
            for (MapNode m : list) {
                if (m.listOfElevator() != null) {
                    for (Integer id : m.listOfElevator()) {
                        int i = index.indexOf(m.getNodeId());
                        int j = index.indexOf(id);
                        int x = m.getX() - list.get(j).getX();
                        int y = m.getY() - list.get(j).getY();
                        matrix[i][j] = x * x + y * y;
                        pathMatrix[i][j] = "," + m.getNodeId() + "," + id;
                    }
                }
            }
        }

        for (int k = 0; k < n; k++) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    if (matrix[i][k] != inf && matrix[k][j] != inf && matrix[i][j] > matrix[i][k] + matrix[k][j]) {
                        matrix[i][j] = matrix[i][k] + matrix[k][j];
                        pathMatrix[i][j] = pathMatrix[i][k].split(",[\\w]+$")[0] + pathMatrix[k][j];
                    }
                }
            }
        }
        return FloydMatrix.builder()
                .floydMatrix(matrix)
                .pathMatrix(pathMatrix)
                .index(index)
                .build();
    }
}
