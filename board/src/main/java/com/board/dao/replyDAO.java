package com.board.dao;

import java.util.List;

import com.board.domain.ReplyVO;


public interface replyDAO {
	public List<ReplyVO> replyList(int bno) throws Exception;
	public void replyCreate(ReplyVO vo) throws Exception;
	public void replyUpdate(ReplyVO vo) throws Exception;
	public void replyDelete(ReplyVO vo) throws Exception;
}
