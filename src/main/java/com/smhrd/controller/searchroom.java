package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.searchsrVO;
import com.smhrd.model.tb_srDAO;
import com.smhrd.model.tb_srVO;

/**
 * Servlet implementation class searchroom
 */
public class searchroom extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String search_name = request.getParameter("search_name");
      String search_gender = request.getParameter("search_gender");
      int search_aog = Integer.parseInt(request.getParameter("search_aog"));
      String search_lo = request.getParameter("search_lo");
      
      searchsrVO vo = new searchsrVO(search_name, search_gender, search_aog, search_lo);
      
      tb_srDAO dao = new tb_srDAO();
      
      ArrayList<tb_srVO>list =  dao.searchRoom(vo);
      
      for(tb_srVO srvo : list) {
         System.out.println(srvo.toString());
      }
      
      //검색한 내용을 세션에 담아 보내기
      request.setAttribute("searchList", list);
      
      RequestDispatcher rdi = request.getRequestDispatcher("searchSrList.jsp");
      rdi.forward(request, response);
   }

}