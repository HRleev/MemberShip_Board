package com.its.membership_board.controller;

import com.its.membership_board.dto.MemberDTO;
import com.its.membership_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/save")
    public String memberSave(){
        return "memberPages/save";
    }
    @PostMapping("/save")
    public String saveFile(@ModelAttribute MemberDTO memberDTO) throws IOException {
      memberService.save(memberDTO);
        System.out.println("MemberController.saveFile");
        System.out.println("memberDTO = " + memberDTO );
        return "memberPages/login";
    }
    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        String checkResult=memberService.duplicateCheck(memberId);
        return checkResult;
    }
    @GetMapping("/login")
    public String login (){
        return "memberPages/login";
    }
    @PostMapping("/login1")
    public String loginMember(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        System.out.println("MemberController.login");
        System.out.println("memberDTO = " + memberDTO + ", model = " + model + ", session = " + session);
        if (loginMember != null) {
            model.addAttribute("loginResult", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getMemberId());

            return "boardPages/list";
        }else {
            return "memberPages/login";
        }
    }
}
