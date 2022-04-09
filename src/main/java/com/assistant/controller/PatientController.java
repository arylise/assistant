package com.assistant.controller;

import com.assistant.service.intf.PatientService;
import com.assistant.service.intf.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.MessageFormat;

@Controller
@RequiredArgsConstructor
@RequestMapping("/patient")
@PreAuthorize("hasRole('ROLE_PATIENT')")
public class PatientController {
    private final PatientService patientService;
    private final ProjectService projectService;

    @RequestMapping("/page_{name}")
    public String page(@PathVariable String name) {
        return MessageFormat.format("/patient/page_{0}.html", name);
    }

    @RequestMapping("/register_{pro}")
    @ResponseBody
    public boolean registerDepList(@PathVariable String pro, @CookieValue("username") String username) {
        return patientService.register(pro, username);
    }

    @RequestMapping("/getTime_{pro}")
    @ResponseBody
    public Integer getTime(@PathVariable String pro) {
        return projectService.getQueWaitTime(pro);
    }

    @RequestMapping("/getPath_{weightPath}_{weightTime}")
    @ResponseBody
    public String getPath(@PathVariable int weightPath,@PathVariable int weightTime,@CookieValue("username") String username){
        return patientService.getPath(username,weightPath,weightTime).toString();
    }
}
