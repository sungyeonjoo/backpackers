
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/backpackers";
	String clipboard_id = request.getParameter("clipboard_id");
	String clipboard_totalday = request.getParameter("clipboard_totalday");
	String clipboard_day = request.getParameter("clipboard_day");
	String clipboard_starttime = request.getParameter("clipboard_starttime");
	String clipboard_staytime = request.getParameter("clipboard_staytime");
	String content_id = request.getParameter("content_id");
	String member_id = request.getParameter("member_id");
	String member_name = request.getParameter("member_name");
	String member_password = request.getParameter("member_password");
	
	try{
		Connection conn = DriverManager.getConnection(url, "root", "7790");
		Statement stmt = conn.createStatement();
			
		String sql = "insert into members(member_id,member_name,member_password) VALUES(?,?,?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			
		pstmt.setString(1,member_id);
		pstmt.setString(2,member_name);
		pstmt.setString(3,member_password);
		
		pstmt.execute();
		
		pstmt.close();
		conn.close();
	}
	
	catch(SQLException e){
		out.println(e.toString() ); 
		}

	%>

		<script>
		self.window.alert("sign up ok");	
		location.href="firstpage.jsp";
		</script>
		