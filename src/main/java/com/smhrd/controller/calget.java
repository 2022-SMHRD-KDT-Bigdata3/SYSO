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
		
		String user_id = request.getParameter("user_id");
	//	String content = request.getParameter("title");
	//	String start1 = request.getParameter("start");
	//	String end1 = request.getParameter("end");		
	//	tb_calVO vo = new tb_calVO(user_id,content,start1,end1);
		
		
		tb_calDAO dao = new tb_calDAO();
		//다오야 내 일정 겟 해줘... 
		List<tb_calVO> list=dao.calget(user_id);
		for(int i=0; i<list.size(); i++) {
			System.out.println(i+1);
		} //데이터 전부 다 겟 해오는지 확인함. 
		
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		Gson g=new Gson();
		String json=g.toJson(list);
		
		
		out.print(json);	

	}
}
