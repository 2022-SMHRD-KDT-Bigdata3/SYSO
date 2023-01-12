package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_boardDAO;
import com.smhrd.model.tb_boardVO;

/**
 * Servlet implementation class boardInsertService
 */
public class boardInsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		int sr_num = Integer.parseInt(request.getParameter("sr_num"));
		String b_title= request.getParameter("b_title");
		String b_contents = request.getParameter("b_contents");
		String user_id = request.getParameter("user_id");
		
		tb_boardVO vo = new tb_boardVO(sr_num, b_title, b_contents, user_id);
		
		System.out.println(vo.toString());
		
		tb_boardDAO dao = new tb_boardDAO();
		int res = dao.boardInsert(vo);
		
		if(res>0) { //삽입성공
			System.out.println("전송성공");
			//response.sendRedirect("#");
		}else { // 삽입실패
			System.out.println("전송실패");
			//response.sendRedirect("#");
		}
		
		
		response.sendRedirect("enterStudyRoom.jsp");
		
		
	}

}
