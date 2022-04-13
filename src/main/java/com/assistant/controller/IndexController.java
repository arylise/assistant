package com.assistant.controller;

import com.assistant.mapper.MessageMapper;
import com.assistant.model.enity.Message;
import com.assistant.service.intf.UserService;
import com.assistant.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.MessageFormat;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final UserService userService;
    private final MessageMapper messageMapper;

    @RequestMapping("/")
    public String voidRequest() {
        return "index";
    }

    @RequestMapping(value = {"/index", "/login", "/signup", "/login_error"})
    public String index(HttpServletRequest request) {
        return request.getRequestURI();
    }

    @RequestMapping("/main")
    public String main() {
        return MessageFormat.format("{0}/main", SecurityUtils.getRole());
    }

    @RequestMapping("/page_{name}")
    public String page(@PathVariable String name) {
        return MessageFormat.format("{0}/page_{1}.html", SecurityUtils.getRole(), name);
    }

    @RequestMapping("/checkRole")
    @ResponseBody
    public String checkRole() {
        return SecurityUtils.getRole();
    }

    @PostMapping("/signup.do")
    public String signupPatient(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean ans = userService.insertPatient(username, password);
        return ans ? "signup_success" : "signup_error";
    }

    @RequestMapping("/writeMessage")
    @ResponseBody
    public void writeMessage(@RequestParam("message") String message, @RequestParam(value = "answerId", required = false, defaultValue = "") String answerId,@RequestParam("incognito") Boolean incognito) {
        Message msg = new Message();
        msg.setMsg(message);
        msg.setAnswerId(answerId);
        if (incognito){
            msg.setSpeakerUsername(SecurityUtils.getUsername());
            msg.setSpeakerRole(SecurityUtils.getRole());
        }
//        return messageMapper.insert();
    }
}
