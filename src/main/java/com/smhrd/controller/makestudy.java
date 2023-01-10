package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_srVO;


public class makestudy extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sr_name = request.getParameter("sr_name"); 
		int sr_aog = Integer.parseInt(request.getParameter("sr_aog"));
		int sr_capacity = Integer.parseInt(request.getParameter("sr_capacity"));
		String location = request.getParameter("location"); 
		String sr_gender = request.getParameter("sr_gender"); 
		
		tb_srVO vo = new tb_srVO(sr_name, sr_aog, sr_capacity, location, sr_gender);
		
	}

}
