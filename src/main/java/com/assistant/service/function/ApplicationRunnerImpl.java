package com.assistant.service.function;

import com.alibaba.fastjson.JSONObject;
import com.assistant.constant.AssistantContext;
import com.assistant.model.enity.MapNode;
import com.assistant.service.intf.MapNodeService;
import com.assistant.utils.MapNodeUtils;
import com.assistant.utils.RedisUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class ApplicationRunnerImpl implements ApplicationRunner {
    private final MapNodeService mapNodeService;
    private final MapNodeUtils mapNodeUtils;
    private final RedisUtils redisUtils;

    @Override
    public void run(ApplicationArguments args) {
        List<MapNode> all = mapNodeService.findAll();
        JSONObject floydMatrixAll = mapNodeUtils.floydMatrix(all);
        redisUtils.set(AssistantContext.FLOYD_MATRIX_ALL, floydMatrixAll.toString());
        floydMatrixAll = mapNodeUtils.floydMatrixNoStair(all);
        redisUtils.set(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR, floydMatrixAll.toString());
        floydMatrixAll = mapNodeUtils.floydMatrixNoElevator(all);
        redisUtils.set(AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR, floydMatrixAll.toString());
        TestClass.showMe("overLoad!");
    }
}
