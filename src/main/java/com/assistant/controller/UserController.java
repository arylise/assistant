package com.assistant.controller;


import com.assistant.service.intf.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @RequestMapping("/checkRole")
    @ResponseBody
    public String checkRole() {
        return userService.checkRole();
    }

    @PostMapping("/signup.do")
    public String signupPatient(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean ans = userService.insertPatient(username, password);
        if (ans) {
            return "signup_success";
        }
        return "signup_error";
    }

}
