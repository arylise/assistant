package com.assistant.temp;

import com.assistant.service.AdminService;
import com.assistant.service.DoctorService;
import com.assistant.service.impl.AdminServiceImpl;
import com.assistant.service.impl.DoctorServiceImpl;
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
