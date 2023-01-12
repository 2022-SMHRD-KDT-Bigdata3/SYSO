package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DataBase.SqlSessionManager;

public class tb_boardDAO {

   private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
   private SqlSession session;
   
   
   public int boardInsert(tb_boardVO vo) {
      
      session = sqlSessionFactory.openSession(true);
      int res = 0;
      res = session.insert("boardInsert", vo);
      session.close();
      return res;
      
   }
   
   public int boardDelete(tb_boardVO vo) {
      
      int res = 0;
      session = sqlSessionFactory.openSession(true);
      res = session.delete("boardDelete", vo);
      session.close();
      return res;
   }
   
   public ArrayList<tb_boardVO> boardSelect(String user_id) {
      session = sqlSessionFactory.openSession(true);
      List<tb_boardVO> list = session.selectList("boardSelect", user_id);
      session.close();
      //다운캐스팅해서 리턴
      return (ArrayList<tb_boardVO>)list;
   }
   

   public ArrayList<tb_boardVO> boardSelectAll() {
      
      session = sqlSessionFactory.openSession(true);
      List<tb_boardVO> list = session.selectList("boardSelectAll");
      session.close();
      return (ArrayList<tb_boardVO>)list;
      
   }
   
}