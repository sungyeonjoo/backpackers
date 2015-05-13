
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/backpackers";
	String content_id = request.getParameter("content_id");
	String content_name = request.getParameter("content_name");
	String content_mapx = request.getParameter("content_mapx");
	String content_mapy = request.getParameter("content_mapy");
	String content_usetime = request.getParameter("content_usetime");
	
	try{
		Connection conn = DriverManager.getConnection(url, "root", "7790");
		Statement stmt = conn.createStatement();
			
		String sql = "select from content(content_id,content_name,content_mapx,content_mapy,content_usetime) VALUES(?,?,?,?,?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			
		pstmt.setString(1,content_id);
		pstmt.setString(2,content_name);
		pstmt.setString(3,content_mapx);
		pstmt.setString(4,content_mapy);
		pstmt.setString(5,content_usetime);
		
		pstmt.execute();
		
		pstmt.close();
		conn.close();
	}
	
	catch(SQLException e){
		out.println(e.toString() ); 
		}

	%>
<!-- 
		<script>
		self.window.alert("get clipboard");	
		location.href="index.html";
		</script>
	 -->	