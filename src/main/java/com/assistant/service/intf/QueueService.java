package com.assistant.service.intf;

import com.assistant.model.dto.DataList;

public interface QueueService {

    boolean push(String dep, String username);

    DataList.Patient pop(String dep);

    DataList.Patient peek(String project);

    boolean delPatient(String dep, String username);

    Integer getWaitTime(String dep);

    DataList check(String project);

}
