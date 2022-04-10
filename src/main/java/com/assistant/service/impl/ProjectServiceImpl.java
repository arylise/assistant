package com.assistant.service.impl;

import com.assistant.mapper.ProjectMapper;
import com.assistant.model.dto.ProjectCache;
import com.assistant.model.dto.ProjectDTO;
import com.assistant.model.enity.Project;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.CacheUtils;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {
    private final CacheUtils cacheUtils;
    private ProjectMapper projectMapper;

    /**
     * 患者体检清单
     *
     * @param username
     * @param projectIdList
     * @return
     */
    @Override
    public boolean create(String username, List<String> projectIdList) {
        cacheUtils.putProjectList(username, ProjectCache.initCache(projectIdList));
        return false;
    }

    @Override
    public boolean delete(String username) {
        return cacheUtils.delProjectList(username);
    }

    @Override
    public List<ProjectDTO> getProjectStateList(String username) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(username);
            List<Project> projects = projectMapper.selectByIds(cache.getProjectList());
            return ProjectDTO.trans(projects, cache.getStateList());
        } catch (Exception e) {
            PageHelper.clearPage();
        }
        return null;
    }
}
