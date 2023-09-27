package board;

import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/board/delete")
public class delete extends HttpServlet{
    //get방식
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        int seqno = Integer.parseInt(request.getParameter("seqno")); // 값을 int로 변환
        request.setCharacterEncoding("utf-8");
        String uri = "jdbc:oracle:thin:@localhost:1521:xe";
        String userid = "springdev";
        String userpw = "12345";

        String query = "delete from tbl_board where seqno="+seqno;

        Connection con;
        Statement stmt;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(uri, userid, userpw);
            stmt = con.createStatement();
            stmt.executeUpdate(query); 
            //지금까지 잘 작동했으면 아래 경로로 Redirect이동해라
            response.sendRedirect("/board/list.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){  
        doGet(request,response);   
    }
}
