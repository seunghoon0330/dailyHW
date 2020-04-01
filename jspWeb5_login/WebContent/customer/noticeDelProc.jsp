<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("utf-8"); %>
<%
String seq=request.getParameter("c");

//db 연결
String sql="DELETE from notices WHERE seq=?";

//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, seq);
int af=pstmt.executeUpdate();//return int
		if(af>0){
			//삭제가 성공 했으면
			response.sendRedirect("notice.jsp");
			
		}else{
			//삭제가 실패 했으면
			out.write("삭제오류");
		}
%>
<%
pstmt.close();
con.close();
%>