package com.its.membership_board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
    private long c_id;
    private long b_id;
    private String memberId;
    private String commentContents;
    private Timestamp commentCreatedDate;


}
