package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import com.assistant.model.dto.PatientDTO;
import org.springframework.data.util.Pair;

public interface QueueService {

    boolean push(String project, String patient);

    PatientDTO pop(String project);

    PatientDTO peek(String project);

    boolean delPatient(String project, String patient);

    Pair<Integer, Long> getWaitTime(String project,String patient);

    DataList check(String project);

}
