<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeReg.jsp</title>
<h3>noticeReg.jsp</h3>
</head>
<body>
<form action="noticeRegProc.jsp" method="post">
<dl>
	<dt>제목</dt>
	<dt>
		<input type="text" name="title" />
	</dt>
</dl>
<dl>
	<dt>첨부파일</dt>
	<dt>
		<input type="file" name="txtFile" />
	</dt>
</dl>
<div>
	<textarea name="content" id="txtcontent" class="txtcontent">공 백</textarea>
</div>
<input type="submit" value="save" />
<input type="button" value="cancel" class="cancel" />

</form>

</body>
</html>