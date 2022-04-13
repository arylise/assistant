package com.assistant.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 患者的检查清单
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ProjectCache {
    private Map<String, ProjectDTO.State> projectMap;

    public boolean append(List<String> projectList) {
        for (String s : projectList) {
            if (projectMap.containsKey(s)) {
                return false;
            }
            projectMap.put(s, ProjectDTO.State.uncheck);
        }
        return true;
    }

    public boolean remove(List<String> projectList) {
        boolean b = true;
        boolean count = false;
        for (String s : projectList) {
            projectMap.remove(s);
            b = b && !projectMap.containsKey(s);
            count = count || b;
        }
        return b && count;
    }

    public static ProjectCache initCache(List<String> projectList) {
        Map<String, ProjectDTO.State> collect = projectList.stream().collect(Collectors.toMap(String::toString, o -> ProjectDTO.State.uncheck));
        return ProjectCache.builder().projectMap(collect).build();
    }
}
