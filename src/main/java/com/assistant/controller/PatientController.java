package com.assistant.controller;

import com.assistant.service.intf.PatientService;
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

    @RequestMapping("/register_{dep}")
    @ResponseBody
    public boolean registerDepList(@PathVariable String dep, @CookieValue("username") String username) {
        return patientService.register(dep,username);
    }
}
