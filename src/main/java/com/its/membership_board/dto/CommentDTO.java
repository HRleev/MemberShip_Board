package com.its.membership_board.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private long c_id;
    private String memberId;
    private String commentContents;
    private Timestamp commentCreateData;


}
