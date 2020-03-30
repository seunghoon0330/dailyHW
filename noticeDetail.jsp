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
<title>detail</title>
<link rel="stylesheet" href="../css/nstyle.css" />
<h3>noticeDetail.jsp</h3>
</head>
<body>
<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="45%"/>
		<col width="15%"/>
		<col width="45%"/>
	</colgroup>
	<caption>Detail</caption>
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
			<%=rs.getString("title") %>
			</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content">
			<%=rs.getString("content") %>
			</td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addFile">
			</td>
		</tr>
	</tbody>
</table>
<div>
<a href="noticeEdit.jsp?c=<%=rs.getString("SEQ") %>">수정</a>
<a href="#">삭제</a>
<a href="notice.jsp">목록</a>
</div>
</body>
</html>
<%
st.close();
rs.close();
con.close();
%>