package com.assistant.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/doctor")
@PreAuthorize("hasRole('ROLE_DOCTOR')")
public class DoctorController {
}
