<%@ page contentType="text/html; charset=euc-kr"
    import="java.sql.*"
%>

<%
Connection con = null;
PreparedStatement stmt = null;

try{
	String jdbcURL="jdbc:mysql://localhost:3306/test";
	String dbID="root";
	String dbPW=""; //비밀번호 입력

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(jdbcURL,dbID,dbPW);
    stmt = con.prepareStatement("create table ok(success varchar(10))");
	stmt.executeUpdate();
	stmt.close();
	con.close();
}catch(Exception e){
    out.println(e);
}
%>

<html>
<body>
check your DB! - http://blog.naver.com/sbd38
</body>
</html>
