package com.assistant.model.enity;

import com.alibaba.druid.util.StringUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Arrays;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MapNode {
    private String nodeId;

    private String nodeName;

    /**
     * 节点所属层数
     */
    private Integer level;

    /**
     * 节点在该层的位置（像素）
     */
    private Integer x;
    private Integer y;

    /**
     * 下一个节点id
     */
    private String nextNode;

    /**
     * 上下楼梯的节点，先上后下，如果为空则置-1，只能有两个值
     */
    private String stairNode;

    /**
     * 电梯集群
     */
    private String elevatorNode;

    /**
     * 电梯集群id
     */
    private String elevatorId;

    private String msg;

    public List<String> listOfStair() {
        if (StringUtils.isEmpty(stairNode)) {
            return null;
        }
        return Arrays.stream(stairNode.split(",")).toList();
    }

    public List<String> listOfNext() {
        if (StringUtils.isEmpty(nextNode)) {
            return null;
        }
        return Arrays.stream(nextNode.split(",")).toList();
    }

    public List<String> listOfElevator() {
        if (StringUtils.isEmpty(elevatorNode)) {
            return null;
        }
        return Arrays.stream(elevatorNode.split(",")).toList();
    }
}
