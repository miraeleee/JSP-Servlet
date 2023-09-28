<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset= UTF-8" %>


<!DOCTYPE html>
<meta charset="UTF-8">
<html>
    <%--JSP프로그래밍--%>
<body>
    <h1>안녕하세요!</h1>
    <%!
        //클래스선언
        class Calculator{

            int sum(){
                int sum=0;
                for(int i =0; i<=100; i++)  // 1부터 100 더하기
                sum=sum+i;
                return sum;
             }
        }
    %>
    <%
        Calculator cal = new Calculator();
        int sum = cal.sum();
    %>
    <h1>1부터 100까지의 합은 <%=sum %>입니다. </h1>
</body>
</html>







