
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*,java.io.*,java.sql.*"
		 import="java.text.SimpleDateFormat" 
		 import="java.util.Date" %>

<%
request.setCharacterEncoding("utf-8");
// String APIkey = "AI----------";
 String cenx=  request.getParameter("cenx");
 String ceny= request.getParameter("ceny");
 cenx="37.503050";
 ceny="126.980347";
 int i=0;
 int j=0;
	Connection con = null;

	Statement stmt = null;	

	String driver = "org.gjt.mm.mysql.Driver";

	String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";

	String user = "user2015";

	String pwd = "!user2015";

	ResultSet rs = null;

	ResultSet rs2 = null;

	ResultSet rs3 = null;    

	String sql= null;

	try {

		con = DriverManager.getConnection(url,user,pwd);

		System.out.println("--------db접속--------- ");

		stmt = con.createStatement();

		sql = "select * from `path`";

%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>

    <style type="text/css">
      html { height: 140% }
      body { height: 140%; margin: 0; padding: 0 }
      #map_canvas { height 70% }
      #canvas { height 30% }
    </style>
	<script type="text/javascript"
    src="http://maps.googleapis.com/maps/api/js?&sensor=true">
 	 </script>
    <script type="text/javascript">
   var map;
   function initialize() {
    var myLatlng = new google.maps.LatLng(<%=cenx%>,<%=ceny%>);
    var arrPos = new Array();
    var pID = new Array();
    var info = new Array();
 	<%	i=0;
 
   	rs = stmt.executeQuery(sql);

	while(rs.next()) {

		String path_code=rs.getString("path_code");

		String path_node=rs.getString("path_node");

  	 	String mapy=rs.getString("mapy");
 		String mapx=rs.getString("mapx");
  		%>
		pID[<%=path_code%>] ='<%=path_code%>';
		arrPos[<%=i%>] = new google.maps.LatLng(<%=mapy%>, <%=mapx%>);
  		<% 	
  		i++;
	}

 	%>

 <%	

 System.out.println("out");

}catch (SQLException e) {

	e.printStackTrace();
}
%>  	      
	var mapOptions = {
	zoom: 15,
	center: arrPos[0],
	mapTypeId: google.maps.MapTypeId.ROADMAP
	}
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
	var image = new google.maps.MarkerImage('img/location.png');  
     //마커추가부분
    <% 
    for(j=0 ; j < i ; j++) { %>
    	var marker = new google.maps.Marker({
    	    title: pID[<%=j %>] ,
   	    map: map,
    	    position: arrPos[<%=j %>],
    		icon:image
      });
    	attachSecretMessage(marker);
    	//선그리기
	<%}
 //  sql = "select * from `point`";
    sql = "select distinct path_node from `path`";
    try {
    rs = stmt.executeQuery(sql);
  	while(rs.next()) {
  		String lng1=null;
  		String lat1=null;
  		String path_node = rs.getString("path_node");
  		  		rs2=test34(path_node);
  		while(rs2.next())
  		{

  			if(lng1==null)

	  	  	{

  				lng1=rs2.getString("mapx");

  				lat1=rs2.getString("mapy");

	  	  		continue;

	  	  	}

  			String lng2=rs2.getString("mapy");
   			String lat2=rs2.getString("mapx");
    		%>
		var flightPlanCoordinates = [new google.maps.LatLng(<%=lat1%>, <%=lng1%>), new google.maps.LatLng(<%=lat2%>, <%=lng2%>)];
 
	    	 var flightPath = new google.maps.Polyline({

	    	    path: flightPlanCoordinates,

	    	    //strokeColor: "#FF0000",

	    	    strokeColor: "#000000",

	    	    strokeOpacity: 1.0,

	    	    strokeWeight: 2
	    	  });
	    	 flightPath.setMap(map);
  	    		<%
  	    		lng1=lng2;
  	    		lat1=lat2;
  			}
 			lng1=null;
  			lat1=null;
  		}
  	}catch (SQLException e) {
		e.printStackTrace();
  	}

    %>

    function attachSecretMessage(marker) {

    	   var message = "Point_ID : "+marker.getTitle() +"<br> Location : " +marker.getPosition().toString();

    	   var infowindow = new google.maps.InfoWindow({
    	   content: message
    	  });
    	    google.maps.event.addListener(marker, 'click', function() {
    	    infowindow.open(marker.get('map'), marker);
    	  });
    	}
    }
    </script>
 
  </head>
 <body onload="initialize()">
    <div id="map_canvas" style="width:100%; height:70%"></div>
        <div id="canvas" style="width:100%; height:30% overflow:auto;">
   	<div style="width:100%;height:300px; overflow:auto;">
</div>

 </div>  

<script>

function Connect()

{

	<% //Connect(road1,road2);

	%>	

}

</script>

  </body>

</html>

<%!

public ResultSet test34(String path_node)

{

Connection con = null;

Statement stmt = null;		

String driver = "org.gjt.mm.mysql.Driver";


String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";

String user = "user2015";

String pwd = "!user2015";

ResultSet rs = null;      

String sql;

try {

	con = DriverManager.getConnection(url,user,pwd);

	stmt = con.createStatement();

	sql="select * from `path` where `path_node`='"+path_node+"' ORDER BY path_sequence ASC" ;

	rs = stmt.executeQuery(sql);		
}catch (SQLException e) {
	e.printStackTrace();
}
return rs;
}


%>
