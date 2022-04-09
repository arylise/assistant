package com.assistant.service.impl;

import com.assistant.mapper.PatientMapper;
import com.assistant.model.enity.Patient;
import com.assistant.model.enity.Project;
import com.assistant.service.intf.PatientService;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.CoreUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PatientServiceImpl implements PatientService {

    private final PatientMapper patientMapper;
    private final ProjectService projectService;
    private final CoreUtils coreUtils;

    @Override
    public String password(String username) {
        return patientMapper.password(username);
    }

    @Override
    public boolean insertFast(String username, String password) {
        //md5加密
        password = new BCryptPasswordEncoder().encode(password);
        return patientMapper.insert(username, password);
    }

    @Override
    public long count() {
        return patientMapper.count();
    }

    @Override
    public List<Patient> selectAll() {
        return patientMapper.selectAll();
    }

    @Override
    public boolean register(String pro, String username) {
        return projectService.regQue(pro, username);
    }

    @Override
    public List<String> getPath(String username, int weightPath, int weightTime) {
        List<Project> projectList = null;
        List<String> bestPath = coreUtils.getBestPath(projectList,weightPath,weightTime).parsePath();
        return bestPath;
    }
}
