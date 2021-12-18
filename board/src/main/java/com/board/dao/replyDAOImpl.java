package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.ReplyVO;


@Repository
public class replyDAOImpl implements replyDAO {

	private static String namespace = "com.board.mappers.reply";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return sql.selectList(namespace + ".replyList", bno);
	}

	@Override
	public void replyCreate(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".replyCreate", vo);
	}

	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		sql.update(namespace + ".replyUpdate", vo);
	}

	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		sql.delete(namespace + ".replyDelete", vo);
	}
	

}
