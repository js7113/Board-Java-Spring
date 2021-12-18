package com.js.myapp;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.ReplyVO;
import com.board.service.boardService;
import com.board.service.replyService;
import com.board.util.Pagination;
import com.board.util.Search;

@Controller
@RequestMapping("/board/*")

public class BoardController {
	
	@Inject
	private boardService service;
	
	@Inject
	private replyService replyservice;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getList(Model model, 
    		@RequestParam(required = false, defaultValue = "1") int page, 
    		@RequestParam(required = false, defaultValue = "1") int range,
    		@RequestParam(required = false, defaultValue = "title") String searchType, 
    		@RequestParam(required = false) String keyword
    	) throws Exception{
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
    	int listCnt = service.getBoardListCnt(search);
    	
    	search.pageInfo(page, range, listCnt);
    	
    	Pagination pagination = new Pagination();
    	pagination.pageInfo(page, range, listCnt);
    	    	
    	model.addAttribute("pagination", search);
        model.addAttribute("list", service.list(search));

        return "board/list";
    }
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getdetail(Model model, @RequestParam("bno") int bno) throws Exception {
		
    	BoardVO data = service.detail(bno);
    	List<ReplyVO> rList = replyservice.replyList(bno);
    	
    	model.addAttribute("data", data);
    	model.addAttribute("boardContent", service.detail(bno));
		model.addAttribute("rList", rList);
		
    	return "board/detail";
    }
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
    public String getcreate() throws Exception {
		return "board/create";
    }
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
    public String postcreate(BoardVO vo) throws Exception {
    	service.create(vo);
    	return "redirect:list";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String getupdate(int bno, Model model) throws Exception {
    	BoardVO data = service.detail(bno);
    	model.addAttribute("data", data);
       return "board/update";
    }
    
    @RequestMapping(value= "/update", method=RequestMethod.POST)
    public String postupdate(BoardVO vo) throws Exception {
        service.update(vo);
        return "redirect:list";
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String getdelete(int bno) throws Exception {
    	service.delete(bno);
    	return "redirect:list";
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String postdelete(int bno) throws Exception {
    	service.delete(bno);
    	return "redirect:list";
    }
    
}
    