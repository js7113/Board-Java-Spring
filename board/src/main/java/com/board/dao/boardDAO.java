package com.board.dao;

import java.util.List;
import com.board.domain.BoardVO;
import com.board.util.Search;


public interface boardDAO {
	public List<BoardVO> list(Search search);
	public void create(BoardVO vo);
	public BoardVO detail(int bno);
	public void update(BoardVO vo);
	public void delete(int bno);
	public int getBoardListCnt(Search search) throws Exception;	
}