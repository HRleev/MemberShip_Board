package com.its.membership_board.repository;

import com.its.membership_board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void saveFile(MemberDTO memberDTO) {
        sql.insert("Member.save",memberDTO);
        System.out.println("MemberRepository.saveFile");
        System.out.println("memberDTO = " + memberDTO);
    }

    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicateCheck",memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO loginResult = sql.selectOne("Member.login",memberDTO);
        System.out.println("MemberRepository.login");
        System.out.println("memberDTO = " + memberDTO);
        return loginResult;
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public int delete(long m_id) {
        return sql.delete("Member.delete",m_id);
    }

    public MemberDTO findById(long updateId ) {
        return sql.selectOne("Member.findById",updateId);
    }

    public int update(MemberDTO memberDTO) {
        System.out.println("MemberRepository.update");
        System.out.println("memberDTO = " + memberDTO);
        return sql.update("Member.update" ,memberDTO);
    }
}
