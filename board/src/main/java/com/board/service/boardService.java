package com.board.service;

import java.util.List;
import com.board.domain.BoardVO;
import com.board.util.Search;


public interface boardService {
	public List<BoardVO> list(Search search) throws Exception;
	public void create(BoardVO vo);
	public BoardVO detail(int bno);
	public void update(BoardVO vo);
	public void delete(int bno);
	public int getBoardListCnt(Search search) throws Exception;
}
