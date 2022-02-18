package com.assistant.utils;

import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DebugService implements ApplicationRunner {
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private AdminService adminService;



    @Override
    public void run(ApplicationArguments args) throws Exception {
        TestClass.showMe("overload");
//        TestClass.showMe(doctorService.password("doctor"));
//        TestClass.showMe(adminService.password("admin"));

    }
}
