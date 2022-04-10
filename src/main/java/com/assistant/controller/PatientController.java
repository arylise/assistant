package com.assistant.controller;

import com.assistant.service.intf.PatientService;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/patient")
@PreAuthorize("hasRole('ROLE_PATIENT')")
public class PatientController {
    private final PatientService patientService;
    private final ProjectService projectService;

    @RequestMapping("/register_{pro}")
    @ResponseBody
    public boolean registerDepList(@PathVariable String pro) {
        String username = SecurityUtils.getUsername();
        return patientService.register(pro, username);
    }

    @RequestMapping("/getTime_{pro}")
    @ResponseBody
    public Integer getTime(@PathVariable String pro) {
        return projectService.getQueWaitTime(pro);
    }

    @RequestMapping("/getPath_{weightPath}_{weightTime}")
    @ResponseBody
    public String getPath(@PathVariable int weightPath, @PathVariable int weightTime) {
        String username = SecurityUtils.getUsername();
        return patientService.getPath(username, weightPath, weightTime).toString();
    }
}
