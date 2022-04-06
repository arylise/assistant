package com.assistant.controller;

import com.assistant.service.intf.QueueService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/doctor")
@PreAuthorize("hasRole('ROLE_DOCTOR')")
public class DoctorController {

    private final QueueService queueService;

    @RequestMapping("/page_{name}")
    public String page(@PathVariable String name) {
        return "/doctor/page_" + name + ".html";
    }

    @RequestMapping("/doPro_{pro}")
    @ResponseBody
    public String doPro(@PathVariable String pro) {
        boolean b = queueService.doQueue(pro);
        return String.valueOf(b);
    }

    @RequestMapping("/delFromPro_{pro}_{username}")
    @ResponseBody
    public String delFromPro(@PathVariable String pro, @PathVariable String username) {
        boolean b = queueService.delFromQueue(pro, username);
        return String.valueOf(b);
    }
}
