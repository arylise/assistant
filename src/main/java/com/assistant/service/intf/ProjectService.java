package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import com.assistant.model.dto.ProjectCache;
import com.assistant.model.dto.ProjectDTO;

import java.util.List;

public interface ProjectService {
    boolean create(String username, List<String> projectIdList);

    boolean delete(String username);

    DataList check(String username);

    ProjectCache checkProjectList(String username);

    boolean append(String username, List<String> projectOdList);

    boolean updateState(String username, String project, ProjectDTO.State state);

    boolean remove(String username, List<String> projectIdList);
}
