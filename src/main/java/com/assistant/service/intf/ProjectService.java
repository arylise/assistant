package com.assistant.service.intf;

public interface ProjectService {

    boolean regPro(String dep, String username);

    boolean doPro(String dep);

    boolean delFromPro(String dep, String username);

    Integer getWaitTime(String dep);
}
