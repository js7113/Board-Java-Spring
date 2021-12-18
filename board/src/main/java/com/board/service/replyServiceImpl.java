package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.replyDAO;
import com.board.domain.ReplyVO;


@Service
public class replyServiceImpl implements replyService {

	@Inject
	private replyDAO dao;
	
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return dao.replyList(bno);
	}

	@Override
	public void replyCreate(ReplyVO vo) throws Exception {
		dao.replyCreate(vo);
	}

	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		dao.replyUpdate(vo);	
	}

	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		dao.replyDelete(vo);
	}

}
