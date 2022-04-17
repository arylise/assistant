package com.assistant.service.intf;

import com.assistant.utils.MapNodeUtils;
import com.assistant.utils.PathUtils;

import java.util.Map;

public interface PathService {

    PathUtils.TspResult createPath(String patient, String action);

    PathUtils.TspResult checkPath(String patient);

    Map<Integer, MapNodeUtils.AdjacencyResult> node();

}
