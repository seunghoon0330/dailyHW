<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("utf-8"); %>
	<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	Notice a=new Notice();
	a.setTitle(title);
	a.setContent(content);
	
	NoticeDao rdao=new NoticeDao();
	int rg=rdao.regist(a);
	
	if(rg>0)
		response.sendRedirect("notice.jsp");
	else
		out.write("오류");
	
	
	//실행이 끝나면 목록으로 이동
	response.sendRedirect("notice.jsp");
	%>
