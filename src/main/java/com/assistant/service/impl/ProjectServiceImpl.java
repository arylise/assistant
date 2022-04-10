package com.assistant.service.impl;

import com.assistant.service.intf.ProjectService;
import com.assistant.utils.CacheUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {
    private final CacheUtils cacheUtils;

    /**
     * 患者体检清单
     *
     * @param username
     * @param projectList
     * @return
     */
    @Override
    public boolean create(String username, List<String> projectList) {
        // TODO
        cacheUtils.getProjectList(username);
        return false;
    }
}
