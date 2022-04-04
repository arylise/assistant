package com.assistant.utils;

import com.alibaba.fastjson.JSON;
import com.assistant.constant.AssistantContext;
import com.assistant.model.dto.ProCache;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CacheUtils {

    private final RedisUtils redisUtils;

    public ProCache getCache(String dep) {
        try {
            String key = AssistantContext.appendDepartmentPrefix(dep);
            String s = redisUtils.get(key);
            return JSON.parseObject(s, ProCache.class);
        } catch (Exception ignored) {
            return ProCache.builder().build();
        }
    }

    public boolean putCache(String dep, ProCache proCache) {
        String key = AssistantContext.appendDepartmentPrefix(dep);
        return redisUtils.set(key, JSON.toJSONString(proCache));
    }


    public boolean putFloydMatrix(MapNodeUtils.FloydMatrix floydMatrix) {
        return putFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL, floydMatrix);
    }

    public boolean putFloydMatrixWithoutStair(MapNodeUtils.FloydMatrix floydMatrix) {
        return putFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR, floydMatrix);
    }

    public boolean putFloydMatrixWithoutElevator(MapNodeUtils.FloydMatrix floydMatrix) {
        return putFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR, floydMatrix);
    }

    private boolean putFloydMatrix(String way, MapNodeUtils.FloydMatrix floydMatrix) {
        return redisUtils.set(way, JSON.toJSONString(floydMatrix));
    }


    public MapNodeUtils.FloydMatrix getFloydMatrix() {
        return getFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL);
    }

    public MapNodeUtils.FloydMatrix getFloydMatrixWithoutStair() {
        return getFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR);
    }

    public MapNodeUtils.FloydMatrix getFloydMatrixWithoutElevator() {
        return getFloydMatrix(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR);
    }

    private MapNodeUtils.FloydMatrix getFloydMatrix(String way) {
        try {
            String s = redisUtils.get(way);
            return JSON.parseObject(s, MapNodeUtils.FloydMatrix.class);
        } catch (Exception ignored) {
            return MapNodeUtils.FloydMatrix.builder().build();
        }
    }
}
