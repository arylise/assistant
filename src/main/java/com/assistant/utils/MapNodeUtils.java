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
    public static class AdjacencyResult {
        List<String> index;
        boolean[][] adjacencyMatrix;
        List<MapNode> mapNodes;
    }

    public AdjacencyResult adjacencyMatrix(List<MapNode> list) {
        int n = list.size();
        boolean[][] adjacencyMatrix = new boolean[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                adjacencyMatrix[i][j] = false;
            }
        }

        List<String> index = new ArrayList<>() {{
            for (MapNode m : list) {
                add(m.getNodeId());
            }
        }};

        for (MapNode m : list) {
            for (String id : m.parseNext()) {
                int i = index.indexOf(m.getNodeId());
                int j = index.indexOf(id);
                adjacencyMatrix[i][j] = true;
            }
        }
        return AdjacencyResult.builder()
                .index(index)
                .adjacencyMatrix(adjacencyMatrix)
                .build();
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    @Builder
    public static class FloydResult {
        String[][] pathMatrix;
        long[][] floydMatrix;
        List<String> index;
        List<MapNode> mapNodes;
    }

    public FloydResult floydMatrix(List<MapNode> list) {
        return floydMatrix(list, AssistantContext.FLOYD_MATRIX_ALL);
    }

    public FloydResult floydMatrixNoStair(List<MapNode> list) {
        return floydMatrix(list, AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR);
    }

    public FloydResult floydMatrixNoElevator(List<MapNode> list) {
        return floydMatrix(list, AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR);
    }

    public FloydResult floydMatrix(List<MapNode> list, String without) {

        int inf = Integer.MAX_VALUE;
        int n = list.size();
        long[][] matrix = new long[n][n];
        String[][] pathMatrix = new String[n][n];

        List<String> index = new ArrayList<>() {{
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
            if (m.parseNext() != null) {
                for (String id : m.parseNext()) {
                    int i = index.indexOf(m.getNodeId());
                    int j = index.indexOf(id);
                    long x = m.getX() - list.get(j).getX();
                    long y = m.getY() - list.get(j).getY();
                    matrix[i][j] = x * x + y * y;
                    pathMatrix[i][j] = id + ",";
                }
            }
        }

        if (!AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR.equals(without)) {
            for (MapNode m : list) {
                if (m.parseStair() != null) {
                    for (String id : m.parseStair()) {
                        int i = index.indexOf(m.getNodeId());
                        int j = index.indexOf(id);
                        long x = m.getX() - list.get(j).getX();
                        long y = m.getY() - list.get(j).getY();
                        matrix[i][j] = x * x + y * y;
                        pathMatrix[i][j] = id + ",";
                    }
                }
            }
        }

        if (!AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR.equals(without)) {
            for (MapNode m : list) {
                if (m.parseElevator() != null) {
                    for (String id : m.parseElevator()) {
                        int i = index.indexOf(m.getNodeId());
                        int j = index.indexOf(id);
                        long x = m.getX() - list.get(j).getX();
                        long y = m.getY() - list.get(j).getY();
                        matrix[i][j] = x * x + y * y;
                        pathMatrix[i][j] = id + ",";
                    }
                }
            }
        }

        for (int k = 0; k < n; k++) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    if (matrix[i][k] != inf && matrix[k][j] != inf && matrix[i][j] > matrix[i][k] + matrix[k][j]) {
                        matrix[i][j] = matrix[i][k] + matrix[k][j];
                        pathMatrix[i][j] = pathMatrix[i][k] + pathMatrix[k][j];
                    }
                }
            }
        }
        return FloydResult.builder()
                .floydMatrix(matrix)
                .pathMatrix(pathMatrix)
                .index(index)
                .build();
    }
}
