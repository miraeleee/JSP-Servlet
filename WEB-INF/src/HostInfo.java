package com.test.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/servlet/hostinfo") //상대경로를 넣어줌
public class HostInfo extends HttpServlet{
    //외부라이브러리
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException{
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter(); // 값을얻어와서 웹브라우저에 뿌려준다. 세트로 사용됨. // 예외처리발생시킨다. 
        out.println("!DOCTYPE html");
        out.println("<html>");
        out.println("   <head>");
        out.println("       <title>클라이언트 주소를 읽는 서블릿 예제</title>");
        out.println("   </head>");
        out.println("<body>");
        out.println("   <h1>클라이언트 주소를 읽는 서블릿 예제</h1>");
        out.println("     <h2>클라이언트 IP:"+request.getRemoteAddr()+"</h2>");
        out.println("     <h2>클라이언트 POST:"+request.getRemoteHost()+"</h2>");
        out.println("     <h2>클라이언트 Request URI:"+request.getRequestURI()+"</h2>");
        out.println("</body>");
        out.println("</html>");
                
    }

}
