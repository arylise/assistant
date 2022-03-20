package com.assistant.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.assistant.constant.StaticString;
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
        List list = null;
        switch (listName) {
            case StaticString.DOCTOR -> {
                list = doctorService.selectAll();
                count = doctorService.count();
            }
            case StaticString.PATIENT -> {
                list = patientService.selectAll();
                count = patientService.count();
            }
            case StaticString.DEPARTMENT -> {
                list = hospitalService.departmentList();
                count = hospitalService.countDeps();
            }
            case StaticString.PROJECT -> {
                list = hospitalService.projectList();
                count = hospitalService.countPros();
            }
            case StaticString.MAP_NODE -> {
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
        MapNodeUtils.AdjacencyMatrix adjacencyMatrix = mapNodeUtils.getAdjacencyMatrix(list);
        JSONObject ans = new JSONObject();
        ans.put("index", adjacencyMatrix.index);
        ans.put("matrix", adjacencyMatrix.matrix);
        ans.put("mapNodes", list);
        return ans.toJSONString();
    }


}
