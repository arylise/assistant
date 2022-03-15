package com.assistant.service.intf;

import com.assistant.model.enity.Department;
import com.assistant.model.enity.Project;

import java.util.List;

public interface HospitalService {
    List<Department> departmentList();

    List<Project> projectList();

    long countDeps();

    long countPros();
}
