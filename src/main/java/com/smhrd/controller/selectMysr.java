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


public class selectMysr extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		System.out.println(user_id);
		
		tb_srDAO dao = new tb_srDAO();
		
		ArrayList<tb_mysrVO> list= dao.selectMysr(user_id);
		
		if(list!=null) {
			System.out.println("나의 스터디정보 가져오기 성공");

			for(tb_mysrVO vo : list) {
				System.out.println(vo.toString());
			}
			
			request.setAttribute("selectMysr_info", list);
			
			RequestDispatcher rdi = request.getRequestDispatcher("studyCafe.jsp#page-top");
			rdi.forward(request, response);
			
			
			
			
//			HttpSession session = request.getSession();
//			session.setAttribute("selectMysr_info", list);
//			response.sendRedirect("studyCafe.jsp");
//		}else {
//			System.out.println("내 스터디정보 가져오기 실패");
//			response.sendRedirect("mainPage.jsp");
//		}
		
		
		
	}

	}
}
