package com.its.membership_board.service;

import com.its.membership_board.dto.BoardDTO;
import com.its.membership_board.dto.PageDTO;
import com.its.membership_board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service

public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public void save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath = "C:\\spring_img\\" + boardFileName;
        System.out.println("BoardService.save");
        System.out.println("boardDTO = " + boardDTO);
        if (!boardFile.isEmpty()) {
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.save(boardDTO);

    }

    public List<BoardDTO> findAll() {
        List<BoardDTO> boardDTOList = boardRepository.findAll();
        return boardDTOList;
    }
    private static final int PAGE_LIMIT = 3;

    private static final int BLOCK_LIMIT = 3;

    public List<BoardDTO> pagingList(int page) {
        //1페이지 요청=>
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount();//글 갯수 조회
        //필요한 전체 페이지 갯수
        //10, 3 10/3=3.333 =>4
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        //시작페이지를 정하는 역할
        //1,4,7,10
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        //끌페이지 값 3.6.9.12
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public BoardDTO findById(BoardDTO boardDTO) {
        return boardRepository.findById(boardDTO);
    }

    public void update(BoardDTO boardDTO) {
        System.out.println("BoardService.update");
        System.out.println("boardDTO = " + boardDTO);
        boardRepository.update(boardDTO);
    }

    public void delete(Long b_id) {
        boardRepository.delete(b_id);
    }

    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;
    }
}
