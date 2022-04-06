package com.assistant.controller;

import com.assistant.service.intf.PatientService;
import com.assistant.service.intf.QueueService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/patient")
@PreAuthorize("hasRole('ROLE_PATIENT')")
public class PatientController {
    private final PatientService patientService;
    private final QueueService queueService;

    @RequestMapping("/register_{pro}")
    @ResponseBody
    public boolean registerDepList(@PathVariable String pro, @CookieValue("username") String username) {
        return patientService.register(pro, username);
    }

    @RequestMapping("/getTime_{pro}")
    @ResponseBody
    public Integer getTime(@PathVariable String pro) {
        return queueService.getWaitTime(pro);
    }

    @RequestMapping("/getPath_{way}")
    @ResponseBody
    public String getPath(@PathVariable String way){
        return "";
    }
}
