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
            .main{
                text-align: center;
            }
            .InfoTable {
            border-collapse: collapse;
            border: 3px solid #168;
            width: 800px;
            margin: auto;
            text-align: center;
            }
            .InfoTable th {
                color: #168;
                background: #f0f6f9;
            }
            .InfoTable th, .InfoTable td {
                padding: 10px;
                border: 1px solid #ddd;
            }
            .InfoTable th:first-child, .InfoTable td:first-child {
                border-left: 0;
            }
            .InfoTable th:last-child, .InfoTable td:last-child {
                border-right: 0;
            }
            .InfoTable tr td:first-child{
                text-align: center;
            }
            .bottom_menu>a:hover, .bottom-menu >a:active{
                background-color: #1E90FF;
                text-decoration: none;
            }
            .botton_menu{
                margin-top: 20px;
            }
            .bottom_menu >a:link, .bottom_menu >a:visited{
                background-color: #FFA500;
                color: maroon;
                padding: 15px 25px;
                text-align: center;
                display: inline-block;
                text-decoration: none;
            }
            .bottom_menu>a:hover, .bottom_menu>a:active{
                background-color: #1E90FF;
                text-decoration: none;
            }
            </style>

</head>
<%
    String uri = "jdbc:oracle:thin:@localhost:1521:xe";
    String userid = "springdev";
    String userpw = "12345";
    String query="select seqno,title,writer,to_char(regdate,'YYYY-MM-DD HH24:MI:SS') as regdate,hitno from tbl_board order by seqno desc";

    //response 시에 브라우저에 한글을 UTF-8으로 인코딩해서 출력 
    response.setCharacterEncoding("utf-8");

    Connection con;
    Statement stmt;
    ResultSet rs;
    //지금까지는 값출력이었음
%>
<body>
    
    <div class="main">
        <h1 style="text-align: center;">게시물 목록</h1>
        <table class="InfoTable">
            <tr >
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            <%
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                        con=DriverManager.getConnection(uri, userid, userpw);
                        stmt = con.createStatement();
                        rs = stmt.executeQuery(query);

                        while(rs.next()){
                %>
            
                <tr onMouseover="this.style.background='#46D2D2'"onMouseout="this.style.background='white'">
                    <td><%=rs.getInt("seqno")%></td>
                    <td style="text-align: left;"><a href="/board/vies.jsp?seqno=<%=rs.getInt("seqno")%>" onmouseover="this.style.textDecoration='underline'"onmouseout="this.style.textDecoration='none'"><%=rs.getString("title")%></a></td>
                    <td><%=rs.getString("writer")%></td>
                    <td><%=rs.getString("regdate")%></td>
                    <td><%=rs.getInt("hitno")%></td>
                </tr>
                
                <%            
                }
                    if(rs != null) rs.close();
                    if(stmt != null) stmt.close();
                    if(con != null) con.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
                
            %>
           
        </table> 
        <br>
        <div class="bottom_menu">
            <a href="/board/write.jsp">글쓰기</a>

        </div>
    </div>
</body>
</html>