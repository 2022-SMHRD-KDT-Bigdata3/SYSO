package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_calDAO;
import com.smhrd.model.tb_calVO;
import com.smhrd.model.tb_user;
import com.smhrd.model.tb_userDAO;


public class CalendarService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String color = request.getParameter("color");
		
		tb_calVO vo = new tb_calVO(content, start, end, color);
	      
	      tb_calDAO dao = new tb_calDAO(vo);
	     // ArrayList<E> res = dao.insertEvent();
	      
	      int res=dao.insertEvent(vo);      
	      if(res > 0) { //삽입성공
	         //response.sendRedirect("mainPage.jsp");
	         System.out.println("일정저장성공");
	      }else {//삽입실패
	         //response.sendRedirect("startPage.jsp");
	    	  System.out.println("일정저장실패");
	      }
	   }


	

		
	}

