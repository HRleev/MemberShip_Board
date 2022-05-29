package com.its.membership_board.service;

import com.its.membership_board.dto.CommentDTO;
import com.its.membership_board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);

    }

    public List<CommentDTO> findAll(long b_id) {
        return commentRepository.findAll(b_id);
    }
}
