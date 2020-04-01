<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainForm.jsp</title>
<script>
function logoutProc() {
	location.href="login/logoutProc.jsp";
}
</script>
<h2>MainForm.jsp</h2>
</head>
<body>
<b> <font size="3" color="skyblue">메인화면입니다.</font></b> <br />
<%
	if(session.getAttribute("sessionID")==null) // 세션값(입력안된상태)이 null 이라면 로그인이 안된상태, MainForm.jsp에서 실행했을때
	//session에 기본값은 아무것도 없기때문에 null로 해당되어 loginform.jsp로 보내진상태로 인터넷창이 열림
	{
		//로그인화면으로 이동
		response.sendRedirect("login/loginForm.jsp");
	}else{
%>
<!-- html영역 -->
<h3>
<font color="red"> <%=session.getAttribute("sessionID") %> </font>
님이 로그인 되었습니다.
</h3>
<br /><br />
<input type="button" value="logout" onclick="logoutProc();" />
<%
	}
%>


</body>
</html>