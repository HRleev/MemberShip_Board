package com.its.membership_board.service;

import com.its.membership_board.dto.MemberDTO;
import com.its.membership_board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) throws IOException {
        MultipartFile boardFile = memberDTO.getMemberProfile();
        String memberFileName = boardFile.getOriginalFilename();
        memberFileName = System.currentTimeMillis() + "-" + memberFileName;
        memberDTO.setMemberFileName(memberFileName);
        String savePath = "D:\\spring_img\\" + memberFileName;
        if (!boardFile.isEmpty()) {

            boardFile.transferTo(new File(savePath));
        }
        memberRepository.saveFile(memberDTO);
        System.out.println("MemberService.save");
        System.out.println("memberDTO = " + memberDTO);
    }

    public String duplicateCheck(String memberId) {
        String checkResult=memberRepository.duplicateCheck(memberId);
        if(checkResult==null){
            return "ok";
        }else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO loginMember= memberRepository.login(memberDTO);
        System.out.println("MemberService.login");
        System.out.println("memberDTO = " + memberDTO);
        return loginMember;
    }

    public List<MemberDTO> findAll() {
        List<MemberDTO>memberDTOList=memberRepository.findAll();
        return memberDTOList;
    }

    public boolean delete(long m_id) {
        int deleteResult=memberRepository.delete(m_id);
        if(deleteResult>0){
            return true;
        }else{
            return false;
        }
    }
}

