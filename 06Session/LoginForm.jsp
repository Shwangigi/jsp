<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>LoginFrom.jsp : 로그인 구현</title></head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	 <h2>로그인 페이지</h2>
    <span style="color: red; font-size: 1.2em;"> <!-- 글자와 글자크기 지정 -->
        <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %> 
        <!-- 조건 : request 영역에 "LoginErrMsg" 가 있니? true : false -->
    </span> <!-- span 태그는 1줄 글자 출력용 -->
    
    <%
    if (session.getAttribute("UserId") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %> <!-- 로그인 스크립트 실행 -->
    
    <script>
    function validateForm(form) { /* validateForm을 호출하면 form(29~34) 정보를 받는다. */
        if (!form.user_id.value) { /* form 안에 user_id 안에 값이 ! */
            alert("아이디를 입력하세요."); /* 경고창 */
            return false; /* flase 리턴 */
        }
        if (form.user_pw.value == "") { /* form안에 user_pw안에 값이 없으면 */
            alert("패스워드를 입력하세요."); /* 경고창 */
            return false; /* false를 리턴 */
        }
    }
    </script>
    
    <form action="LoginProcess.jsp" method="get" name="loginFrm"
        onsubmit="return validateForm(this);"><!-- onsubmit 검증 먼저 하고 action으로 보냄 -->
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인하기" />
    </form>
    
    <%
    } else { // 로그인된 상태
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a> <!-- 세션을 제거 -->
    <%
    }
    %>
  
</body>
</html>