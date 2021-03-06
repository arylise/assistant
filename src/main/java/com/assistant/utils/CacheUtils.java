package com.assistant.utils;

import com.alibaba.fastjson.JSON;
import com.assistant.constant.AssistantContext;
import com.assistant.model.dto.ProjectCache;
import com.assistant.model.dto.QueueCache;
import com.assistant.model.enity.MapNode;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.thymeleaf.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CacheUtils {

    private final RedisUtils redisUtils;

    public QueueCache getQueueCache(String project) {
        try {
            String key = AssistantContext.appendQueuePrefix(project);
            String s = redisUtils.get(key);
            return JSON.parseObject(s, QueueCache.class);
        } catch (Exception ignored) {
            return QueueCache.builder().build();
        }
    }

    public boolean putQueueCache(String project, QueueCache proCache) {
        return redisUtils.set(AssistantContext.appendQueuePrefix(project), JSON.toJSONString(proCache));
    }


    public boolean putFloydMatrix(MapNodeUtils.FloydResult floydMatrix) {
        return putFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL, floydMatrix);
    }

    public boolean putFloydMatrixWithoutStair(MapNodeUtils.FloydResult floydMatrix) {
        return putFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR, floydMatrix);
    }

    public boolean putFloydMatrixWithoutElevator(MapNodeUtils.FloydResult floydMatrix) {
        return putFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR, floydMatrix);
    }

    private boolean putFloydMatrix(String way, MapNodeUtils.FloydResult floydMatrix) {
        return redisUtils.set(way, JSON.toJSONString(floydMatrix));
    }


    public MapNodeUtils.FloydResult getFloydMatrix() {
        return getFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL);
    }

    public MapNodeUtils.FloydResult getFloydMatrixWithoutStair() {
        return getFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR);
    }

    public MapNodeUtils.FloydResult getFloydMatrixWithoutElevator() {
        return getFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR);
    }

    private MapNodeUtils.FloydResult getFloydMatrix(String way) {
        try {
            String s = redisUtils.get(way);
            return JSON.parseObject(s, MapNodeUtils.FloydResult.class);
        } catch (Exception ignored) {
            return MapNodeUtils.FloydResult.builder().build();
        }
    }

    public boolean putElevatorMap(List<MapNode> elevatorMap) {
        return redisUtils.set(AssistantContext.ELEVATOR_MAP, JSON.toJSONString(elevatorMap));
    }

    public Map<String, MapNode> getElevatorMap() {
        try {
            String s = redisUtils.get(AssistantContext.ELEVATOR_MAP);
            return JSON.parseArray(s, MapNode.class).stream().collect(Collectors.toMap(MapNode::getNodeId, o -> o));
        } catch (Exception ignored) {
            return new HashMap<>();
        }
    }

    public ProjectCache getProjectList(String patient) {
        try {
            String s = redisUtils.get(AssistantContext.appendProjectPrefix(patient));
            if (StringUtils.isEmpty(s)) {
                return ProjectCache.builder().projectMap(new HashMap<>()).build();
            }
            return JSON.parseObject(s, ProjectCache.class);
        } catch (Exception ignored) {
            return null;
        }
    }

    public boolean putProjectList(String patient, ProjectCache projectCache) {
        return redisUtils.set(AssistantContext.appendProjectPrefix(patient), JSON.toJSONString(projectCache));
    }

    public boolean delProjectList(String patient) {
        return redisUtils.del(AssistantContext.appendProjectPrefix(patient));
    }

    public boolean putPatientPath(String patient, PathUtils.TspResult bestPath) {
        return redisUtils.set(AssistantContext.appendPatientPathPrefix(patient), JSON.toJSONString(bestPath));
    }

    public PathUtils.TspResult getPatientPath(String patient) {
        try {
            String s = redisUtils.get(AssistantContext.appendPatientPathPrefix(patient));
            if (StringUtils.isEmpty(s)) {
                return null;
            }
            return JSON.parseObject(s, PathUtils.TspResult.class);
        } catch (Exception ignored) {
            return null;
        }
    }

    public boolean putAdjacencyMatrixByLevel(int i, MapNodeUtils.AdjacencyResult adjacencyResult) {
        return redisUtils.set(AssistantContext.appenfAdjacencyPrefix(i), JSON.toJSONString(adjacencyResult));
    }

    public MapNodeUtils.AdjacencyResult getAdjacencyMatrixByLevel(int i) {
        try {
            String s = redisUtils.get(AssistantContext.appenfAdjacencyPrefix(i));
            if (StringUtils.isEmpty(s)) {
                return null;
            }
            return JSON.parseObject(s, MapNodeUtils.AdjacencyResult.class);
        } catch (Exception ignored) {
            return null;
        }
    }
}
