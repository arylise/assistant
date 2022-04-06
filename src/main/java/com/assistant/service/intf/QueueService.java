package com.assistant.service.intf;

public interface QueueService {

    boolean regQueue(String dep, String username);

    boolean doQueue(String dep);

    boolean delFromQueue(String dep, String username);

    Integer getWaitTime(String dep);
}
