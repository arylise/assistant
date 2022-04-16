package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.assistant.constant.AssistantContext;
import com.assistant.mapper.DoctorMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.dto.PatientDTO;
import com.assistant.model.dto.ProjectDTO;
import com.assistant.service.intf.ProjectService;
import com.assistant.service.intf.QueueService;
import com.assistant.service.intf.UserService;
import com.assistant.utils.SecurityUtils;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.data.util.Pair;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Set;

@Controller
@RequiredArgsConstructor
@RequestMapping("/doctor")
@PreAuthorize("hasRole('ROLE_DOCTOR')")
public class DoctorController {

    private final QueueService queueService;
    private final ProjectService projectService;
    private final DoctorMapper doctorMapper;
    private final UserService userService;

    @RequestMapping("/queue.pop")
    @ResponseBody
    public String popQueue(@RequestParam("project") String project) {
        PatientDTO b = queueService.pop(project);
        return JSON.toJSONString(b);
    }

    @RequestMapping("/queue.peek")
    @ResponseBody
    public String peekQueue(@RequestParam("project") String project) {
        PatientDTO b = queueService.peek(project);
        return JSON.toJSONString(b);
    }

    @RequestMapping("/queue.del")
    @ResponseBody
    public String delQueue(@RequestParam("project") String project, @RequestParam("patientName") String patientName) {
        boolean b = queueService.delPatient(project, patientName);
        return String.valueOf(b);
    }

    @RequestMapping("/queue.check")
    @ResponseBody
    public String checkQueue(@RequestParam("project") String project) {
        return JSON.toJSONString(queueService.check(project));
    }

    @RequestMapping("/project.append")
    @ResponseBody
    public Boolean appendProjects(@RequestBody JSONObject req) {
        String patient = req.getString("patient");
        List<String> projectIdList = (List<String>) req.get("projectIdList");
        if (CollectionUtils.isEmpty(projectIdList)) {
            System.out.println("empty projectList");
            return null;
        }
        return projectService.appendOrFix(patient, projectIdList);
    }

    @RequestMapping("/project.check")
    @ResponseBody
    public String checkProjects(@RequestParam("patient") String patient) {
        DataList b = projectService.check(patient);
        return JSON.toJSONString(b);
    }

    @RequestMapping("/project.checkAllName")
    @ResponseBody
    public Set<String> checkProjectsAllName(@RequestParam("patient") String patient) {
        return projectService.checkProjectsAllName(patient);
    }

    @RequestMapping("/project.del")
    @ResponseBody
    public String delProjects(@RequestParam("username") String username) {
        boolean b = projectService.delete(username);
        return JSON.toJSONString(b);
    }

    @RequestMapping("/project.remove")
    @ResponseBody
    public String removeProjects(@RequestParam("username") String username, @RequestBody List<String> projectIdList) {
        boolean b = projectService.remove(username, projectIdList);
        return JSON.toJSONString(b);
    }

    @RequestMapping("/project.update")
    @ResponseBody
    public String updateProjects(@RequestParam("username") String username, @RequestParam String project, @RequestParam String state) {
        boolean b = projectService.updateState(username, project, ProjectDTO.State.valueOf(state));
        return JSON.toJSONString(b);
    }

    @RequestMapping("/getActivityPatients")
    @ResponseBody
    public String getActivityPatient(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            HttpServletRequest request
    ) {
        PageHelper.startPage(page, limit);
        return JSON.toJSONString(userService.getActivityUser(request, AssistantContext.PATIENT));
    }

    @RequestMapping("/getProjects")
    @ResponseBody
    public List<String> getProjects() {
        return doctorMapper.getProject(SecurityUtils.getUsername());
    }

    @RequestMapping("/getActivityPatientNames")
    @ResponseBody
    public List<Pair<String, String>> getActivityPatientNames(HttpServletRequest request) {
        return userService.getActivityPatientNames(request);
    }

    @RequestMapping("/getAllProjectName")
    @ResponseBody
    public List<Pair<String, String>> getAllProjectName() {
        return projectService.getAllProjectName();
    }


}
