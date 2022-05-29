package com.its.membership_board.repository;

import com.its.membership_board.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);

    }

    public List<CommentDTO> findAll(long b_id) {
        return sql.selectList("Comment.findAll", b_id);
    }
}
