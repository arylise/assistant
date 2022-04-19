package com.assistant.model.enity;

import com.assistant.constant.AssistantContext;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Message {
    private String messageId;
    private String speakerUsername;
    private String speakerName;
    private String speakerRole;
    private String msg;
    private String datestr;

    public Message(String speakerUsername, String speakerName, String speakerRole, String msg) {
        this.speakerUsername = speakerUsername;
        this.speakerName = speakerName;
        this.speakerRole = speakerRole;
        this.msg = msg;
        this.datestr = AssistantContext.getDateStr(System.currentTimeMillis());
    }
}
