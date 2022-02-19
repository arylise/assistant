package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.service.intf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.assistant.constant.Role.*;

import java.util.Iterator;

@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/datatable")
    public String test() {
        return "/test/datatable.html";
    }
}
