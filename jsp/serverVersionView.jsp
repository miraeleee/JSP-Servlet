<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset= UTF-8" %>
<HTML>
    <HEAD>
        <style>
            .info{
                position:relative;
                top: 150px;
                width: 60%;
                margin: auto;
                padding-left: 30px;
               font-size: 300%;
               border: solid 1px gray;
            }
        </style>
        <title>JSP/Servlet 버전 확인</title>
        <meta charset="UTF-8">
    </HEAD>

    <BODY>
        <div class="info">
            <ul>
                <li></li>서버버전: <%=application.getServerInfo()%><br>
                <li></li> 서블릿버전: <%=application.getMajorVersion()%>.<%=application.getMinorVersion()%><br>
                <li></li>JSP버전: <%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion()%>
            </ul>
        </div>
    </BODY>
</HTML>