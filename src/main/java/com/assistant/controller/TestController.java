package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.service.intf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static com.assistant.constant.Role.*;

import java.util.Iterator;

@Controller
public class TestController {
    @RequestMapping("/test")
    public String test(@RequestParam("n") String n) {
        return "/test/test"+n+".html";
    }
}
