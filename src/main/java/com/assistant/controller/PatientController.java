package com.assistant.controller;

import com.assistant.service.intf.QueueService;
import com.assistant.utils.PathUtils;
import com.assistant.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/patient")
@PreAuthorize("hasRole('ROLE_PATIENT')")
public class PatientController {
    private final QueueService queueService;
    private final PathUtils pathUtils;

    @RequestMapping("/queue.reg_{pro}")
    @ResponseBody
    public boolean regQue(@PathVariable String pro) {
        return queueService.push(pro, SecurityUtils.getUsername());
    }

    @RequestMapping("/getTime_{pro}")
    @ResponseBody
    public Integer getTime(@PathVariable String pro) {
        return queueService.getWaitTime(pro);
    }

    @RequestMapping("/getPath_{weightPath}_{weightTime}")
    @ResponseBody
    public String getPath(@PathVariable int weightPath, @PathVariable int weightTime) {
        List<String> list = null;
        return pathUtils.getBestPath(list, weightPath, weightTime).toString();
    }
}
