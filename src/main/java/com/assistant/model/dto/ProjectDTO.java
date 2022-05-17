package com.assistant.model.dto;

import com.assistant.constant.AssistantContext;
import com.assistant.model.enity.Project;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ProjectDTO {
    private String project;
    private String department;
    private String nodeId;
    private String avetime;
    private String msg;
    private String state;
    private Integer weight;



    public ProjectDTO(Project project, String state, Integer weight) {
        this.project = project.getProject();
        this.department = project.getDepartment();
        this.nodeId = project.getNodeId();
        this.avetime = AssistantContext.getMinStr(project.getAvetime());
        this.msg = project.getMsg();
        this.state = state;
        this.weight = weight;
    }

    public static List<ProjectDTO> trans(List<Project> projectList, List<State> state) {
        return new ArrayList<>() {{
            for (int i = 0; i < projectList.size(); i++) {
                add(new ProjectDTO(projectList.get(i), state.get(i).desc, state.get(i).weight));
            }
            sort(Comparator.comparingInt(o -> o.weight));
        }};
    }
}
