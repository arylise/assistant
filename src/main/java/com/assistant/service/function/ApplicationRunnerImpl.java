package com.assistant.service.function;

import com.assistant.mapper.DepartmentMapper;
import com.assistant.model.dto.ProCache;
import com.assistant.model.enity.Department;
import com.assistant.model.enity.MapNode;
import com.assistant.service.intf.MapNodeService;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.MapNodeUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ApplicationRunnerImpl implements ApplicationRunner {
    private final MapNodeService mapNodeService;
    private final MapNodeUtils mapNodeUtils;
    private final CacheUtils cacheUtils;
    private final DepartmentMapper departmentMapper;

    @Override
    public void run(ApplicationArguments args) {
        // 地图节点缓存
        List<MapNode> all = mapNodeService.findAll();
        MapNodeUtils.FloydMatrix floydMatrixAll = mapNodeUtils.floydMatrix(all);
        cacheUtils.putFloydMatrix(floydMatrixAll);
        floydMatrixAll = mapNodeUtils.floydMatrixNoStair(all);
        cacheUtils.putFloydMatrixWithoutStair(floydMatrixAll);
        floydMatrixAll = mapNodeUtils.floydMatrixNoElevator(all);
        cacheUtils.putFloydMatrixWithoutElevator(floydMatrixAll);
        // 科室缓存
        List<Department> departments = departmentMapper.selectAll();
        if (departments != null) {
            for (Department d : departments) {
                ProCache proCache = ProCache.builder()
                        .department(d)
                        .contextList(new ArrayList<>())
                        .build();
                cacheUtils.putCache(d.getDepartment(), proCache);
            }
        }


        TestClass.showMe("overLoad!");
    }
}
