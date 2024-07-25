<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Logout.jsp : 로그아웃 페이지</title></head>
<body>
<%
// 방법 1: 회원정보인증 속성 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserName");

// 방법 2: 모든 속성 한꺼번에 삭제
session.invalidate();

// 속성 삭제 후 페이지 이동
response.sendRedirect("LoginForm.jsp");


%>
</body>
</html>