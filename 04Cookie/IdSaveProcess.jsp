<%@page import="utils.CookieManager"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String user_id = request.getParameter("user_id"); 
 String user_pw = request.getParameter("user_pw");
 String save_check =request.getParameter("save_check");
 
 if("kkw".equals(user_id) && "1234".equals(user_pw)){
	 if(save_check != null && save_check.equals("Y")){
		 //아이디 저장하기 체크이면
		 CookieManager.makeCookie(response, "loginId", user_id, 86400);
		 //쿠키 생성
	 }else{
		 //아이디 저장하기 체크 안되어 있으면
		 CookieManager.deleteCookie(response, "loginId");
	 }
	 JSFunction.alertLocation("로그인 성공", "IdSaveMain.jsp", out);
 } else{
	 JSFunction.alertBack("로그인 실패-id/pw가 다릅니다.", out);
 }
%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>IdSaveProcess.jsp : 로그인 처리(성공, 실패+쿠키+얼럿)</title></head>
<body>

</body>
</html>