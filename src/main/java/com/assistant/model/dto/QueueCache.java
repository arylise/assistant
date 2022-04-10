package com.assistant.model.dto;

import com.assistant.model.enity.Project;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 科室项目的患者排队队列
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QueueCache {
    private List<String> nameList;
    private List<Long> timestamp;
    private Project project;

    public void del(String username) {
        int i = indexOf(username);
        del(i);
    }

    public void del(int index) {
        this.nameList.remove(index);
        this.timestamp.remove(index);
    }

    public void add(String username, Long time) {
        this.nameList.add(username);
        this.timestamp.add(time);
    }

    public int indexOf(String name) {
        return nameList.indexOf(name);
    }
}
