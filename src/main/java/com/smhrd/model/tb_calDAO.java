package com.smhrd.model;


import java.util.ArrayList;

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

	public ArrayList<tb_calVO> eventSelect(String user_id) {
		session = sqlSessionFactory.openSession(true);
		List<tb_calVO>list = session.selectList("eventselect", user_id);
		session.close();
		return (ArrayList<tb_calVO>)list;
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
