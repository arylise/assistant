package com.assistant.model.dto;

import com.assistant.model.enity.Project;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QueueCache {
    List<String> queueList;
    Project project;
}
