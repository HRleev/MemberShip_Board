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

    public BoardDTO findById(BoardDTO boardDTO) {
        sql.update("Board.updateHits" ,boardDTO);
        return sql.selectOne("Board.findById",boardDTO);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
        System.out.println("BoardRepository.update");
        System.out.println("boardDTO = " + boardDTO);
    }

    public void delete(Long b_id) {
        sql.delete("Board.delete", b_id);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }
}
