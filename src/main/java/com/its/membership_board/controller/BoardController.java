package com.its.membership_board.controller;

import com.its.membership_board.dto.BoardDTO;
import com.its.membership_board.dto.PageDTO;
import com.its.membership_board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "/boardPages/list";
    }
    @GetMapping("/save")
    public String save(){
        return "/boardPages/save";
    }
    @PostMapping("/save")
    public String saveForm(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println("cont : "+boardDTO);
        boardService.save(boardDTO);
        return "redirect:/board/findAll";
    }
    @GetMapping("/paging")
    //       /board/paging?page=1
    //       required=false 로 하면 /board/paging 요청도 가능
    public String paging(@RequestParam(value="page", required=false, defaultValue="1")
                             int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "boardPages/List";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam("memberId")String memberId,Model model){
        BoardDTO board = boardService.findById(memberId);
        System.out.println("BoardController.findById");
        System.out.println("memberId = " + memberId + ", bo*** " + board);
        model.addAttribute("board",board);
        return "boardPages/detail";
    }
}
