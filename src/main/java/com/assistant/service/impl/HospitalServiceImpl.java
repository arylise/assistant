package com.assistant.service.impl;

import com.assistant.mapper.ProjectMapper;
import com.assistant.model.enity.Project;
import com.assistant.service.intf.HospitalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HospitalServiceImpl implements HospitalService{

    private final ProjectMapper projectMapper;

    @Override
    public List<Project> projectList() {
        return projectMapper.selectAll();
    }

    @Override
    public long countDeps() {
        return projectMapper.count();
    }

}
