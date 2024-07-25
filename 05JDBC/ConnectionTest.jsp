<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>ConnectionTest.jsp : jdbc 연결 확인</title></head>
<body>
   <h2>jdbc 테스트 1 - 생성자편</h2>
   <%
   JDBConnect jdbConnect = new JDBConnect(); // 1단계 , 2단계
   jdbConnect.close(); //5단계 성공  
   %>
</body>
</html>