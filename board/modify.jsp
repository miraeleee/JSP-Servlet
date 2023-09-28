<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset= UTF-8" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>게시물 수정           
        </title>
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
            .WriteForm{
                width: 60%;
                height: auto;
                margin: auto;
                padding: 20px;
                background-color: #FFFFFF;
                text-align: center;
                border: 4px solid gray;
                border-radius: 30px;
            }
            .items{
                width: 90%;
                border: none;
                border-bottom: 2px solid gray;
                padding: 10px 10px;
                outline: none;
                color: #636e72;
                height: 25px;
                background: none;
                }
            #content{
                width: 90%;
                height: 300px;
                box-sizing: border-box;
                border: solid gray;
                font-size: 16px;
                resize: both;
                }
                .btn_write{
                    position: relative;
                    margin: 20px;
                    margin-bottom: 10px;
                    height: 40px;
                    width: 40%;
                    background: red;
                    color: white;
                    font-weight: bold;
                    border: none;
                    cursor: pointer;
                    display: inline;
                }
                .btn_cancel{
                    position: relative;
                    margin: 20px;
                    margin-bottom: 10px;
                    height: 40px;
                    width: 40%;
                    background: pink;
                    background-size: 200%;
                    color: white;
                    font-weight: bold;
                    border: none;
                    cursor: pointer;
                    display: inline;
                }
        </style>
        <script>
            function modifyForm(){
                let writer = document.querySelector('#writer')
                let title = document.querySelector('#title')
                let content = document.querySelector('#content')

                
                // 필수값 등록시 값 입력 여부 확인 
                if(writer.value === ''){ //document.WriteForm.writer.value --> DOM모델:Document Object Model
                    alert('이름을 입력하세요!!');
                    writer.focus();
                    return false; //함수 전체를 나와야 함 
                }
                if(title.value === ''){
                    alert('제목을 입력하세요!!');
                    title.focus();
                    return false;
                }
                if(content.value === ''){
                    alert('내용을 입력하세요!!');
                    content.focus();
                    return false;
                }
                document.ModifyForm.action='/board/modify'; //자바파일으로 이동
                document.ModifyForm.submit();
            }
        </script>
</head>
<%
int seqno = Integer.parseInt(request.getParameter("seqno"));

String uri = "jdbc:oracle:thin:@localhost:1521:xe";
    String userid = "springdev";
    String userpw = "12345";
    String query="select title,writer,to_char(regdate,'YYYY-MM-DD HH24:MI:SS') as regdate, content from tbl_board where seqno=" + seqno;

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
        stmt = con.createStatement(); //stmt는 자동으로 닫히는 경우가 있어 추가시 새로 생성 
        rs = stmt.executeQuery(query); 
        
        if(rs.next()){
            writer =rs.getString("writer");
            title =rs.getString("title");
            regdate =rs.getString("regdate");
            content =rs.getString("content");
            }

        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(con != null) con.close();
    
        }catch(Exception e){
            e.printStackTrace();
        }

%>
<body>
    <div class="main">
        <img src="/images/logo.jpg" class=topBanner><br>
        <h1>게시물 수정</h1>
        <br>
        <div id="formZone">
            <form class="ModifyForm" name="ModifyForm" method="post">
                <input type="text" id="writer" class="items" name="writer" value="<%=writer%>">
                <input type="text" id="title" class="items" name="title" value="<%=title%>">
                <input type="hidden" name="seqno" value="<%=seqno%>">
                <br><br>
                <textarea name="content" id="content" cols="100" rows="500" name="content"><%=content%></textarea>
                <input type="button" class="btn_write"  value="수정" onclick="modifyForm()">
                <input type="button" class="btn_cancel"  value="취소" onclick="history.back()">
            </form>
        </div>
        <br><br>
    </div>
</body>

</html>
