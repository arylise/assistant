package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/doctor")
@PreAuthorize("hasRole('ROLE_DOCTOR')")
public class DoctorController {

    private final ProjectService projectService;
    private final DoctorService doctorService;

    @RequestMapping("/page_{name}")
    public String page(@PathVariable String name) {
        return "/doctor/page_" + name + ".html";
    }

    @RequestMapping("/doPro_{pro}")
    @ResponseBody
    public String doPro(@PathVariable String pro) {
        boolean b = projectService.doQue(pro);
        return String.valueOf(b);
    }

    @RequestMapping("/delFromPro_{username}")
    @ResponseBody
    public String delFromPro(@PathVariable String username, @CookieValue("username") String docUsername) {
        boolean b = projectService.delFromQue(doctorService.getProject(docUsername), username);
        return String.valueOf(b);
    }


//    @RequestMapping("/check_{redisName}_{name}")
//    @ResponseBody
//    public String list(@PathVariable String name,
//                       @PathVariable String redisName,
//                       @RequestParam(value = "page", defaultValue = "1") int page,
//                       @RequestParam(value = "limit", defaultValue = "20") int limit) {
//        return JSON.toJSONString(doctorService.findList(redisName, name));
//    }

    @RequestMapping("/check_queue")
    @ResponseBody
    public String checkQueue(@CookieValue("username") String username,
                             @RequestParam(value = "page", defaultValue = "1") int page,
                             @RequestParam(value = "limit", defaultValue = "20") int limit) {
        return JSON.toJSONString(doctorService.checkQueue(username));
    }

    @RequestMapping("/getPro")
    @ResponseBody
    public String getProject(@CookieValue("username") String username) {
        return doctorService.getProject(username);
    }
}
