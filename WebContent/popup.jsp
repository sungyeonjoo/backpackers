<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, clip.clipboard"%>
 <%@ include file="dbconnector.jsp" %>
<%  request.setCharacterEncoding("UTF-8");

   String contentid = request.getParameter("contentid");
   clipboard c = new clipboard();
   c.addClip(contentid);


%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
    <title>time check</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="css/register.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/register.min.js"></script>
    
    <style>
   #container1 {
      
       background-size: cover;
   }
   
   .centered-form {
       margin-top: 10px;
       margin-bottom: 10px;
   }
   
   .centered-form .panel {
       background: rgba(255, 255, 255, 0.8);
       box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
   }
</style>

<script>

    function useId(){  // 중복체크하여 보여주는 함수(나중에 DB와 연동해야함)
        alert(document.f1.userId.value);
        opener.f1.userId.value = document.f1.userId.value;

        self.close();
    }
    
    function wincl(){        // 팝업창 닫기 함수
        window.close();
    }
    
</script>

</head>
<body>
 
          <script>
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        }
      else
        {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("GET","http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailCommon?ServiceKey=1EUls2nDhEdmwi9bF8O56vjnt9XW0B%2Fdq3ctZF2KW7oMHnC9UH6qVnWRLPCWddmBRyzFH0kDUsuKqDMqlG%2FsHA%3D%3D&contentTypeId=76&contentId=<%=contentid%>&defaultYN=Y&firstImageYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide",false);
        
      xmlhttp.send();
      xmlDoc=xmlhttp.responseXML; 
      </script>
 

<div class="container">
<!--Form - START -->
 <div class="container" id="container1">
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center"> Please write stay time in place </h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="popupok.jsp" method="post">
                            <div class="form-group">
                                <%
							    String sql = "select count(*)+001 as COUNT2 from clipboard";
							    Statement stmt = conn.createStatement();
						        ResultSet rs = stmt.executeQuery(sql);
									rs.next() ;
									String COUNT2 =rs.getString("COUNT2");
								%>
                                <input type="hidden" name="clip_code" class="form-control input-sm" value="clip<%=COUNT2%>"> 
                                <input type="text" name="clip_staytime"  class="form-control input-sm" placeholder="stay time">
                                <input type="hidden" name="contentId" value=<%=contentid%>>
                                
                                <%
                                String plan_code=(String) session.getAttribute("plan_code");  
                                if(plan_code==null) plan_code="";  
							    %>
                                <input type="hidden" name="plan_code" value=<%=plan_code%>>
                            </div>
                            
                             <%
								rs.close();
								stmt.close();
								conn.close();
								%>  
                            <input type="submit" value="ok" class="btn btn-info btn-block" onclick="wincl()">
                             <!-- 
                             <input type="button" value="ok" onclick="wincl()">
                              -->
                              
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Form - END -->
</div>

   

</body>
</html>

<!-- 
    <form name="f1">
    
        staytime <input type="text" name="time"><br>
        <!-- 
        timewindow <input type="text" name="timewindow"><br>
       <input type="radio" value="1" name="day" value="1 day">1 day&nbsp
        <input type="radio" value="2" name="day" value="2 day">2 day&nbsp
       
        <input type="button" value="ok" onclick="wincl()">
    </form>


</body>
</html>
 -->