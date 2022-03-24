package com.assistant.model.enity;

import com.alibaba.druid.util.StringUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MapNode {
    private int nodeId;

    private String nodeName;

    /**
     * 节点所属层数
     */
    private int level;

    /**
     * 节点在该层的位置（像素）
     */
    private int x;
    private int y;

    /**
     * 下一个节点id
     */
    private String nextNode;

    /**
     * 上下楼梯的节点，先上后下，如果为空则置-1，只能有两个值
     */
    private String stairNode;

    /**
     * 电梯集群id
     */
    private String elevatorNode;

    private String msg;

    public List<Integer> listOfStair() {
        if (StringUtils.isEmpty(stairNode)){
            return null;
        }
        return Arrays.stream(stairNode.split(",")).toList().stream().map(Integer::parseInt).collect(Collectors.toList());
    }

    public List<Integer> listOfNext() {
        if (StringUtils.isEmpty(nextNode)){
            return null;
        }
        return Arrays.stream(nextNode.split(",")).toList().stream().map(Integer::parseInt).collect(Collectors.toList());
    }

    public List<Integer> listOfElevator() {
        if (StringUtils.isEmpty(elevatorNode)){
            return null;
        }
        return Arrays.stream(elevatorNode.split(",")).toList().stream().map(Integer::parseInt).collect(Collectors.toList());
    }
}
