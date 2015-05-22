<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnector.jsp" %>

<!doctype html>

<html lang="en">

<head>

  <meta charset="utf-8">
  <title>plan your trip optimal route</title>
  
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 
 
 
 
 
<!-- google map polygon -->
<script src="http://maps.googleapis.com/maps/api/js"> </script>
<script>
var myTrip= new Array();
</script>


<%
String sql = "select * from path where plan_code=?";
Statement stmt = conn.prepareStatement(sql);
 ResultSet rs = stmt.executeQuery(sql);
  while(rs.next()){
  String path_node =rs.getString("path_node");
  String mapx = rs.getString("mapx");
  String mapy = rs.getString("mapy");
  
%>

<script>
var x=new google.maps.LatLng(37.503050, 126.980347);
var node<%=path_node%>=new google.maps.LatLng(<%=mapy%>,<%=mapx%>); 
myTrip[<%=path_node%>-1]= node<%=path_node%>;

//myTrip[0]=node1;
//myTrip[1]=node2;
//myTrip[2]=node3;




</script>
<%
  }
//String sqlcount = "select count(*)as COUNT from path";
//Statement stmt2 = conn.prepareStatement(sqlcount);
//ResultSet rs2 = stmt.executeQuery(sqlcount);
//rs2.next();
//String COUNT =rs2.getString("COUNT");
//  rs2.next();
%>
<script>


function initialize()
{
	
var mapProp = {
  center:x,
  zoom:12,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);



var lineSymbol = {
        path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
        }; //출발노드에서 도착노드 화살표 표시
var flightPath=new google.maps.Polyline({
  path:myTrip,
  //strokeColor:"#ff4a4a",
  strokeOpacity:1.0, //투명도
  strokeWeight:2.5,
  icons: [{
      icon: lineSymbol,
      offset: '100%',
      repeat: '120px'
    }],
    geodesic: true,
  
  });
flightPath.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

<%
                        rs.close();
                        stmt.close();
                        conn.close();
                        %>  
</head>

<body>

 <div id="wrapper" >
 

        <!-- Navigation -->
        
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="firstpage.jsp">Backpackers</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
              
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i>Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i>Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i>Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i>Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
           
           
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                
                
                    <li class="active">
                        <a href="planyourtrip.jsp"><i class="fa fa-fw fa-dashboard"></i>Plan your trip</a>
                    </li>
                    <li>
                        <a href="attraction.jsp"><i class="fa fa-fw fa-bar-chart-o"></i>Attraction</a>
                    </li>
                    <li>
                        <a href="accommodation.jsp"><i class="fa fa-fw fa-table"></i>Accommodation</a>
                    </li>
                    <li>
                        <a href="shopping.jsp"><i class="fa fa-fw fa-edit"></i>Shopping</a>
                    </li>
                    <li>
                        <a href="food.jsp"><i class="fa fa-fw fa-desktop"></i>Food</a>
                    </li>
                    <li>
                        <a href="diary.jsp"><i class="fa fa-fw fa-wrench"></i>Diary</a>
                    </li>
              </ul>
            </div>
            </nav>
            

        <div id="page-wrapper">
        <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Backpackers <small>Plan your trip</small>
                        </h1>
                        </div>
                <div id="googleMap" style="width:1000px;height:800px;"></div>       
                <!-- 지도로딩 -->
  
  
                </div>
        </div>
	  </div>


    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>