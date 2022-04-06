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

    public ProCache getCache(String pro) {
        try {
            String key = AssistantContext.appendQueuePrefix(pro);
            String s = redisUtils.get(key);
            return JSON.parseObject(s, ProCache.class);
        } catch (Exception ignored) {
            return ProCache.builder().build();
        }
    }

    public boolean putCache(String pro, ProCache proCache) {
        String key = AssistantContext.appendQueuePrefix(pro);
        return redisUtils.set(key, JSON.toJSONString(proCache));
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
}