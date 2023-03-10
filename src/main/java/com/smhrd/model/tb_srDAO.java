package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DataBase.SqlSessionManager;

public class tb_srDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
	public ArrayList<tb_srVO> searchRoom(searchsrVO vo) {
		session = sqlSessionFactory.openSession(true);
		List<tb_srVO>list =  session.selectList("searchRoom", vo);
		session.close();
		return (ArrayList<tb_srVO>)list;
	}

	public int joinStudyRoom(tb_mysrVO vo) {
		session = sqlSessionFactory.openSession(true);

		int res = 0;
		res = session.insert("joinstudyroom", vo);
		session.close();
		return res;
	}

	public int makestudy(tb_srVO vo) {
		session = sqlSessionFactory.openSession(true);
	    int res = 0;
	    res = session.insert("makestudy", vo);
	    session.close();
	    return res;	
		
	}

	public ArrayList<tb_mysrVO> selectMysr(String user_id) {
		session = sqlSessionFactory.openSession(true);
		List<tb_mysrVO> list =session.selectList("selectmystudyroom",user_id);
		session.close();
		return (ArrayList<tb_mysrVO>)list;
	}

	public tb_srVO enterStudyRoom(tb_mysrVO vo) {
		session = sqlSessionFactory.openSession(true);
		
		tb_srVO enter_info=null;
		enter_info = session.selectOne("entermystudyroom",vo);
		session.close();
		return enter_info;
	}
	


	

	
	

}
