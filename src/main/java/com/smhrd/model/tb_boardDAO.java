package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DataBase.SqlSessionManager;

public class tb_boardDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
	
	public int boardInsert(tb_boardVO vo) {
		
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		res = session.insert("boardInsert", vo);
		session.close();
		return res;
		
	}
	
	public int boardDelete(int b_num) {
		
		int res = 0;
		session = sqlSessionFactory.openSession(true);
		res = session.delete("boardDelete", b_num);
		session.close();
		return res;
	}
	
}
