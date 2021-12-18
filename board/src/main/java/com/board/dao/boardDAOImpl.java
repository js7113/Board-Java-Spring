package com.board.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.board.domain.BoardVO;
import com.board.util.Search;


@Repository
public class boardDAOImpl implements boardDAO {

	@Inject
	private SqlSession sql;
	 
	private static String namespace = "com.board.mappers.board";
	
	@Override
	public List<BoardVO> list(Search search) {
		return sql.selectList(namespace + ".list", search);
	}
	
	@Override
	public void create(BoardVO vo) {
		sql.insert(namespace + ".create", vo);
	}
	
	@Override
	public BoardVO detail(int bno) {
		return sql.selectOne(namespace + ".detail", bno);
	}
	
	@Override
	public void update(BoardVO vo) {
		sql.update(namespace + ".update", vo);
	}
	
	@Override
	public void delete(int bno) {
		sql.delete(namespace + ".delete", bno);
	}
	
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return sql.selectOne("com.board.mappers.board.getBoardListCnt", search);

	}
	
}
