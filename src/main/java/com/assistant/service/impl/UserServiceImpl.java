package com.assistant.service.impl;

import com.assistant.config.UserLevel;
import com.assistant.service.AdminService;
import com.assistant.service.DoctorService;
import com.assistant.service.PatientService;
import com.assistant.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.thymeleaf.util.StringUtils;

@Component
public class UserServiceImpl implements UserService {
    @Autowired
    private AdminService adminService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private PatientService patientService;

    @Override
    public String checkUser(String username, String password) {

        if(StringUtils.equals(patientService.password(username),password)){
            return UserLevel.PATIENT;
        }
        if (StringUtils.equals(doctorService.password(username), password)) {
            return UserLevel.DOCTOR;
        }
        if (StringUtils.equals(adminService.password(username), password)) {
            return UserLevel.ADMIIN;
        }
        return UserLevel.NEITHER;
    }
}
