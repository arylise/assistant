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

    @RequestMapping("/doPro_{dep}")
    @ResponseBody
    public String doPro(@PathVariable String dep) {
        boolean b = queueService.doQueue(dep);
        return String.valueOf(b);
    }

    @RequestMapping("/delFromPro_{dep}_{username}")
    @ResponseBody
    public String delFromPro(@PathVariable String dep, @PathVariable String username) {
        boolean b = queueService.delFromQueue(dep, username);
        return String.valueOf(b);
    }
}
