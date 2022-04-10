package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import com.assistant.model.dto.PatientDTO;

public interface QueueService {

    boolean push(String project, String username);

    PatientDTO pop(String project);

    PatientDTO peek(String project);

    boolean delPatient(String project, String username);

    Integer getWaitTime(String project);

    DataList check(String project);

}
