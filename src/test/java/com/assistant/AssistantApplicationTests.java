package com.assistant;

import com.assistant.utils.TestClass;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
class AssistantApplicationTests {

    @Test
    void contextLoads() {

        PasswordEncoder encoder =  new BCryptPasswordEncoder();

        String str = "123";
        TestClass.showMe(encoder.encode(str));
        str = "doctor";
        TestClass.showMe(encoder.encode(str));
        str = "arylise";
        TestClass.showMe(encoder.encode(str));
        str = "admin";
        TestClass.showMe(encoder.encode(str));
    }

}
