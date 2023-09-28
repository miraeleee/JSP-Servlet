//servlet만들기
package com.test.board;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/board/write") //상대경로
public class write extends HttpServlet{
    // @Override //GET방식으로 할것이라 doGet
    // public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException{ //예외처리용
    //     doPost(request,response);
    // }

   @Override //post방식으로 할것이라 doPost,인자 2개입력
   public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException{ //예외처리용
        //한글깨지지말라는 요청
        request.setCharacterEncoding("utf-8");
        String uri = "jdbc:oracle:thin:@localhost:1521:xe";
        String userid = "springdev";
        String userpw = "12345";

         Connection con = null;
         Statement stmt = null;
        //write.jsp파일에서 값받아오기
        String writer = request.getParameter("writer"); //인자는 name과 같아야함, keyvalue형태로 보냄,writer가 key임
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        

        //받아온값 DB넣어주기
        String query="insert into tbl_board (seqno,userid,writer,title,content,regdate) values"
            +"(tbl_board_seq.nextval,'xavier','"+ writer +"','"+ title +"','"+ content+"',sysdate)";
        System.out.println("게시물 등록 SQL:"+ query);

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");//드라이버 로딩
            con=DriverManager.getConnection(uri, userid, userpw);//파라미터값으로 db연결
            stmt = con.createStatement();//query 실행환경설정
            stmt.executeUpdate(query);//query실행하고 그 결과를 statement에 담는다. 

            if(stmt != null)stmt.close();
            if(con != null)con.close();

            //지금까지 잘 작동했으면 아래 경로로 Redirect이동해라
            response.sendRedirect("/board/list.jsp");
            
        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
