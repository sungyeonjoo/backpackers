<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*"%>
<<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
</body>

<%  request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";
	String plan_code = request.getParameter("plan_code");
	String plan_title = request.getParameter("plan_title");
	String plan_st = request.getParameter("plan_st");
	String plan_end = request.getParameter("plan_end");
	String plan_period = request.getParameter("plan_period");
	String member_id = request.getParameter("member_id");
	
	
	
	try{
		Connection conn = DriverManager.getConnection(url, "user2015", "!user2015");
		Statement stmt = conn.createStatement();
			
		String sql = "insert into plan(plan_code,plan_title, plan_st, plan_end, plan_period, member_id) VALUES(?,?,?,?,?,?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		

		pstmt.setString(1,plan_code);
		pstmt.setString(2,plan_title);
		pstmt.setString(3,plan_st);
		pstmt.setString(4,plan_end);
		pstmt.setString(5,plan_period);
		pstmt.setString(6,member_id);
		session.setAttribute("plan_code", plan_code);
		%>
		<script>
		self.window.alert("new plan enroll.");	
		location.href="http://localhost:7685/backpackers/planyourtrip.jsp";
		</script>
		<%
		pstmt.execute();
		pstmt.close();
		conn.close();
	}
	catch(SQLException e){
		out.println(e.toString() ); 
		}
	%>		
</html>