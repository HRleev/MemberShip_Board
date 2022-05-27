package com.its.membership_board.repository;

import com.its.membership_board.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(BoardDTO boardDTO) {
         return sql.insert("Board.save",boardDTO);
    }
    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);

    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public BoardDTO findById(String memberId) {
        sql.update("Board.updateHits" ,memberId);
        return sql.selectOne("Board.findById",memberId);
    }
}
