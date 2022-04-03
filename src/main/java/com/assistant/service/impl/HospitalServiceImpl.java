package com.assistant.service.impl;

import com.assistant.mapper.DepartmentMapper;
import com.assistant.model.enity.Department;
import com.assistant.service.intf.HospitalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HospitalServiceImpl implements HospitalService{

    private final DepartmentMapper departmentMapper;

    @Override
    public List<Department> departmentList() {
        return departmentMapper.selectAll();
    }

    @Override
    public long countDeps() {
        return departmentMapper.count();
    }

}
