package com.assistant.service.intf;

import com.assistant.model.dto.DataList;

public interface AdminService {
    String password(String username);
    DataList findList(String listName);
    String getMapNodesByLevel(int level);
}
