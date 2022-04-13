package com.assistant.model.enity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Message {
    private String messageId;
    private String answerId;
    private String speakerName;
    private String speakerUsername;
    private String speakerRole;
    private String msg;
}
