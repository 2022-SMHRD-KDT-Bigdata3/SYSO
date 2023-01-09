package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DataBase.SqlSessionManager;

public class tb_userDAO {
	//db 관련 기능을 직접 사용할 수 있는 세션을 생성하는 공장
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession; //각 세션을 저장할 공간
	
	//회원가입
	public int join(tb_user user) {
		//세션 생성
		//jdbc -> insert, delete, update -> auto commit / select
		//openSession(autocommit여부 지정가능 : true=auto commit)
		sqlSession = sqlSessionFactory.openSession(true);
		
		int res =0; //insert 실행하고 난 후 반환된 결과값 
		
		//예외처리 이유? mubatis-config에 설정정보 잘못 적어지거나 경로가 잘못된 경우 예외 발생
		try {
			//sql문 실행
			//잘 삽입되면 1반환
			res = sqlSession.insert("tb_userMapper.join", user);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return res;
	}
}
