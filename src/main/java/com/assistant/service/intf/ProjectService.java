package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import com.assistant.model.dto.ProjectCache;
import com.assistant.model.dto.State;
import org.springframework.data.util.Pair;

import java.util.List;
import java.util.Set;

public interface ProjectService {
    boolean create(String patient, List<String> projectIdList);

    boolean delete(String patient);

    DataList check(String patient);

    ProjectCache checkProjectList(String patient);

    boolean appendOrFix(String patient, List<String> projectOdList);

    boolean updateState(String patient, String project, State state);

    boolean remove(String patient, List<String> projectIdList);

    List<Pair<String, String>> getAllProjectName();

    Set<String> checkProjectsAllName(String patient);

    DataList getQue(String patient);
}
