<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signup ok</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="regBean" class="bean.RegisterBean" />
<jsp:useBean id="memberMgr" class="dao.MemberMgr" />
<jsp:setProperty property="*" name="regBean" />

<%
	boolean flag = memberMgr.memberInsert(regBean);
%>
</head>
<body>
	<%
		if (flag) {
	%>

	<script type="text/javascript">
		alert("welcome bacpacker. Please login.");
		location.href = 'login.jsp';
	</script>
	<%
		} else {
			out.println("<strong>error. rekey</strong> <a href='signup.jsp'>resignup</a>");
		}
	%>
</body>
</html>