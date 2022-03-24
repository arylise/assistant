package com.assistant.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.assistant.constant.AssistantContext;
import com.assistant.mapper.AdminMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.enity.Admin;
import com.assistant.model.enity.MapNode;
import com.assistant.service.intf.*;
import com.assistant.utils.MapNodeUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;
    private final DoctorService doctorService;
    private final PatientService patientService;
    private final HospitalService hospitalService;
    private final MapNodeService mapNodeService;

    private final MapNodeUtils mapNodeUtils;

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    @Override
    public String password(String username) {
        return adminMapper.password(username);
    }

    @Override
    public DataList list(String listName) {
        long count;
        List list;
        switch (listName) {
            case AssistantContext.DOCTOR -> {
                list = doctorService.selectAll();
                count = doctorService.count();
            }
            case AssistantContext.PATIENT -> {
                list = patientService.selectAll();
                count = patientService.count();
            }
            case AssistantContext.DEPARTMENT -> {
                list = hospitalService.departmentList();
                count = hospitalService.countDeps();
            }
            case AssistantContext.PROJECT -> {
                list = hospitalService.projectList();
                count = hospitalService.countPros();
            }
            case AssistantContext.MAP_NODE -> {
                list = mapNodeService.findAll();
                count = mapNodeService.count();
            }
            default -> {
                return new DataList(-1, "");
            }
        }
        if (list != null) {
            return new DataList(list, count);
        }
        return new DataList(-2, "");
    }

    @Override
    public String getMapNodesByLevel(int level) {
        List<MapNode> list = mapNodeService.getMapNodesByLevel(level);
        JSONObject adjacencyMatrix = mapNodeUtils.adjacencyMatrix(list);
        adjacencyMatrix.put("mapNodes", list);
        return adjacencyMatrix.toJSONString();
    }


}
