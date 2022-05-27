package com.its.membership_board.controller;

import com.its.membership_board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/findAll")
    public String findAll(){
        return "boardPages/list";
    }
    @GetMapping("/save")
    public String save(){
        return "/boardPages/save";
    }
    @PostMapping("/save")
    public String saveForm(){

    }

}
