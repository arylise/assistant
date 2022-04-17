package com.assistant.service.impl;

import com.assistant.constant.AssistantContext;
import com.assistant.model.dto.State;
import com.assistant.service.intf.PathService;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.PathUtils;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.MapUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PathServiceImpl implements PathService {
    private final PathUtils pathUtils;
    private final ProjectService projectService;
    private final CacheUtils cacheUtils;

    @Override
    public PathUtils.TspResult createPath(String patient, String action) {
        int path, time;
        String act;
        switch (action) {
            case "best":
                path = AssistantContext.pathWeight;
                time = AssistantContext.timeWeight;
                act = AssistantContext.FLOYD_MATRIX_ALL;
                break;
            case "path":
                path = AssistantContext.pathWeight;
                time = 0;
                act = AssistantContext.FLOYD_MATRIX_ALL;
                break;
            case "time":
                path = 0;
                time = AssistantContext.timeWeight;
                act = AssistantContext.FLOYD_MATRIX_ALL;

                break;
            case "nostair":
                path = AssistantContext.pathWeight;
                time = AssistantContext.timeWeight;
                act = AssistantContext.FLOYD_MATRIX_ALL_WITHOUT_STAIR;
                break;
            default:
                return null;
        }
        Map<String, State> projectMap = projectService.checkProjectList(patient).getProjectMap();
        if (MapUtils.isEmpty(projectMap) || !projectMap.containsValue(State.uncheck)) {
            return null;
        }
        List<String> projectList = new ArrayList<>() {{
            for (String s : projectMap.keySet()) {
                if (State.uncheck.equals(projectMap.get(s))) {
                    add(s);
                }
            }
        }};
        PathUtils.TspResult bestPath = pathUtils.getBestPath(projectList, path, time, act);
        cacheUtils.putPatientPath(patient, bestPath);
        return bestPath;
    }
}
