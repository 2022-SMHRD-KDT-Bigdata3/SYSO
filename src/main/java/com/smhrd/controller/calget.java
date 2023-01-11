package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.tb_calDAO;
import com.smhrd.model.tb_calVO;

@WebServlet("/calget")
public class calget extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		tb_calDAO dao = new tb_calDAO();
		List<tb_calVO> list=dao.calget();
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		Gson g=new Gson();
		String json=g.toJson(list);
		out.print(json);
	}
}
