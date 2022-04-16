package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.model.dto.DataList;
import com.assistant.service.intf.ProjectService;
import com.assistant.service.intf.QueueService;
import com.assistant.utils.PathUtils;
import com.assistant.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Set;

@Controller
@RequiredArgsConstructor
@RequestMapping("/patient")
@PreAuthorize("hasRole('ROLE_PATIENT')")
public class PatientController {
    private final QueueService queueService;
    private final ProjectService projectService;
    private final PathUtils pathUtils;

    @RequestMapping("/queue.reg")
    @ResponseBody
    public boolean regQue(@RequestParam("project") String project) {
        return queueService.push(project, SecurityUtils.getUsername());
    }

    @RequestMapping("/getTime")
    @ResponseBody
    public Long getTime(@RequestParam("project") String project) {
        return queueService.getWaitTime(project);
    }

    @RequestMapping("/getPath")
    @ResponseBody
    public String getPath() {
        List<String> list = null;
        return null;
    }

    @RequestMapping("/project.check")
    @ResponseBody
    public String checkProjects() {
        DataList b = projectService.check(SecurityUtils.getUsername());
        return JSON.toJSONString(b);
    }

    @RequestMapping("/project.checkProjectsAllName")
    @ResponseBody
    public Set<String> checkProjectsAllName() {
        return projectService.checkProjectsAllName(SecurityUtils.getUsername());
    }
}
