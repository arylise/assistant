package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.constant.AssistantContext;
import com.assistant.model.dto.DataList;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.ProjectService;
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

    private final ProjectService projectService;
    private final DoctorService doctorService;
    private final UserService userService;

    @RequestMapping("/doQue")
    @ResponseBody
    public String doPro() {
        DataList.Patient b = projectService.doQue(doctorService.getProject());
        return String.valueOf(b);
    }

    @RequestMapping("/getQue")
    @ResponseBody
    public String getPro() {
        DataList.Patient b = projectService.getQue(doctorService.getProject());
        return String.valueOf(b);
    }

    @RequestMapping("/delFromQue_{patientName}")
    @ResponseBody
    public String delFromPro(@PathVariable String patientName) {
        boolean b = projectService.delFromQue(doctorService.getProject(), patientName);
        return String.valueOf(b);
    }


//    @RequestMapping("/check_{redisName}_{name}")
//    @ResponseBody
//    public String list(@PathVariable String name,
//                       @PathVariable String redisName,
//                       @RequestParam(value = "page", defaultValue = "1") int page,
//                       @RequestParam(value = "limit", defaultValue = "20") int limit) {
//        return JSON.toJSONString(doctorService.findList(redisName, name));
//    }

    @RequestMapping("/check_queue")
    @ResponseBody
    public String checkQueue() {
        return JSON.toJSONString(projectService.checkQueue(doctorService.getProject()));
    }

    @RequestMapping("/getProject")
    @ResponseBody
    public String getProject() {
        return doctorService.getProject();
    }

    @RequestMapping("/getActivityPatient")
    @ResponseBody
    public String getPatient(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            HttpServletRequest request
    ) {
        PageHelper.startPage(page, limit);
        return JSON.toJSONString(userService.getActivityUser(request, AssistantContext.PATIENT));
    }
}
