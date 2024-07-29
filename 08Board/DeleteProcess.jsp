<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="./IsLoggedIn.jsp" %>
    <%
    String num = request.getParameter("num");
    
    BoardDTO boardDTO = new BoardDTO(); // 빈객체 생성
    BoardDAO boardDAO = new BoardDAO(application); // 1,2단계
    boardDTO = boardDAO.selectView(num); // 번호를 개체로 가져와 dto에 넣음
    
    String sessionId = session.getAttribute("UserId").toString(); // 로그인이름 가져옴
    
    int delResult = 0; // 삭제 성공여부 판단 1:성공 0:실패
    
    if(sessionId.equals(boardDTO.getId())){ // 로그인한 사용자이름 일치
    	// 작성자 본인이면 삭제
    	boardDTO.setNum(num);
        delResult = boardDAO.deletePost(boardDTO); // 객체를 넣어 삭제하고 int로 받음 3,4단계
        boardDAO.close(); // 5단계
        
        if(delResult == 1){
        	// 삭제 성공
        	JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
        }else{
        	// 삭제 실패
        	JSFunction.alertBack("삭제 실패-뒤로 갑니다.", out);
        	return;
        }
    }else{
    	// 본인이 아니면 삭제 안됨
    	JSFunction.alertBack("본인만 삭제됩니다.", out);
    	return;
    }
    
    %>