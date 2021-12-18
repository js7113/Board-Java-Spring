package com.js.myapp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.ReplyVO;
import com.board.service.boardService;
import com.board.service.replyService;
import com.board.util.Pagination;
import com.board.util.Search;


@Controller
@RequestMapping("/reply/*")
public class ReplayController {
	
	@Inject
	private replyService replyservice;
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String posttWirte(ReplyVO vo) throws Exception {
		
		replyservice.replyCreate(vo);
		
		return "redirect:/board/detail?bno=" + vo.getBno();
	}
}
