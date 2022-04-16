package com.assistant.service.impl;

import com.assistant.service.intf.ElevatorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class ElevatorServiceImpl implements ElevatorService {

    @Override
    public int[] getElevatorTimes(String elevatorId) {
        int n = 5;
        int i = (int) (Math.random() * n);
        boolean u = Math.random() < 0.5;
        int[] times = new int[n];
        int j = i;
        times[j] = 0;
        int time = 0;
        if (u) {
            while (j < n) {
                time += TimeUnit.MINUTES.toMillis(1);
                if (j > i) {
                    times[j] = time;
                }
                j++;
            }
            j--;
            while (j >= 0) {
                time += TimeUnit.MINUTES.toMillis(1);
                if (j < i) {
                    times[j] = time;
                }
                j--;
            }
        } else {
            while (j >= 0) {
                time += TimeUnit.MINUTES.toMillis(1);
                if (j < i) {
                    times[j] = time;
                }
                j--;
            }
            j++;
            while (j < n) {
                time += TimeUnit.MINUTES.toMillis(1);
                if (j > i) {
                    times[j] = time;
                }
                j++;
            }
        }
        return times;
    }

    @Override
    public Map<String, int[]> getElevatorTimeMap(List<String> elevatorIdList) {
        return new HashMap<>() {{
            for (String id : elevatorIdList) {
                put(id, getElevatorTimes(id));
            }
        }};
    }
}
