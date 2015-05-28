<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bean.*, java.util.*"%>
<%@ include file="dbconnector.jsp" %>
 <jsp:useBean id="memMgr" class="dao.MemberMgr" />

<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>plan your trip</title>
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
 <style>
  #sortable1 { list-style-type: none; margin: 0; float: left; margin-right: 10px; background: #eee; padding: 5px; width: 30%;}
  #sortable3 { list-style-type: none; margin: 0; float: left; margin-right: 10px; background: #eee; padding: 5px; width: 30%;}
  #sortable1 li, #sortable2 li, #sortable3 li { margin: 5px; padding: 5px; font-size: 1.2em; width: 95%; }
  #sortable3 ul { margin: 0px; padding: 10px; font-size: 1.2em; width: 110%; }
  </style>
<!-- 드래그앤드롭 -->
<script type="text/javascript">
/*   $(function() {
   $( "#sortable3" ).accordion({
         heightStyle: "content"
       });

    $( "ul.droptrue" ).sortable({
      connectWith: "ul"
    });
    $( "ul.dropfalse" ).sortable({
      connectWith: "ul",
      dropOnEmpty: false
    });
    $( "#sortable1, #sortable3" ).ableSelection();
  });
   */
   $(function() {
	    $( "#sortable1, #sortable2" ).sortable({
	      connectWith: ".connectedSortable"
	    }).disableSelection();
	  });

	function save_order(){
	   var idsInOrder = [];
	$("ul#sortable1 li").each(function() { idsInOrder.push($(this).text()) });
	alert(idsInOrder.join('\n'));
	val.action='tripseq.jsp?path_node==idsInOrder';
	
	}
  </script>
  <!-- 
  <script>
  function go_change(i , j)
  {
	  var val = document.details;
	  var str = val.c+j;
	  alert(str);
	  var sta = str.value;
	  val.action = planchange.jsp?clip_code==i&count==j&clip_stay=sta;
	  val.submit;
  }
  </script> -->

</head>

<body>
 <div id="wrapper">
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
                     <%
		            String member_id = (String)session.getAttribute("idKey");
			        if(member_id != null){
		               RegisterBean regBean = memMgr.memberMyRead(member_id);
				 		String member_name = regBean.getMember_name();
		         	%>
         
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=member_name %><b class="caret"></b></a>
                     <%
				         }else{
				     %>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>null<b class="caret"></b></a>
                    
                  <%
		            }
		         %>  
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
      	<div>
 
      	<%
      	String plan_code = (String)session.getAttribute("plan_code");
      	String sql = "select * from clipboard where plan_code = '" + plan_code +"'";
      	Statement stmt = conn.prepareStatement(sql);
      	 ResultSet rs = stmt.executeQuery(sql);
      	%>
        <div id="page-wrapper">
        <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Backpackers <small>Plan your trip</small>
                        </h1>
                        </div>
                       <a><%=plan_code%></a>
                </div>
        </div>
<script>
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
</script>

<ul id="sortable1" class="connectedSortable" style="width: 320px" >

<%
	/* xmlmapxy.main(null, plan_code);
 */
/* xmlmapxy a = new xmlmapxy();
xmlmapxy.setPlan_code(plan_code);

String[] arg;
 
xmlmapxy a = new xmlmapxy();
a.setPlan_code(plan_code);
a.setStay_time(int[] stay_time);
 */
 int count=0;
  while(rs.next()){
	 
  String clip_seq = rs.getString("clip_seq");
  String clip_code =rs.getString("clip_code");
  String contentid = rs.getString("contentid");
  String clip_stay = rs.getString("clip_stay");
  
	
  
 // String mapx = rs.getString("mapx");
 // String mapy = rs.getString("mapy");
  // a.setStaytime(clip_stay);
   
  
%>   <!--          <form name="details"> -->
	<div class="ui-state-default" id="<%=clip_seq%>" style="text-align: center; " >
	
	<li>
		<li id="<%=clip_code%>"></li>
		<input type="text" id="stay<%=count%>" name="stay<%=count%>" value="<%=clip_stay%>" size="2px" style="text-align: center;">
		<input type="button" value="change" onclick="location.href='planchange.jsp?clip_code=<%=clip_code%>&count=<%=count%>&clip_stay=stay<%=count%>'" >
		<input type="button" value="delete" onclick="location.href='plandelete.jsp?clip_code=<%=clip_code%>'" >
	</li>
	</div>
	<script>
  	xmlhttp.open("GET","http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailCommon?ServiceKey=vs3Y%2Fm4qc9WmDzyaJyRtihhpYfhEAMtgaZHZPOt1quhUS27jSkmk%2FSIF7ZnAtfy6NqzC1Gvw7BiWxVbJgnQ%2Bvw%3D%3D&contentId=<%=contentid%>&defaultYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide",false);
	xmlhttp.send();
	xmlDoc=xmlhttp.responseXML;
	document.getElementById("<%=clip_code%>").innerHTML=xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
	</script> 
	<!-- 	</form> -->
<%
count++;
}
%>

</ul>
<input type="submit" value="save_order" onclick="save_order()">
 <input type="submit" value="optimal route" class="optimal route" onclick="javascript:location.href='planyourtripalg.jsp'">
 <input type="submit" value="plan route result" class="optimal route" onclick="javascript:location.href='planyourtrip_result.jsp'">

<!-- 
<ul id="sortable2" class="dropfalse">
  <li class="ui-state-highlight">Cannot be dropped..</li>
  <li class="ui-state-highlight">..on an empty list</li>
  <li class="ui-state-highlight">Item 3</li>
  <li class="ui-state-highlight">Item 4</li>
  <li class="ui-state-highlight">Item 5</li>
</ul>
  -->
  
<!-- <input type="submit" value="optimal route" class="optimal route" onclick="planyourtripalg.jsp"> -->

						<%
                        rs.close();
                        stmt.close();
                        conn.close();
                        %>  
<!-- 
 <div id="sortable3">
    <h2><a href="#">Day1</a></h2>
    <div>
      <ul id="sortable3" class="droptrue" >
</ul>
    </div>
    
    <h2><a href="#">Day2</a></h2>
    <div>
      <ul id="sortable3" class="droptrue">
</ul>
    </div>
    <h2><a href="#">Day3</a></h2>
    <div>
      <ul id="sortable3" class="droptrue">
</ul>
    </div>
  
    <h2><a href="#">Day4</a></h2>
    <div>
      <ul id="sortable3" class="droptrue">
</ul>
    </div>
  </div> -->
<br style="clear:both">

 </div>
 
</div>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>