package com.assistant.service.intf;

import com.assistant.model.enity.Department;

import java.util.List;

public interface HospitalService {
    List<Department> departmentList();
    long countDeps();
}
