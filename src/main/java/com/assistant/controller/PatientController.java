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

    @RequestMapping("/register_{dep}")
    @ResponseBody
    public boolean registerDepList(@PathVariable String dep, @CookieValue("username") String username) {
        return patientService.register(dep, username);
    }

    @RequestMapping("/getTime_{dep}")
    @ResponseBody
    public Integer getTime(@PathVariable String dep) {
        return queueService.getWaitTime(dep);
    }

    @RequestMapping("/getPath_{way}")
    @ResponseBody
    public String getPath(@PathVariable String way){
        return "";
    }
}
