package com.assistant.model.enity;

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
     * 0不跨层 1楼梯 2电梯
     */
    private int span;

    /**
     * 上下楼梯的节点，先上后下，如果为空则置-1，只能有两个值
     */
    private String stairNode;

    /**
     * 电梯集群id
     */
    private int elevatorId;

//  this.nextNode = Arrays.stream(nextNode.split("|")).toList().stream().map(Integer::parseInt).collect(Collectors.toList());
//  this.stairNode = Arrays.stream(stairNode.split("|")).toList().stream().map(Integer::parseInt).collect(Collectors.toList());
//

}
