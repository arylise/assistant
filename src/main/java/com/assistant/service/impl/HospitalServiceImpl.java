package com.assistant.service.impl;

import com.assistant.mapper.DepartmentMapper;
import com.assistant.mapper.ProjectMapper;
import com.assistant.model.enity.Department;
import com.assistant.model.enity.Project;
import com.assistant.service.intf.HospitalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HospitalServiceImpl implements HospitalService{

    private final DepartmentMapper departmentMapper;
    private final ProjectMapper projectMapper;

    @Override
    public List<Department> departmentList() {
        return departmentMapper.selectAll();
    }
    @Override
    public List<Project> projectList(){
        return projectMapper.selectAll();
    }

    @Override
    public long countDeps() {
        return departmentMapper.count();
    }

    @Override
    public long countPros() {
        return projectMapper.count();
    }
}
