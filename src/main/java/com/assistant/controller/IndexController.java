package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.constant.AssistantContext;
import com.assistant.mapper.MessageMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.enity.Message;
import com.assistant.service.intf.UserService;
import com.assistant.utils.SecurityUtils;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, String> checkRole() {
        return new HashMap<>() {{
            put("role", SecurityUtils.getRole());
            put("name", SecurityUtils.getUsername());
        }};
    }

    @RequestMapping("/getLevel")
    @ResponseBody
    public int getLevel() {
        return AssistantContext.level;
    }

    @PostMapping("/signup.do")
    public String signupPatient(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean ans = userService.insertPatient(username, password);
        return ans ? "signup_success" : "signup_error";
    }

    @RequestMapping("/message.write")
    public String writeMessage(@RequestBody String message) {
        String role = SecurityUtils.getRole();
        if (StringUtils.isEmpty(role)) {
            return "/";
        }
        String[] split = message.split("=");
        if (split[1] == null){
            return "/";
        }
        String msgStr = null;
        msgStr = URLDecoder.decode(split[1], StandardCharsets.UTF_8);
        if (StringUtils.isEmpty(msgStr)){
            return "/";
        }
        Message msg = new Message(SecurityUtils.getUsername(), SecurityUtils.getName(), SecurityUtils.getRole(), msgStr);
        messageMapper.insert(msg);
        return "/message_check.html";
    }

    @RequestMapping("/message.check")
    @ResponseBody
    public DataList writeMessage(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "20") int limit) {
        String role = SecurityUtils.getRole();
        if (StringUtils.isEmpty(role)) {
            return null;
        }
        PageHelper.startPage(page, limit);
        List<Message> msgList = messageMapper.select();
        return DataList.builder().data(msgList).count(msgList.size()).build();
    }

    @RequestMapping("/message_{act}")
    public String gotoMessage(@PathVariable("act") String act) {
        String role = SecurityUtils.getRole();
        if (StringUtils.isEmpty(role)) {
            return null;
        }
        return MessageFormat.format("/message_{0}.html", act);
    }
}
