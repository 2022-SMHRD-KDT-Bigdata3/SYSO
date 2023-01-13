package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tb_mysrVO;
import com.smhrd.model.tb_srDAO;
import com.smhrd.model.tb_srVO;


public class enterMysr extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_nick = request.getParameter("user_nick");
		int sr_num = Integer.parseInt(request.getParameter("sr_num"));
		String sr_name = request.getParameter("sr_name");
		String sb_num = request.getParameter("sb_num");
		
		System.out.println(user_id+"/"+user_nick+"/"+sr_num+"/"+sr_name+"/"+sb_num);
		
		tb_mysrVO vo = new tb_mysrVO(sr_num, user_id);
		
		
		tb_srDAO dao = new tb_srDAO();
		tb_srVO enter_info= dao.enterStudyRoom(vo);
		
		if(enter_info!=null) {
			System.out.println("나의 스터디정보불러오기 성공");
			System.out.println(enter_info.toString());
		}else {
			System.out.println("나의 스터디 정보불러오기 실패");
		}
		
		
		//검색한 내용을 세션에 담아 보내기
		HttpSession session = request.getSession();
		session.setAttribute("enter_info",enter_info);
				
		RequestDispatcher rdi = request.getRequestDispatcher("enterStudyRoom.jsp");
		rdi.forward(request, response);
		
		
	}

}
