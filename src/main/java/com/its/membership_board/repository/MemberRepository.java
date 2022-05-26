package com.its.membership_board.repository;

import com.its.membership_board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
        return loginResult;
    }
}
