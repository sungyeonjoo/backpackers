<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="memMgr" class="dao.MemberMgr" />
<%
	String member_id = request.getParameter("member_id");
	boolean check = memMgr.checkId(member_id);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디중복체크</title>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<h1>아이디중복체크</h1>
<%=member_id %>
<%
	if(check){
		out.println("는 이미 존재하는 ID입니다.");
	}else{
		out.println("는 사용가능합니다.");
	}
%>
<a href="javascript:;" onClick="win_close()">닫기</a>
</body>
</html>