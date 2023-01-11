package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DataBase.SqlSessionManager;

public class tb_calDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
	public int caladd(tb_calVO vo) {
		
		session = sqlSessionFactory.openSession(true);
		int res =0; 
		try {
	
			res = session.insert("caladd", vo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
public List<tb_calVO> calget() {		
		session = sqlSessionFactory.openSession(true);
		List<tb_calVO> list =null;; 
		try {	
			list = session.selectList("calget");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	
}
