package com.assistant.service.function;

import com.assistant.constant.AssistantContext;
import com.assistant.mapper.MapNodeMapper;
import com.assistant.mapper.ProjectMapper;
import com.assistant.model.dto.QueueCache;
import com.assistant.model.enity.MapNode;
import com.assistant.model.enity.Project;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.MapNodeUtils;
import com.assistant.utils.TestClass;
import com.github.pagehelper.util.StringUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class ApplicationRunnerImpl implements ApplicationRunner {
    private final MapNodeMapper mapNodeMapper;
    private final MapNodeUtils mapNodeUtils;
    private final CacheUtils cacheUtils;
    private final ProjectMapper projectMapper;

    @Override
    public void run(ApplicationArguments args) {
        // 地图节点缓存
        List<MapNode> all = mapNodeMapper.findAll();
        MapNodeUtils.FloydResult floydResult = mapNodeUtils.floydMatrix(all);
        cacheUtils.putFloydMatrix(floydResult);
        floydResult = mapNodeUtils.floydMatrixNoStair(all);
        cacheUtils.putFloydMatrixWithoutStair(floydResult);
        floydResult = mapNodeUtils.floydMatrixNoElevator(all);
        cacheUtils.putFloydMatrixWithoutElevator(floydResult);
        // 科室缓存
        List<Project> departments = projectMapper.selectAll();
        if (departments != null) {
            for (Project d : departments) {
                QueueCache proCache = QueueCache.builder()
                        .project(d)
                        .nameList(new ArrayList<>())
                        .timestamp(new ArrayList<>())
                        .build();
                // TODO 缓存数据的解耦合,队列和project信息解耦
                cacheUtils.putQueueCache(d.getProject(), proCache);
            }
        }
        List<MapNode> collect = all.stream().filter(o -> StringUtil.isNotEmpty(o.getElevatorId())).collect(Collectors.toList());
        cacheUtils.putElevatorMap(collect);

        for (int i = 1; i <= AssistantContext.level; i++) {
            List<MapNode> list = mapNodeMapper.getNodesByLevel(i);
            MapNodeUtils.AdjacencyResult adjacencyResult = mapNodeUtils.adjacencyMatrix(list);
            adjacencyResult.setMapNodes(mapNodeMapper.getNodesByLevel(i));
            cacheUtils.putAdjacencyMatrixByLevel(i, adjacencyResult);
        }

        TestClass.showMe("overLoad!");
    }
}
