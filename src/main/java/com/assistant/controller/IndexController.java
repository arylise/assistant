package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.constant.AssistantContext;
import com.assistant.service.intf.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final UserService userService;

    @RequestMapping("/")
    public String voidRequest() {
        return "index";
    }

    @RequestMapping(value={"/index","/login","/signup","/login_error"})
    public String index(HttpServletRequest request) {
        return request.getRequestURI();
    }

    @RequestMapping("/main")
    public String main() {
        String role = userService.checkRole();
        for (String allRole : AssistantContext.ALL_ROLES) {
            if (StringUtils.equals(allRole, role)) {
                return role.toLowerCase().substring(5, role.length()) + "/main";
            }
        }
        return null;
    }
}
