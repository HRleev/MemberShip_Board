package com.its.membership_board.controller;

import com.its.membership_board.dto.MemberDTO;
import com.its.membership_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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

    public String loginMember(@RequestParam(value="page", required=false, defaultValue="1")
                                  int page, @ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        System.out.println("MemberController.login");
        System.out.println("memberDTO = " + memberDTO + ", model = " + model + ", session = " + session);
        if (loginMember != null) {
            model.addAttribute("loginResult", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getM_id());

            return "redirect:/board/paging";
        }else {
            return "memberPages/login";
        }
    }
    @GetMapping("/logout")
    public String logout (HttpSession session){
        session.invalidate();
        return "index";
    }
    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList =memberService.findAll();
        model.addAttribute("memberList",memberDTOList);
        return "memberPages/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("m_id") long m_id,Model model){
        boolean deleteResult =memberService.delete(m_id);
        if(deleteResult){
            return "redirect:/member/findAll";
        }else {
            return "delete-fail";
        }
    }
    @GetMapping("/update-form")
    public String updateForm(Model model,HttpSession session){
        Long updateId= (Long) session.getAttribute("loginId");
        System.out.println("updateId = " +updateId);
        MemberDTO memberDTO =memberService.findById(updateId);
        model.addAttribute("updateMember",memberDTO);
        return "memberPages/myPage";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        System.out.println("MemberController.update");
        boolean updateResult =memberService.update(memberDTO);
        System.out.println("memberDTO = " + memberDTO);
        if(updateResult){
            return "redirect:/member/update-form?m_id=" +memberDTO.getM_id();
        }else{
            return "index";
        }
    }
}
