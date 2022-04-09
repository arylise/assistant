package com.assistant.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 患者的检查清单
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ProjectCache {
    List<String> projectList;
}
