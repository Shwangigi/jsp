<%@page import="memberShip.MemberDTO"%>
<%@page import="memberShip.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>LoginProcess.jsp : form으로 받은 request 값 처리</title></head>
<body>
<!-- dto와 dao를 이용하여 로그인 처리 -->

   <%
   String userId = request.getParameter("user_id");
   String userPwd = request.getParameter("user_pw");
   // 폼에서 넘어온 데이터를 변수로 넣음
   
   // dao는 web.xml 2번째 생성자로 적용
    String driver = application.getInitParameter("OracleDriver");
    String url = application.getInitParameter("OracleURL");
    String id = application.getInitParameter("OracleId");
    String pw = application.getInitParameter("OraclePw");
   
    MemberDAO memberDAO = new MemberDAO(driver,url,id,pw); // 1단계 , 2단계 
    MemberDTO memberDTO = memberDAO.getMemberDTO(userId,userPwd); // 3,4단계
    memberDAO.close(); // 5단계
    // id, pw를 넣고 객체를 받음 -> 성공 dto, 실패 null
    
    // 성공 시 세션 -> 실패는 돌아감
    
    if(memberDTO.getId() !=null){
    	// db에 정보가 있음
    	session.setAttribute("UserId", memberDTO.getId()); // 세션에 id 넣음
    	session.setAttribute("UserName", memberDTO.getName()); // 세션에 name 넣음
    	// 돌아가야함
    	response.sendRedirect("LoginForm.jsp");
    } else{
    	// db에 정보가 없다.
    	request.setAttribute("LoginErrMsg", "ID나 PW를 확인해주세요.");
    	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
    }
   %>
</body>
</html>