package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_boardDAO;
import com.smhrd.model.tb_boardVO;


public class boardInsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
	//	int b_num = Integer.parseInt(request.getParameter("b_num"));
		int sr_num = Integer.parseInt(request.getParameter("sr_num"));
		String b_title= request.getParameter("b_title");
		String b_contents = request.getParameter("b_contents");
		String user_id = request.getParameter("user_id");
	//	String b_ymd = request.getParameter("b_ymd");
		
	//	tb_boardVO vo = new tb_boardVO(b_num,sr_num, b_title, b_contents, user_id,b_ymd);
		tb_boardVO vo = new tb_boardVO(sr_num, b_title, b_contents, user_id);		
		System.out.println(vo.toString() + "이거맞나");
		
		tb_boardDAO dao = new tb_boardDAO();
		int res = dao.boardInsert(vo);
		
		if(res>0) { //삽입성공
			System.out.println("전송성공 ㅋ ");
			//response.sendRedirect("#");
		}else { // 삽입실패
			System.out.println("전송실패");
			//response.sendRedirect("#");
		}
		
		
	      RequestDispatcher re = request.getRequestDispatcher("enterStudyRoom.jsp");
	      re.forward(request, response);
	}

}
