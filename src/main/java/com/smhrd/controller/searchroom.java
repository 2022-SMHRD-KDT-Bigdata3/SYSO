package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.smhrd.model.tb_srDAO;
import com.smhrd.model.tb_srVO;

/**
 * Servlet implementation class searchroom
 */
public class searchroom extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sr_name = request.getParameter("sr_name");
		String sr_gender = request.getParameter("sr_gender");
		int sr_aog = Integer.parseInt(request.getParameter("sr_aog"));
		String location = request.getParameter("location");
		
		tb_srVO vo = new tb_srVO(sr_name, sr_gender, sr_aog, location);
		
		tb_srDAO dao = new tb_srDAO();
		
		ArrayList<tb_srVO>list =  dao.searchRoom(vo);
		
		for(tb_srVO sr_info : list) {
			System.out.println(vo.toString());
		}
		
		//request.setAttribute("memberList", list);
		
		//RequestDispatcher rdi = request.getRequestDispatcher("memberList.jsp");
	}

}
