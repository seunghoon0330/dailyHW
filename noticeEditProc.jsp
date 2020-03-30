<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<h3>noticeEditProc.jsp</h3>
<%
String title=request.getParameter("title");
String content=request.getParameter("content");
String seq=request.getParameter("c");

String sql="update notices set title=?,content=? where seq=?";

//db connect
//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.setString(3, seq);

//결과
pstmt.executeUpdate();//insert 실행

//실행이 끝나면 목록으로 이동
response.sendRedirect("noticeDetail.jsp?c="+seq);



%>
<%
pstmt.close();
con.close();
%>