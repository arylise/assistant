package com.assistant.service.debugService;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DebugService implements ApplicationRunner {


    @Override
    public void run(ApplicationArguments args) throws Exception {
        System.out.println("/-----------------------/\n" +
                "/--------overload-------/\n" +
                "/-----------------------/\n");
    }
}
