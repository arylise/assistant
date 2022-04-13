package com.assistant.model.enity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Project {
    private String project;
    private String department;
    private String nodeId;
    private Long avetime;
    private String msg;
}
