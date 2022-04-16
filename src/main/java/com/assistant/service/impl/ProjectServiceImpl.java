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

    @Override
    public boolean create(String patient, List<String> projectIdList) {
        return cacheUtils.putProjectList(patient, ProjectCache.initCache(projectIdList));
    }

    @Override
    public boolean delete(String patient) {
        return cacheUtils.delProjectList(patient);
    }

    @Override
    public DataList check(String patient) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(patient);
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
    public ProjectCache checkProjectList(String patient) {
        try {
            return cacheUtils.getProjectList(patient);
        } catch (Exception e) {
            PageHelper.clearPage();
        }
        return null;
    }

    @Override
    public boolean appendOrFix(String patient, List<String> projectIdList) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(patient);
            if (cache == null) {
                cache = ProjectCache.builder().projectMap(new HashMap<>()).build();
            }
            boolean b = cache.appendOrFix(projectIdList);
            return b && cacheUtils.putProjectList(patient, cache);
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateState(String patient, String project, ProjectDTO.State state) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(patient);
            cache.getProjectMap().put(project, state);
            return cacheUtils.putProjectList(patient, cache);
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean remove(String patient, List<String> projectIdList) {
        try {
            ProjectCache cache = cacheUtils.getProjectList(patient);
            boolean b = cache.remove(projectIdList);
            return b && cacheUtils.putProjectList(patient, cache);
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
