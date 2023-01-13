package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tb_mysrVO;
import com.smhrd.model.tb_srDAO;



public class joinStudyRoom extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int sr_num = Integer.parseInt(request.getParameter("sr_num"));
      String user_id = request.getParameter("user_id");
      String sr_name = request.getParameter("sr_name");
      String sb_num = request.getParameter("sb_num");
      //가져온 user_id 확인용 출력
      System.out.println(sr_num);
      System.out.println(user_id);
      System.out.println(sr_name);
      System.out.println(sb_num);
      
      //tb_mystudyroom테이블에 각 sr_num, user_id, sr_name, sr_joindate(sysdate로) 컬럼에 값 추가
      
      //위의 정보들을 vo 형태로 만들기
      
      tb_mysrVO mysr_info = new  tb_mysrVO(sr_num, user_id, sr_name,sb_num);
      
      tb_srDAO dao = new tb_srDAO();
      int res = dao.joinStudyRoom(mysr_info);
      if(res > 0) {
         System.out.println("스터디 가입 성공!");
      }else {
         System.out.println("스터디 가입 실패~");
      }
      
      //잘 가입이되면 메인페이지의 나의 스터디 목록에서 출력
      //검색한 내용을 세션에 담아 보내기
      HttpSession session = request.getSession();
      session.setAttribute("mysr_info", mysr_info);
      //페이지 이동
      RequestDispatcher re = request.getRequestDispatcher("enterStudyRoom.jsp");
      re.forward(request, response);

   };
      
      

}