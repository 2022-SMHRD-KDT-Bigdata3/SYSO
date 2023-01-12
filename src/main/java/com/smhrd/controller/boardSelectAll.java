package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.tb_boardDAO;
import com.smhrd.model.tb_boardVO;

public class boardSelectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		tb_boardDAO dao = new tb_boardDAO();
		ArrayList<tb_boardVO> list = dao.boardSelectAll();
		
		for(tb_boardVO vo : list) {
			System.out.println(vo.toString());
		}
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
			
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println(result);
		out.print(result);
		
		
		
		
		
	}

}
