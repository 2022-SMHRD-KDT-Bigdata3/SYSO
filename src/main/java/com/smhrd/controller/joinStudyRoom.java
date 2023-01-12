package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_mysrVO;
import com.smhrd.model.tb_srDAO;


public class joinStudyRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		//가져온 user_id 확인용 출력
		System.out.println(user_id);
		
		//DB에서 선택된 스터디의 정보를 tb_studyroom에서 불러오기
		//tb_studyroom에서 sr_num 과 sr_name 컬럼의 값을 가져오기
		int sr_num = Integer.parseInt( request.getParameter("sr_num"));
		String sr_name = request.getParameter("sr_name");
		
		//tb_mystudyroom테이블에 각 sr_num, user_id, sr_name, sr_joindate(sysdate로) 컬럼에 값 추가
		
		//위의 정보들을 vo 형태로 만들기
		tb_mysrVO vo = new tb_mysrVO();
		
		tb_srDAO dao = new tb_srDAO();
		int res = dao.joinStudyRoom(vo);
		if(res > 0) {
			System.out.println("스터디 가입 성공!");
		}else {
			System.out.println("스터디 가입 실패~");
		}
		//잘 가입이되면 메인페이지의 나의 스터디 목록에서 출력
		
	};
}
