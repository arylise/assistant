package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.mapper.MapNodeMapper;
import com.assistant.model.dto.DataList;
import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.PathService;
import com.assistant.service.intf.ProjectService;
import com.assistant.service.intf.QueueService;
import com.assistant.utils.MapNodeUtils;
import com.assistant.utils.PathUtils;
import com.assistant.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/patient")
@PreAuthorize("hasRole('ROLE_PATIENT')")
public class PatientController {
    private final QueueService queueService;
    private final ProjectService projectService;
    private final AdminService adminService;
    private final PathService pathService;
    private final MapNodeMapper mapNodeMapper;

    @RequestMapping("/queue.reg")
    @ResponseBody
    public boolean regQue(@RequestParam("project") String project) {
        return queueService.push(project, SecurityUtils.getUsername());
    }

    @RequestMapping("/queue.del")
    @ResponseBody
    public boolean delQue(@RequestParam("project") String project) {
        return queueService.delPatient(project, SecurityUtils.getUsername());
    }

    @RequestMapping("/path.create")
    @ResponseBody
    public PathUtils.TspResult createPath(@RequestParam("action") String action) {
        return pathService.createPath(SecurityUtils.getUsername(), action);
    }

    @RequestMapping("/path.check")
    @ResponseBody
    public PathUtils.TspResult checkPath() {
        return pathService.checkPath(SecurityUtils.getUsername());
    }

    @RequestMapping("/path.nodes")
    @ResponseBody
    public Map<Integer, MapNodeUtils.AdjacencyResult> checkNodes() {
        return pathService.node();
    }

    @RequestMapping("/project.check")
    @ResponseBody
    public String checkProjects() {
        DataList b = projectService.check(SecurityUtils.getUsername());
        return JSON.toJSONString(b);
    }


    @RequestMapping("/project.getque")
    @ResponseBody
    public String getQue() {
        DataList b = projectService.getQue(SecurityUtils.getUsername());
        return JSON.toJSONString(b);
    }

    @RequestMapping("/nodes_{level}")
    @ResponseBody
    public String nodesByLevel(@PathVariable String level) {
        return adminService.getMapNodesByLevel(Integer.parseInt(level));
    }
}