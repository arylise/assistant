package com.assistant.service.intf;

import com.assistant.model.dto.ProjectDTO;

import java.util.List;

public interface ProjectService {
    boolean create(String username, List<String> projectIdList);

    boolean delete(String username);

    List<ProjectDTO> getProjectStateList(String username);
}
