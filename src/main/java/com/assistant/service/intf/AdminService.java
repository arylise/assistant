package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import com.assistant.model.enity.Admin;

import java.util.List;

public interface AdminService {
    List<Admin> findAll();
    String password(String username);
    DataList findList(String listName);
    String getMapNodesByLevel(int level);
}
