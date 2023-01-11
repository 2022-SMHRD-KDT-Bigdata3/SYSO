package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_calDAO;
import com.smhrd.model.tb_calVO;


public class caladd extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id=request.getParameter("user_id");
		String content=request.getParameter("title");
		String start1=request.getParameter("start");
		String end1=request.getParameter("end");
		
		System.out.println(user_id);
		System.out.println(content);
		System.out.println(start1);
		System.out.println(end1);

		tb_calVO vo = new tb_calVO(user_id, content, start1, end1);
		tb_calDAO dao = new tb_calDAO();
		
		int res = dao.caladd(vo);
		if(res > 0) {
			System.out.println("전송성공");
		}else {
			System.out.println("전송실패");
		}
		
		
		
	}
	

}
