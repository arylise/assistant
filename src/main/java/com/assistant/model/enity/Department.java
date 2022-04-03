package com.assistant.model.enity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Department {
    private String department;
    private String project;
    private int nodeId;
    private int avetime;
    private String msg;
}
