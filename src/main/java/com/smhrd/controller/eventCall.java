package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class eventCall extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String email = request.getParameter("email");
//		
//		MsgMemberDAO dao = new MsgMemberDAO();
//		//실습
//		// MsgMemberDAO에 idCheck 메소드를 통해 중복된 회원이 존재하는지 기능을 만드시오
//		// 1. MsgMemberDAO idCheck(email) 메소드를 정의
//		// 2. idCheck메소드에서 email과 일치하는 회원이 있으면 회원읠 정보를
//		//    MsgMemberVO로 묶어서 리턴
//		// 3. 일치하는 회원이 없으면 null리턴
//		// 4. mapper.xml에 sql문장을 작성할 것(login참고)
//		MsgMemberVO check =  dao.idCheck(email);
//		
//		//비동기방식에서 해당 Servlet에서 JSON 또는 text형태로 결과값을 return 해주고 싶다면
//		//out객체를 활용한다
//	PrintWriter out = response.getWriter();
//		if(check != null) {
//			System.out.println("중복된 회원이 존재함");
//			out.print("{\"idCheck\" : \"NO\"}");
//		}else {
//			System.out.println("중복된 회원이 존재하지 않음");
//			out.print("{\"idCheck\" : \"OK\"}");
//		}
//		
	}

}
