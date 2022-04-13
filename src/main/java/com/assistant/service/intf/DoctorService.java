package com.assistant.service.intf;

import com.assistant.model.dto.DataList;

public interface DoctorService {

    DataList findList(String redisName, String name);
}
