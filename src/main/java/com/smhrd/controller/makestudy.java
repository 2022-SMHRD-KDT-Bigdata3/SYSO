package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_srDAO;
import com.smhrd.model.tb_srVO;



public class makestudy extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("makestudy.jsp에서 넘어옴");		
		
		String sr_name = request.getParameter("sr_name");
		String user_id = request.getParameter("user_id");
		System.out.println("user_id");
		String sr_gender = request.getParameter("sr_gender");
		int sr_aog = Integer.parseInt(request.getParameter("sr_aog"));
		String location = request.getParameter("location");
		int sr_capacity = Integer.parseInt(request.getParameter("sr_capacity"));
		int sb_num = Integer.parseInt(request.getParameter("sb_num"));
		
		tb_srVO vo = new tb_srVO(sr_name, user_id, sr_gender, sr_aog, location, sr_capacity, sb_num);
		tb_srDAO dao = new tb_srDAO();
		
		int res = dao.makestudy(vo);
		

		
		
		
	}
}