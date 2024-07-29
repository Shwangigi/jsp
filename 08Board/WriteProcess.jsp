<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./IsLoggedIn.jsp"%> <!-- 로그인 여부확인 -->
<%
   String title = request.getParameter("title");
   String content= request.getParameter("content"); // Write.jsp에서 넘어온 값
   
   BoardDTO boardDTO = new BoardDTO(); // 빈 객체 생성
   boardDTO.setTitle(title);
   boardDTO.setContent(content);
   boardDTO.setId(session.getAttribute("UserId").toString()); // 세션영역에 있는 값은 객체임
   // 객체에 제목, 내용 , 작성자가 보관완료
   
   //3,4단계 적용
   BoardDAO boardDAO = new BoardDAO(application); // 1,2단계
   int result = boardDAO.insertWrite(boardDTO); // 3,4단계
   boardDAO.close(); // 5단계
   
   if(result == 1){
	   // insert 결과 값이 1이면 성공
	   response.sendRedirect("List.jsp"); // 성공시 리스트로 감
   }else{
	   // 실패
	   JSFunction.alertBack("글저장실패 뒤로 갑니다.", out);
   }
%>