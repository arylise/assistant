package com.assistant.model.dto;

import com.assistant.model.enity.Department;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ProCache {
    List<String> contextList;
    Department department;
}
