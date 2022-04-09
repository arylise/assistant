package com.assistant.service.intf;

import java.util.List;
import java.util.Map;

public interface ElevatorService {
    int[] getElevatorTimes(String elevatorId);

    Map<String, int[]> getElevatorTimeMap(List<String> elevatorIdList);
}
