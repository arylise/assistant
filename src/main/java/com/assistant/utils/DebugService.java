package com.assistant.utils;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DebugService implements ApplicationRunner {
    @Override
    public void run(ApplicationArguments args) {
        TestClass.showMe("overload");
    }
}
