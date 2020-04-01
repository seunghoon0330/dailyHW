<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("utf-8"); %>
<%
String id=request.getParameter("id");
String pass=request.getParameter("password");

//db연결
String sql="SELECT * FROM MEMBER WHERE ID=?";
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery(); //select 실행

String ypass="";
int x=-1;
String msg="";
if(rs.next()){
	ypass=rs.getString("pwd");
	if(ypass.equals(pass))
		//입력한 비밀번호와 db에 비밀번호가 일치하는지 확인
	x=1;//비밀번호 일치 
	else//pass불일치
	x=0;
}else{//아예 값이 없을때(아이디가 존재하지 않은상태)
	
	x=-1;
}
System.out.println("xxxx : "+x);
if(x==1){// 비밀번호 일치 로그인성공했을 때
	session.setAttribute("sessionID", id);
	msg="../MainForm.jsp";
}else if(x==0){
	msg="#";
}else{
	msg="loginForm.jsp?msg=-1";
}
response.sendRedirect(msg);

%>