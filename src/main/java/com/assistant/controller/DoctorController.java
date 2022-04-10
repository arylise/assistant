package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.constant.AssistantContext;
import com.assistant.model.dto.DataList;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.QueueService;
import com.assistant.service.intf.UserService;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@RequestMapping("/doctor")
@PreAuthorize("hasRole('ROLE_DOCTOR')")
public class DoctorController {

    private final QueueService queueService;
    private final DoctorService doctorService;
    private final UserService userService;

    @RequestMapping("/queue.pop")
    @ResponseBody
    public String popQueue() {
        DataList.Patient b = queueService.pop(doctorService.getProject());
        return String.valueOf(b);
    }

    @RequestMapping("/queue.peek")
    @ResponseBody
    public String peekQueue() {
        DataList.Patient b = queueService.peek(doctorService.getProject());
        return String.valueOf(b);
    }

    @RequestMapping("/queue.del_{patientName}")
    @ResponseBody
    public String delQueue(@PathVariable String patientName) {
        boolean b = queueService.delPatient(doctorService.getProject(), patientName);
        return String.valueOf(b);
    }

    @RequestMapping("/queue.check")
    @ResponseBody
    public String checkQueue() {
        return JSON.toJSONString(queueService.check(doctorService.getProject()));
    }

    @RequestMapping("/project.create")
    @ResponseBody
    public String createProjects() {
        return null;
    }

    @RequestMapping("/getActivityPatient")
    @ResponseBody
    public String getActivityPatient(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            HttpServletRequest request
    ) {
        PageHelper.startPage(page, limit);
        return JSON.toJSONString(userService.getActivityUser(request, AssistantContext.PATIENT));
    }
}
