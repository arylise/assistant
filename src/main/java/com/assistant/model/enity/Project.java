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
    private int nodeId;
    private int avetime;
    private String msg;
}
