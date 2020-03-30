<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
//데이터 베이스 변환
String seq=request.getParameter("c");
String sql="select * from notices where seq="+seq;
//db connect
//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
//실행
Statement st=con.createStatement();
//결과
ResultSet rs=st.executeQuery(sql);
rs.next();
%>




<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify</title>
<link rel="stylesheet" href="../css/nstyle.css" />
<h3>noticeEdit.jsp</h3>
</head>
<body>
<form action="noticeEditProc.jsp" method="post">
<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Modify</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td><%=rs.getString("seq") %></td>
			<th class="left">조회수</th>
			<td><%=rs.getInt("hit") %></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td><%=rs.getString("writer") %></td>
			<th class="left">작성시간</th>
			<td><%=rs.getDate("regdate") %></td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3">
			<input type="inp" name="title" value="<%=rs.getString("TITLE") %>" />
			</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content">
			<textarea class="txt" name="content"><%=rs.getString("CONTENT") %></textarea>
			</td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addFile">
			첨부
			</td>
		</tr>
	</tbody>
</table>
<div>
<input type="hidden" name="c" value="<%=rs.getString("SEQ") %>" />
<input type="submit" value="저장" />
<a href="noticeDetail.jsp?c=<%=rs.getString("SEQ") %>">취소</a>
</div>
</form>
</body>
</html>
<%
st.close();
rs.close();
con.close();
%>