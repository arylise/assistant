package com.assistant.service.impl;

import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.PatientService;
import com.assistant.service.intf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserServiceImpl implements UserService {
    @Autowired
    private AdminService adminService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private PatientService patientService;

//    @Override
//    public String checkUser(String username, String password) {
//
//        if(StringUtils.equals(patientService.password(username),password)){
//            return Role.PATIENT;
//        }
//        if (StringUtils.equals(doctorService.password(username), password)) {
//            return Role.DOCTOR;
//        }
//        if (StringUtils.equals(adminService.password(username), password)) {
//            return Role.ADMIIN;
//        }
//        return Role.NEITHER;
//    }
}
