package com.assistant.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
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
    List<ProjectDTO.State> stateList;


    public static ProjectCache initCache(List<String> projectList) {
        List<ProjectDTO.State> stateList = new ArrayList<>() {{
            for (int i = 0; i < projectList.size(); i++) {
                add(ProjectDTO.State.uncheck);
            }
        }};
        return ProjectCache.builder().projectList(projectList).stateList(stateList).build();
    }

    public int indexOf(String project) {
        return projectList.indexOf(project);
    }

    public void del(String project) {
        int i = indexOf(project);
        this.projectList.remove(i);
        this.stateList.remove(i);
    }

    public void del(int index) {
        this.projectList.remove(index);
        this.stateList.remove(index);
    }

    public void add(String project, ProjectDTO.State state) {
        this.projectList.add(project);
        this.stateList.add(state);
    }

    public void update(String project, ProjectDTO.State state) {
        int i = indexOf(project);
        if (i >= 0) {
            del(i);
        }
        add(project, state);
    }
}
