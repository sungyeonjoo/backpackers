<%@ page language="java" contentType="text/html; charset=utf-8" 
	import="bean.*, java.util.*" %>
	<jsp:useBean id="memMgr" class="dao.MemberMgr" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>login</title>

	<link rel="stylesheet" type="text/css" href="css/register.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/register.min.js"></script>

    <style>
    
   #container1 {
       background-size: 200px;
   } 
   .centered-form {
       margin-top: 200px;
       margin-bottom: 200px;
   }
   .centered-form .panel {
       background: rgba(255, 255, 255, 0.8);
       box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
   }
</style>
</head>

<body>
<% 

	String sessionId = (String)session.getAttribute("idKey");

	if(sessionId != null){
		RegisterBean regBean = memMgr.memberMyRead(sessionId);
		String member_id = regBean.getMember_id();
		String member_pw = regBean.getMember_pw();
		String member_name = regBean.getMember_name();
		response.sendRedirect("firstpage.jsp");	
		
%>
	
<%
}else{
%>


<form action="loginok.jsp" name="frm" method="post">
<div class="container">
<div class="row centered-form">
<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
<div class="panel panel-default" >
<div class="panel-heading">
<h3 class="panel-title text-center"> Please Login </h3>
</div>
<div class="panel-body">
<table>
<tr>
<td width="359" height="53">
<input class="form-control input-sm" name="member_id" placeholder="Your Email" type="email" /> 
</td>
</tr>
 <tr>
 <td height="50"><input class="form-control input-sm" name="member_pw" placeholder="Your Password" type="password" />
</td>
</tr>
<tr>
<td width="359" rowspan="2">
<input class="btn btn-info btn-block" type="button" value="Login" onclick="loginCheck();"/>
</td>
</tr>
</table>
<a href="signup.jsp">signup</a>
</div>
</div>
</div>
</div>
</div>
</form> 

<script type="text/javascript">
function loginCheck(){
	var frm = document.frm;
	if(frm.member_id.value==""){
		alert("Enter Your email");
		frm.member_id.focus();
		return;
	}
	if(frm.member_pw.value==""){
		alert("Enter Your password");
		frm.member_pw.focus();
		return;
	}
	frm.submit();
}
</script>
<%
	}
%>



</body>
</html>