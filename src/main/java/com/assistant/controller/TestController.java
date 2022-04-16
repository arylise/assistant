package com.assistant.controller;

import com.assistant.service.function.UserDetailsServiceImpl;
import com.assistant.utils.RedisUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.MessageFormat;

@Controller
@RequiredArgsConstructor
@RequestMapping("/test")
public class TestController {

    private final RedisUtils redisUtils;
private final UserDetailsServiceImpl userDetailsService;
    @RequestMapping("/test_{n}")
    public String test(@PathVariable String n) {
        return MessageFormat.format("/test/test_{0}.html", n);
    }
}
