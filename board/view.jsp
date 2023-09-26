<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset= UTF-8" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록 보기</title>
    <style>
        body{font-family:"나눔고딕","맑은고딕";}
        h1{font-family:"HY견고딕";}
        a:link {color: black;}
        a.visited {color: black;}
        a:hover {color: red;}
        a {text-decoration: none, cursor: hand;}
        .main{
            text-align: center;
        }
        .topBanner{
            margin-top: 10px;
            margin-bottom: 10px;
            max-width: 500px;
            height: auto;
            display: block;
            margin: auto;
        }
        .boardView{
            width: 60%;
            height: auto;
            margin: auto;
            padding: 20px, 20px;
            background-color: white;
            border: solid 4px gray;
            border-radius: 20px;
        }
        .items{
            width: 90%;
            height: 25px;
            outline: none;
            color: #636e72;
            font-size: 16px;
            background: none;
            border-bottom: 2px solid #adadad;
            margin: 30px;
            padding: 10px 10px;
            text-align: left;
        }
        .textArea{
            width: 90%;
            height: 350px;
            overflow: auto;
            margin: 12px;
            padding: 10px;
            box-sizing: border-box;
            border: 2px solid #adadad;
            text-align: left;
            font-size: 16px;
            resize: both;
        }
        .bottom_menu{
                margin-top: 20px;
            }
        .bottom_menu > a:link, .bottom_menu .a:visited{
                background-color: #FFA500;
                color: maroon;
                padding: 15px 25px;
                text-align: center;
                display: inline-block;
                text-decoration: none;
            }
        .bottom_menu > a:hover, .bottom_menu > a:active{
                background-color: #1E90FF;
                text-decoration: none;
            }
    </style>
</head>

    <%
    //문자열을 문자로 변환 wapper함수
    String seqno =  request.getParameter("seqno");
    String uri = "jdbc:oracle:thin:@localhost:1521:xe";
    String userid = "springdev";
    String userpw = "12345";
    String query="select title,writer,to_char(regdate,'YYYY-MM-DD HH24:MI:SS') as regdate, content from tbl_board where seqno="+seqno;
    System.out.println("게시물 상세보기 SQL = + query");

    String writer="";
    String title="";
    String regdate = "";
    String content="";


    //response 시에 브라우저에 한글을 UTF-8으로 인코딩해서 출력 
    response.setCharacterEncoding("utf-8");

    Connection con;
    Statement stmt;
    ResultSet rs;

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection(uri, userid, userpw);
        stmt = con.createStatement();
        rs = stmt.executeQuery(query);

        if(rs.next()){
        writer =rs.getString("writer");
        title =rs.getString("title");
        regdate =rs.getString("regdate");
        content =rs.getString("content");
        }
        }catch(Exception e){
            e.printStackTrace();
        }

%>
<body>
    <div class="main">
        <img src="/images/logo.jpg" class="topBanner"><br>
        <h1 style="text-align: center;">게시물 내용보기</h1>
        <br>
        <div class="boardView">
            <div class="items">글쓴이 : <%=writer%></div>
            <div class="items">제목 : <%=title%></div>
            <div class="items">날짜 : <%=regdate%></div>
            <div class="textArea"><pre></pre><%=content%></pre></div>
        </div>

    <div class="bottom_menu">
        <a href="/board/list.jsp">목록가기</a>&nbsp;&nbsp;
        <a href="/board/write.jsp">글 작성</a>&nbsp;&nbsp;
        <a href="/board/modify.jsp">글 수정</a>&nbsp;&nbsp;
        <a href="#">글 삭제</a>
    </div>
</div>
</body>
</html>
