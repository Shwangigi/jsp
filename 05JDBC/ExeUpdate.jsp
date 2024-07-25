<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title></head>
<body>
 <h2> 회원추가 테스트 사용 </h2>
 <!-- 동적 쿼리문으로 데이터 입력 -->
 <%
 JDBConnect jdbc = new JDBConnect(); // db 연결 코드 -> 안에 1,2단계 있음
  String id ="test1";
  String pw = "test1";
  String name = "김강진";
 /* member 표 안에 값 넣기 */  
  
 /* 쿼리문 작성 */
 String sql ="insert into memeber values( ?, ?, ?,sysdate)";
 PreparedStatement preparedStatement = jdbc.connection.prepareStatement(sql);
 preparedStatement.setString(1, "id");
 preparedStatement.setString(2, "pw");
 preparedStatement.setString(3, "name");
 // 인파라미터로 나중에 값을 대입
 
 // 쿼리 수행
 int result = preparedStatement.executeUpdate();

 out.println(result + "행이 입력되었습니다.");

 // 연결 닫기
 jdbc.close();
 %>
</body>
</html>