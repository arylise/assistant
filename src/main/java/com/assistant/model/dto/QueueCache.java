package com.assistant.model.dto;

import com.assistant.model.enity.Project;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 科室项目的患者排队队列
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QueueCache {
    List<String> queueList;
    List<Long> timestamp;
    Project project;
}
