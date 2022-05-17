package com.assistant.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QueueDTO {
    private String state;
    private Integer weight;
    private String project;
    private Long waitTime;
    private Integer waitCount;
}
