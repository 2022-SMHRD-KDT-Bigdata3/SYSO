package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_user;
import com.smhrd.model.tb_userDAO;


public class JoinService extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      String user_id = request.getParameter("user_id");
      String user_pw = request.getParameter("user_pw");
      String user_name = request.getParameter("user_name");
      String user_nick = request.getParameter("user_nick");
      String user_email = request.getParameter("user_email");
      String user_aog = request.getParameter("user_aog");
      String gender = request.getParameter("gender");
      String yob = request.getParameter("yob");
      String phone = request.getParameter("phone");

      
      tb_user user = new tb_user(user_id, user_pw, user_name, user_nick, user_email, user_aog, gender, yob, phone);
      
      tb_userDAO dao = new tb_userDAO();
      int res = dao.join(user);
      
      if(res > 0) { //삽입성공
         response.sendRedirect("mainPage.jsp");
         System.out.println("login");
      }else {//삽입실패
         response.sendRedirect("startPage.jsp");
      }
   }

}
