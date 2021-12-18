package com.board.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.board.dao.boardDAO;
import com.board.domain.BoardVO;
import com.board.util.Search;


@Service
public class boardServiceImpl implements boardService {
	
	@Inject
	private boardDAO dao;
	 
	 // 회원 목록
	@Override
	public List<BoardVO> list(Search search) throws Exception {
		return dao.list(search);
	}
	 
	@Override
	public void create(BoardVO vo) {
	    dao.create(vo);
	}
	 
	@Override
	public BoardVO detail(int bno) {
	    return dao.detail(bno);
	}
	 
	@Override
	public void update(BoardVO vo) {
	    dao.update(vo);
	}
	 
	@Override
	public void delete(int bno) {
	    dao.delete(bno);
	}
	 
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return dao.getBoardListCnt(search);
	}
		
}
