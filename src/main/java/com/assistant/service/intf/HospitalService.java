package com.assistant.service.intf;

import com.assistant.model.enity.Project;

import java.util.List;

public interface HospitalService {
    List<Project> projectList();
    long countDeps();
}
