package com.assistant.service.intf;

import java.util.List;

public interface ProjectService {
    boolean create(String username, List<String> projectList);
}
