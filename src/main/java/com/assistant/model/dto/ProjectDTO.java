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
    private State state;

    public enum State {
        uncheck(50),
        checked(100),
        checking(0),
        onCall(25);

        private final int weight;

        State(int weight){
            this.weight = weight;
        }
    }

    public ProjectDTO(Project project, State state) {
        this.project = project.getProject();
        this.department = project.getDepartment();
        this.nodeId = project.getNodeId();
        this.avetime = AssistantContext.getMinStr(project.getAvetime());
        this.msg = project.getMsg();
        this.state = state;
    }

    public static List<ProjectDTO> trans(List<Project> projectList, List<State> state) {
        return new ArrayList<>() {{
            for (int i = 0; i < projectList.size(); i++) {
                add(new ProjectDTO(projectList.get(i), state.get(i)));
            }
            sort(Comparator.comparingInt(o -> o.state.weight));
        }};
    }
}
