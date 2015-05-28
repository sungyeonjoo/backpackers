<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>login ok</title>
</head>
<body>
<jsp:useBean id="memberMgr" class="dao.MemberMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String member_id = request.getParameter("member_id");
	String member_pw = request.getParameter("member_pw");
	String member_name = request.getParameter("member_name");
	boolean loginCheck = memberMgr.loginCheck(member_id, member_pw);
%>
<%
	if(loginCheck){
		session.setAttribute("idKey", member_id);
		response.sendRedirect("firstpage.jsp");
%>
	<script type="text/javascript">
		alert("welcome bacpacker.");
	</script>
<%
	}else{
%> 
	<script type="text/javascript">
		alert("The email or password you entered is incorrect.");
		location.href = "login.jsp";
	</script>
<% 
	}
	%>
<p>login ok <%=member_id %></p>
</body>
</html>