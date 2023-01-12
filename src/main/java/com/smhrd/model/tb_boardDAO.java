package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

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
	
	public int boardDelete(tb_boardVO vo) {
		
		int res = 0;
		session = sqlSessionFactory.openSession(true);
		res = session.delete("boardDelete", vo);
		session.close();
		return res;
	}
	
	public ArrayList<tb_boardVO> boardSelect(String user_id) {
		//public 리턴타입 메소드명(매개변수){}
		//매개변수로 info.getEmail을 받아온다 걔는 String 타입으로 나오니까 
		session = sqlSessionFactory.openSession(true);
		
		//여러개를 받아오니까 selectList사용("key", 검색하기위한 매개변수)
		List<tb_boardVO> list = session.selectList("boardSelect", user_id);
		session.close();
		//다운캐스팅해서 리턴
		return (ArrayList<tb_boardVO>)list;
	}
	

	public ArrayList<tb_boardVO> boardSelectAll() {
		
		session = sqlSessionFactory.openSession(true);
		List<tb_boardVO> list = session.selectList("boardSelectAll");
		session.close();
		return (ArrayList<tb_boardVO>)list;
		
	}
	
}
