
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("utf-8"); %>
<%
String sql="SELECT * FROM notices";

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
%>
        
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice.jsp</title>
</head>
<body>
<h3>LIST</h3>
<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("SEQ") %></td>
		<td> <a href="noticeDetail.jsp?c=<%=rs.getString("SEQ") %>"><%=rs.getString("TITLE") %></a></td>
		<td><%=rs.getString("WRITER") %></td>
		<td><%=rs.getTimestamp("REGDATE") %></td>
		<td><%=rs.getInt("HIT") %></td>
	</tr>
	<%
	}
	%>


</table>
<a href="noticeReg.jsp">Writer</a>
</body>
</html>
<%
rs.close();
st.close();
con.close();
%>