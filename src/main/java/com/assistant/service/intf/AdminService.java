package com.assistant.service.intf;

import com.assistant.model.dto.DataList;

public interface AdminService {
    DataList findList(String listName);
    String getMapNodesByLevel(int level);
}
