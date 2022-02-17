package com.assistant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String voidRequest() {
        return "index";
    }

    @RequestMapping("/test")
    public String test() {
        return "test";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/main")
    public String main() {
        return "main";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/signup")
    public String signup() {
        return "signup";
    }

    @RequestMapping("/loginError")
    public String loginError() {
        return "loginError";
    }
}
