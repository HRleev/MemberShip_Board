package com.its.membership_board.controller;

import com.its.membership_board.dto.BoardDTO;
import com.its.membership_board.dto.CommentDTO;
import com.its.membership_board.dto.PageDTO;

import com.its.membership_board.service.BoardService;
import com.its.membership_board.service.CommentService;
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
    private CommentService commentService;
    @Autowired
    private BoardService boardService;
//    @GetMapping("/findAll")
//    public String findAll(Model model) {
//        List<BoardDTO> boardDTOList = boardService.findAll();
//        model.addAttribute("boardList", boardDTOList);
//        return "/boardPages/list";
//    }
    @GetMapping("/save")
    public String save(){
        return "/boardPages/save";
    }
    @PostMapping("/save")
    public String saveForm(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println("cont : "+boardDTO);
        boardService.save(boardDTO);
        return "redirect:/board/paging";
    }
    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1")
                         int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "boardPages/list";
    }
    @GetMapping("/detail")
    public String findById(@ModelAttribute BoardDTO boardDTO,
                           @ModelAttribute CommentDTO commentDTO, Model model ){
        BoardDTO board = boardService.findById(boardDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getB_id());
        model.addAttribute("board",board);
        model.addAttribute("commentList",commentDTOList);
        return "boardPages/detail";
    }
    @GetMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO,Model model){
        model.addAttribute("board",boardService.findById(boardDTO));
        return "/boardPages/update";
    }
    @PostMapping("/update")
    public String updateForm(@ModelAttribute BoardDTO boardDTO){
        System.out.println("BoardController.updateForm");
        System.out.println("boardDTO = " + boardDTO);
        boardService.update(boardDTO);
//        model.addAttribute("board",boardDTO);
//        long updateResult = boardDTO.getB_id();
        return "redirect:/board/detail?b_id="+ boardDTO.getB_id();
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("b_id") Long b_id) {
        boardService.delete(b_id);
        return "redirect:/board/findAll";
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("boardList", searchList);
        return "boardPages/list";
    }
}
