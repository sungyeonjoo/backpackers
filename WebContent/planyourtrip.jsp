<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("UTF-8");

   String contentid = request.getParameter("contentid");


%>
<!doctype html>

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

<script type="text/javascript">

  $(function() {
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

    $( "#sortable1, #sortable3" ).disableSelection();

  });

  </script>


  
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
            
            
            
            <div>
        <div id="page-wrapper">
        <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Backpackers <small>Plan your trip</small>
                        </h1>
                        </div>
                </div>
        </div>

<ul id="sortable1" class="droptrue">

  <li class="ui-state-default">Can be dropped..</li>

  <li class="ui-state-default">..on an empty list </li>

  <li class="ui-state-default">Item 3</li>

  <li class="ui-state-default">Item 4</li>

  <li class="ui-state-default">Item 5</li>

</ul>

 
<!-- 
<ul id="sortable2" class="dropfalse">

  <li class="ui-state-highlight">Cannot be dropped..</li>

  <li class="ui-state-highlight">..on an empty list</li>

  <li class="ui-state-highlight">Item 3</li>

  <li class="ui-state-highlight">Item 4</li>

  <li class="ui-state-highlight">Item 5</li>

</ul>

  -->



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

  </div>

<br style="clear:both">


 </div>
 
  <!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4qif63dufSD-QIy4Z6dwOIBTV5hvO8nA&signed_in=true"></script>   
    
      <div id="panel" >
      <input id="address" type="textbox" value=" ">
      <input type="button" value="Search" onclick="codeAddress()">
      </div>
      
      <div id="map-canvas" style="border:1px width:2000px; height:700px;"></div>
       <!-- google map -->
 <script>
            var geocoder;
            var map;
            function initialize() {
              geocoder = new google.maps.Geocoder();
              var latlng = new google.maps.LatLng(37.5608, 126.9861);
              var mapOptions = {
                zoom: 15,
                center: latlng
              }
              map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            }
            
            function codeAddress() {
              var address = document.getElementById('address').value;
              geocoder.geocode( { 'address': address}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                  map.setCenter(results[0].geometry.location);
                  var marker = new google.maps.Marker({
                      map: map,
                      position: results[0].geometry.location
                  });
                } else {
                  alert('Geocode was not successful for the following reason: ' + status);
                }
              });
            }
            
            
            google.maps.event.addDomListener(window, 'load', initialize);
                 
                 
                 
   </script>    
  

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>