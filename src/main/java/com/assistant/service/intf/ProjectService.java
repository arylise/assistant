package com.assistant.service.intf;

import com.assistant.model.dto.DataList;

import java.util.List;

public interface ProjectService {

    boolean regQue(String dep, String username);

    DataList.Patient doQue(String dep);

    boolean delFromQue(String dep, String username);

    Integer getQueWaitTime(String dep);

    boolean regProList(String username, List<String> projectList);

    DataList checkQueue(String username);

    DataList.Patient getQue(String project);
}
