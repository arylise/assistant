package com.assistant.service.intf;

import com.assistant.utils.PathUtils;

public interface PathService {

    PathUtils.TspResult createPath(String username, String action);
}
