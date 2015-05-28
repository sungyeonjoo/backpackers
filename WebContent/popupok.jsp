<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

<%  request.setCharacterEncoding("UTF-8");
	Class.forName("org.gjt.mm.mysql.Driver");
	String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";
	String clip_code = request.getParameter("clip_code");
	String clip_stay = request.getParameter("clip_stay");
	String contentId = request.getParameter("contentId");
	String contenttypeid = request.getParameter("contenttypeid");
	String plan_code = request.getParameter("plan_code");
	String mapx = request.getParameter("mapx");
	String mapy = request.getParameter("mapy");
	String clip_seq = request.getParameter("clip_seq");
	
	try{
		Connection conn = DriverManager.getConnection(url, "user2015", "!user2015");
		Statement stmt = conn.createStatement();
			
		String sql = "insert into clipboard(clip_code, clip_stay, contentId, contenttypeid, plan_code, mapx, mapy, clip_seq) VALUES(?,?,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,clip_code);
		pstmt.setString(2,clip_stay);
		pstmt.setString(3,contentId);
		pstmt.setString(4,contenttypeid);
		pstmt.setString(5,plan_code);
		pstmt.setString(6,mapx);
		pstmt.setString(7,mapy);
		pstmt.setString(8,clip_seq);
		
		
		session.setAttribute("contentId", contentId);
		%>
		<script>
		self.window.alert("clip save");	
		location.href="javascript:history.go(-2)";
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

</body>		
		
		
</html>