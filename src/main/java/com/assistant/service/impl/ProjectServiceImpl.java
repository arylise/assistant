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
import org.apache.commons.collections4.MapUtils;
import org.springframework.data.util.Pair;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {
    private final CacheUtils cacheUtils;
    private final ProjectMapper projectMapper;

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
            if (cache == null) {
                return DataList.builder().count(0).build();
            }
            List<Project> projects = projectMapper.selectByIds(new ArrayList<>(cache.getProjectMap().keySet()));
            List<ProjectDTO> trans = ProjectDTO.trans(projects, new ArrayList<>(cache.getProjectMap().values()));
            return DataList.builder().data(trans).count(trans.size()).build();
        } catch (Exception ignored) {
        } finally {
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
    public boolean appendOrFix(String username, List<String> projectIdList) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(username);
            if (cache == null) {
                cache = ProjectCache.builder().projectMap(new HashMap<>()).build();
            }
            boolean b = cache.appendOrFix(projectIdList);
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

    @Override
    public List<Pair<String, String>> getAllProjectName() {
        List<String> list = projectMapper.selectAllName();
        return new ArrayList<>() {{
            for (String s : list) {
                add(Pair.of(s, s));
            }
        }};
    }

    @Override
    public Set<String> checkProjectsAllName(String patient) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(patient);
            if (cache == null || MapUtils.isEmpty(cache.getProjectMap())) {
                return new HashSet<>();
            }
            return cache.getProjectMap().keySet();
        } catch (Exception ignored) {
        }
        return null;
    }
}
