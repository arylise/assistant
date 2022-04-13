package com.assistant.service.impl;

import com.assistant.mapper.ProjectMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.dto.ProjectCache;
import com.assistant.model.dto.ProjectDTO;
import com.assistant.model.enity.Project;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.CacheUtils;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
        return cacheUtils.putProjectList(username, ProjectCache.initCache(projectIdList));
    }

    @Override
    public boolean delete(String username) {
        return cacheUtils.delProjectList(username);
    }

    @Override
    public DataList check(String username) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(username);
            List<Project> projects = projectMapper.selectByIds(new ArrayList<>(cache.getProjectMap().keySet()));
            List<ProjectDTO> trans = ProjectDTO.trans(projects, new ArrayList<>(cache.getProjectMap().values()));
            return DataList.builder().data(trans).count(trans.size()).build();
        } catch (Exception e) {
            PageHelper.clearPage();
        }
        return null;
    }

    @Override
    public ProjectCache checkProjectList(String username) {
        try {
            return cacheUtils.getProjectList(username);
        } catch (Exception e) {
            PageHelper.clearPage();
        }
        return null;
    }

    @Override
    public boolean append(String username, List<String> projectIdList) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(username);
            boolean b = cache.append(projectIdList);
            return b && cacheUtils.putProjectList(username, cache);
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateState(String username, String project, ProjectDTO.State state) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(username);
            cache.getProjectMap().put(project, state);
            return cacheUtils.putProjectList(username, cache);
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean remove(String username, List<String> projectIdList) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(username);
            boolean b = cache.remove(projectIdList);
            return b && cacheUtils.putProjectList(username, cache);
        } catch (Exception e) {
            return false;
        }
    }
}
