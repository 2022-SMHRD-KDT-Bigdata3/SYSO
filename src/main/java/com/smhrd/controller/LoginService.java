package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tb_user;
import com.smhrd.model.tb_userDAO;


public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id"); 
		String user_pw = request.getParameter("user_pw"); 

		tb_user user = new tb_user(user_id,user_pw);		
		tb_userDAO dao = new tb_userDAO();
		
		tb_user info  = dao.login(user);
		
		if(info != null) {
			System.out.println("로그인 성공");
			System.out.println(info.toString());
			HttpSession session = request.getSession();
			session.setAttribute("info", info);

		}
		else {
			System.out.println("로그인 실패");
			RequestDispatcher re = request.getRequestDispatcher("startPage.jsp");
			re.forward(request, response);
		}
		RequestDispatcher re = request.getRequestDispatcher("mainPage.jsp");
		re.forward(request, response);
	}

}
