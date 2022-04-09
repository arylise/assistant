package com.assistant.service.intf;

import java.util.List;

public interface ProjectService {

    boolean regQue(String dep, String username);

    boolean doQue(String dep);

    boolean delFromQue(String dep, String username);

    Integer getQueWaitTime(String dep);

    boolean regProList(String username, List<String> projectList);
}
