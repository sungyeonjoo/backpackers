
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("UTF-8");

   String contentid = request.getParameter("contentid");


%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom CSS -->
    <link href="css/3-col-portfolio.css" rel="stylesheet">
    
   
    <title>Back packers</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="planyourtrip.jsp"><i class="fa fa-fw fa-dashboard"></i>Plan your trip</a>
                    </li>
                    <li >
                        <a href="attraction.jsp"><i class="fa fa-fw fa-bar-chart-o"></i>Attraction</a>
                    </li>
                    <li>
                        <a href="accommodation.jsp"><i class="fa fa-fw fa-table"></i>Accommodation</a>
                    </li>
                    <li >
                        <a href="shopping.jsp"><i class="fa fa-fw fa-edit"></i>Shopping</a>
                    </li>
                    <li class="active">
                        <a href="food.jsp"><i class="fa fa-fw fa-desktop"></i>Food</a>
                    </li>
                    <li>
                        <a href="diary.jsp"><i class="fa fa-fw fa-wrench"></i>Diary</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Food
                    <small>Detail Information</small>
                </h1>
                        <!-- 
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Forms
                            </li>
                        </ol>
                         -->
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
        xmlhttp.open("GET","http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailCommon?ServiceKey=1EUls2nDhEdmwi9bF8O56vjnt9XW0B%2Fdq3ctZF2KW7oMHnC9UH6qVnWRLPCWddmBRyzFH0kDUsuKqDMqlG%2FsHA%3D%3D&contentTypeId=82&contentId=<%=contentid%>&defaultYN=Y&firstImageYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide",false);
        
      xmlhttp.send();
      xmlDoc=xmlhttp.responseXML; 
      
        
         
      //document.write("<table><tr><td>");
      var x=xmlDoc.getElementsByTagName("item");
      
      for (i=0;i<x.length;i++)
      { 
         //document.write("arg2=[" + x[i].getElementsByTagName('contentid')[0].childNodes[0].nodeValue + "]<br>");
         if (x[i].getElementsByTagName("contentid")[0].childNodes[0].nodeValue=="<%=contentid%>"){
            
            //document.getElementById("title").innerHTML=xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
            //document.getElementById("addr1").innerHTML=xmlDoc.getElementsByTagName("addr1")[0].childNodes[0].nodeValue;
            //document.getElementById("tel").innerHTML=xmlDoc.getElementsByTagName("tel")[0].childNodes[0].nodeValue;
            //document.getElementById("homepage").innerHTML=xmlDoc.getElementsByTagName("homepage")[0].childNodes[0].nodeValue;
            //document.getElementById("parking").innerHTML=xmlDoc.getElementsByTagName("parking")[0].childNodes[0].nodeValue;
            //document.getElementById("restdate").innerHTML=xmlDoc.getElementsByTagName("restdate")[0].childNodes[0].nodeValue;
            //document.getElementById("usetime").innerHTML=xmlDoc.getElementsByTagName("usetime")[0].childNodes[0].nodeValue;
            //document.getElementById("infoname").innerHTML=xmlDoc.getElementsByTagName("infoname")[0].childNodes[0].nodeValue;
            //document.getElementById("infotext").innerHTML=xmlDoc.getElementsByTagName("infotext")[0].childNodes[0].nodeValue;      
            //document.getElementById("overview").innerHTML=xmlDoc.getElementsByTagName("overview")[0].childNodes[0].nodeValue;
         
            //   var detail_length = new Array();
            //detail_length[0] = "title";
            //detail_length[1] = "contentid";
            //detail_length[2] = "homepage";
            //detail_length[3] = "tel";
            
            //for(j=0;j<4;j++){   
               
               //<!-- Portfolio Item Row -->
        document.write("<div class='row'>");
        document.write("<div class='col-md-8'>"); //bootstrap.min.css 56.66666667%
        document.write("<img class='img-responsive'>");
        
        var detail_length = x[i].getElementsByTagName("firstimage") ;
      if (detail_length.length==0 ){
         document.write("<img src='./img/no_images.jpg' border=0 width=270/>");
      } else {
         
         document.write("<img src='");
          document.write(x[i].getElementsByTagName("firstimage")[0].childNodes[0].nodeValue);
          document.write("' width=100% height=350 /> ");
      
      }
      
      //document.write("</img>");
      
      document.write("</div>");//col-md-8
      
       document.write("<div class='col-md-4'>");
       document.write("<h3><div>");
       var detail_length = x[i].getElementsByTagName("title") ;
         if (detail_length.length==0 ){
            document.write("no title <br>");
         } else {
            document.write(x[i].getElementsByTagName("title")[0].childNodes[0].nodeValue + "<br>") ;
         }
         document.write("</div></h3>");

             var detail_length = x[i].getElementsByTagName("addr1") ;
         if (detail_length.length==0 ){
            document.write("<li> address : no address <br>");
         } else {
            document.write("<li> address :" + x[i].getElementsByTagName("addr1")[0].childNodes[0].nodeValue + "<br>") ;
         }
         
            var detail_length = x[i].getElementsByTagName("homepage") ;
            if (detail_length.length==0 ){
               document.write("<li> homepage : no homepage <br>");
            } else {
               document.write("<li> homepage : " + x[i].getElementsByTagName("homepage")[0].childNodes[0].nodeValue + "<br>") ;
            }
            
            //var detail_length = x[i].getElementsByTagName("telname") ;
            //if (detail_length.length==0 ){
            //   document.write("<li> telname : no telname <br>");
            //} else {
            //   document.write("<li> telname : " + x[i].getElementsByTagName("telname")[0].childNodes[0].nodeValue + "<br>") ;
            //}
            
            var detail_length = x[i].getElementsByTagName("tel") ;
            if (detail_length.length==0 ){
               document.write("<li> tel : no tel <br>");
            } else {
               document.write("<li> tel : " + x[i].getElementsByTagName("tel")[0].childNodes[0].nodeValue + "<br>") ;
            }
            
            
            
            //var detail_length = x[i].getElementsByTagName("directions") ;
            //if (detail_length.length==0 ){
            //   document.write("<li> directions : no directions <br>");
            //} else {
            //   document.write("<li> directions  <br>" + x[i].getElementsByTagName("directions")[0].childNodes[0].nodeValue) ;
            //}
            
            }
            
         /////////////////////////// detailintro=>restdate/usetime
            var detail_length = x[i].getElementsByTagName("restdate") ;
            if (detail_length.length==0 ){
               
               xmlhttp.open("GET","http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailIntro?ServiceKey=1EUls2nDhEdmwi9bF8O56vjnt9XW0B%2Fdq3ctZF2KW7oMHnC9UH6qVnWRLPCWddmBRyzFH0kDUsuKqDMqlG%2FsHA%3D%3D&contentId=<%=contentid%>&contentTypeId=82&introYN=Y&MobileOS=ETC&MobileApp=AppTesting",false);
               xmlhttp.send();
               xmlDoc=xmlhttp.responseXML;
               
               var x=xmlDoc.getElementsByTagName("item");
               
               for (i=0;i<x.length;i++)
               { 
                  //document.write("arg2=[" + x[i].getElementsByTagName('contentid')[0].childNodes[0].nodeValue + "]<br>");
                  if (x[i].getElementsByTagName("contentid")[0].childNodes[0].nodeValue=="<%=contentid%>") {
                  
               
               var detail2_length = x[i].getElementsByTagName("opentimefood") ;
               if (detail2_length.length==0 ){
                  document.write("<li> open time :  <br>");
               } else {
                  document.write("<li> open time : " + x[i].getElementsByTagName("opentimefood")[0].childNodes[0].nodeValue + "<br>") ;
               }
               
               var detail2_length = x[i].getElementsByTagName("restdatefood") ;
               if (detail2_length.length==0 ){
                  document.write("<li> rest date :  <br>");
               } else {
                  document.write("<li> rest date : " + x[i].getElementsByTagName("restdatefood")[0].childNodes[0].nodeValue + "<br>") ;
               }
               var detail2_length = x[i].getElementsByTagName("treatmenu") ;
               if (detail2_length.length==0 ){
                  document.write("<li> treat menu :  <br>");
               } else {
                  document.write("<li> treat menu : " + x[i].getElementsByTagName("treatmenu")[0].childNodes[0].nodeValue + "<br>") ;
               }
               var detail2_length = x[i].getElementsByTagName("firstmenu") ;
               if (detail2_length.length==0 ){
                  document.write("<li> first menu :  <br>");
               } else {
                  document.write("<li> first menu : " + x[i].getElementsByTagName("firstmenu")[0].childNodes[0].nodeValue + "<br>") ;
               }
            } 
            
                  else {}         
                  
               }
            }
            
            
            
         
            document.write("</div>"); //col-md-4
            
                document.write("</div>"); //row
                
              
            
            //document.write("contentid : null <br>");
            //document.write("homepage : null");
            //document.write("tel : null");
            //document.write("telname : null");
            
            //document.write("contentid=====>[" + x[i].getElementsByTagName('contentid')[0].childNodes[0].nodeValue + "]<br>") ;
            //document.write("homepage=====>[" + x[i].getElementsByTagName('homepage')[0].childNodes[0].nodeValue + "]<br>") ;
            //document.write("tel=====>[" + x[i].getElementsByTagName('tel')[0].childNodes[0].nodeValue + "]<br>") ;
            //document.write("telname=====>[" + x[i].getElementsByTagName('telname')[0].childNodes[0].nodeValue + "]<br>") ;
            
            //document.write("title=====>[" + x[i].getElementsByTagName('title')[0].childNodes[0].nodeValue + "]<br>") ;
            //document.write("contentid=====>[" + x[i].getElementsByTagName('contentid')[0].childNodes[0].nodeValue + "]<br>") ;
            //document.write("homepage=====>[" + x[i].getElementsByTagName('homepage')[0].childNodes[0].nodeValue + "]<br>") ;
            //document.write("tel=====>[" + x[i].getElementsByTagName('tel')[0].childNodes[0].nodeValue + "]<br>") ;
            //document.write("telname=====>[" + x[i].getElementsByTagName('telname')[0].childNodes[0].nodeValue + "]<br>") ;
      
         }
      
      </script>
      
      
         <script>
            /////////////////////////// detailInfo=>>infoname/infotext
            
      if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        }
      else
        {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
       
            xmlhttp.open("GET","http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailInfo?ServiceKey=1EUls2nDhEdmwi9bF8O56vjnt9XW0B%2Fdq3ctZF2KW7oMHnC9UH6qVnWRLPCWddmBRyzFH0kDUsuKqDMqlG%2FsHA%3D%3D&contentId=<%=contentid%>&contentTypeId=82&MobileOS=ETC&MobileApp=AppTesting",false);
            xmlhttp.send();
            xmlDoc=xmlhttp.responseXML;
            
            var x=xmlDoc.getElementsByTagName("item");
            for (i=0;i<x.length;i++)
            { 
               if (x[i].getElementsByTagName("contentid")[0].childNodes[0].nodeValue=="<%=contentid%>"){
                  
            document.write("<div class='row'>");
             document.write("<div class='col-lg-12'>");
            
             var detail3_length = x[i].getElementsByTagName("infoname") ;
               if (detail3_length.length==0 ){
                  document.write("<h3>no information name");
               } else {
                  document.write("<h3 class='page-header'>" + x[i].getElementsByTagName("infoname")[0].childNodes[0].nodeValue + "<br>") ;
               }
               document.write("</h3>");

                   var detail_length = x[i].getElementsByTagName("infotext") ;
               if (detail_length.length==0 ){
                  document.write("<div> no information<br>");
               } else {
                  document.write("<div>" + x[i].getElementsByTagName("infotext")[0].childNodes[0].nodeValue + "<br>") ;
               }
               document.write("</div>");
               document.write("</div>"); //col-lg-12
                   document.write("</div>"); //row
               }
            }
                   //document.write("</div>"); //row
                     
         </script>
      
   
       <script>
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        }
      else
        {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
       
        xmlhttp.open("GET","http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailCommon?ServiceKey=1EUls2nDhEdmwi9bF8O56vjnt9XW0B%2Fdq3ctZF2KW7oMHnC9UH6qVnWRLPCWddmBRyzFH0kDUsuKqDMqlG%2FsHA%3D%3D&contentId=<%=contentid%>&contentTypeId=82&defaultYN=Y&firstImageYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide",false);
        
      xmlhttp.send();
      xmlDoc=xmlhttp.responseXML; 
            
      //document.write("<table><tr><td>");
      var x=xmlDoc.getElementsByTagName("item");
      
      for (i=0;i<x.length;i++)
      { 
         //document.write("arg2=[" + x[i].getElementsByTagName('contentid')[0].childNodes[0].nodeValue + "]<br>");
         if (x[i].getElementsByTagName("contentid")[0].childNodes[0].nodeValue=="<%=contentid%>") { 
   
        document.write("<div class='row'>");
                document.write("<div class='col-lg-12'>");
                document.write("<h3 class='page-header'>Overview</h3>");

                var detail_length = x[i].getElementsByTagName("overview") ;
            if (detail_length.length==0 ){
               document.write("<div> no overview ");
            } else {
               document.write("<div>" + x[i].getElementsByTagName("overview")[0].childNodes[0].nodeValue) ;
            }
            document.write("</div>");
            document.write("</div>"); //col-lg-12
                document.write("</div>"); //row
      }
      }
      </script>
      
                <!-- row -->
   <!-- 
                <div class="row">
                    <div class="col-lg-6">

                        <form role="form">

                            <div class="form-group">
                                <label>Text Input</label>
                                <input class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>

                            <div class="form-group">
                                <label>Text Input with Placeholder</label>
                                <input class="form-control" placeholder="Enter text">
                            </div>

                            <div class="form-group">
                                <label>Static Control</label>
                                <p class="form-control-static">email@example.com</p>
                            </div>

                            <div class="form-group">
                                <label>File input</label>
                                <input type="file">
                            </div>

                            <div class="form-group">
                                <label>Text area</label>
                                <textarea class="form-control" rows="3"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Checkboxes</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Checkbox 1
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Checkbox 2
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Checkbox 3
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Inline Checkboxes</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">1
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">2
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">3
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Radio Buttons</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio 1
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Inline Radio Buttons</label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Selects</label>
                                <select class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Multiple Selects</label>
                                <select multiple class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-default">Submit Button</button>
                            <button type="reset" class="btn btn-default">Reset Button</button>

                        </form>

                    </div>
                    <div class="col-lg-6">
                        <h1>Disabled Form States</h1>

                        <form role="form">

                            <fieldset disabled>

                                <div class="form-group">
                                    <label for="disabledSelect">Disabled input</label>
                                    <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
                                </div>

                                <div class="form-group">
                                    <label for="disabledSelect">Disabled select menu</label>
                                    <select id="disabledSelect" class="form-control">
                                        <option>Disabled select</option>
                                    </select>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox">Disabled Checkbox
                                    </label>
                                </div>

                                <button type="submit" class="btn btn-primary">Disabled Button</button>

                            </fieldset>

                        </form>

                        <h1>Form Validation</h1>

                        <form role="form">

                            <div class="form-group has-success">
                                <label class="control-label" for="inputSuccess">Input with success</label>
                                <input type="text" class="form-control" id="inputSuccess">
                            </div>

                            <div class="form-group has-warning">
                                <label class="control-label" for="inputWarning">Input with warning</label>
                                <input type="text" class="form-control" id="inputWarning">
                            </div>

                            <div class="form-group has-error">
                                <label class="control-label" for="inputError">Input with error</label>
                                <input type="text" class="form-control" id="inputError">
                            </div>

                        </form>

                        <h1>Input Groups</h1>

                        <form role="form">

                            <div class="form-group input-group">
                                <span class="input-group-addon">@</span>
                                <input type="text" class="form-control" placeholder="Username">
                            </div>

                            <div class="form-group input-group">
                                <input type="text" class="form-control">
                                <span class="input-group-addon">.00</span>
                            </div>

                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-eur"></i></span>
                                <input type="text" class="form-control" placeholder="Font Awesome Icon">
                            </div>

                            <div class="form-group input-group">
                                <span class="input-group-addon">$</span>
                                <input type="text" class="form-control">
                                <span class="input-group-addon">.00</span>
                            </div>

                            <div class="form-group input-group">
                                <input type="text" class="form-control">
                                <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-search"></i></button></span>
                            </div>

                        </form>

                        <p>For complete documentation, please visit <a href="http://getbootstrap.com/css/#forms">Bootstrap's Form Documentation</a>.</p>

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<!-- 
      <div class="col-md-4">
        <h3><div id="title"></div> </h3>
        <p><li> address : <span id=addr1></p></span>
        <br><li> tel : <span id=tel></span>
        <br><li> homepage : <span id=homepage></span>
        <br><li> parking : <span id=parking></span></li>
    </div>

 -->
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>