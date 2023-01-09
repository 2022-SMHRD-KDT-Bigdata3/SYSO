package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DataBase.SqlSessionManager;

public class tb_calDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session; 


	public tb_calDAO(tb_calVO vo) {
		// TODO Auto-generated constructor stub
	}

	public int insertEvent(tb_calVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		res = session.insert("insertEvent", vo);
		session.close();
		return res;
	}
	
	public ArrayList<tb_calVO> eventCall(String user_id){
		session = sqlSessionFactory.openSession(true);
		List<tb_calVO> list = session.selectList("eventCall", user_id);
		session.close();
		//다운캐스팅해서 리턴
		return (ArrayList<tb_calVO>)list;
	}

	
}
