package com.assistant.service.intf;

import java.util.List;

public interface ElevatorService {
    List<Integer> getElevatorTimes(String elevatorId);
}
