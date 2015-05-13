<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="alg.astar"%>
<%@ page import="java.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>API</title>
</head>
<script>
	function trial()
		{
		   var cc = getValue();
		   var dd = 11;
		   window.location.replace("trial.jsp?s="+cc, dd);
		   }
	</script>
	
	<body>
	<script>
	
	function getValue()
   {
      if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
         xmlhttp = new XMLHttpRequest();
      } else {// code for IE6, IE5
         xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      }

      xmlhttp.open("GET","http://api.openapi.io/traffic/appletree/v1/0/Path/PathSearch_Exit.asp?SY="+ 37.505157232495456 +"&SX="+ 127.05709893474192 +"&EY="+ 37.551111761905204 +"&EX=" + 126.98784838350313 + "&changeCount=5&optCount=1&resultCount=10&OPT=0&encoding=utf-8&output=xml&radius=700:2000&weightTime=10:5:5:10:10:5&svcid=f78480bc1c06734607e4c7107d0642f3&x_api_key=MjQ1NS0xNDI4NjczNjg3ODI4LWQzYTE2ZDNlLWE0M2QtNDg0MS1hMTZkLTNlYTQzZDI4NDE4MA==",false);
      xmlhttp.send();
      xmlDoc = xmlhttp.responseXML;
      
      var x = xmlDoc.getElementsByTagName("info");
      
   //  document.write("<table><tr><th>totalTime</th></tr>");
    // document.write("<tr><td>");
     document.write(x[0].getElementsByTagName('totalTime')[0].childNodes[0].nodeValue);
   //  document.write("</td></tr>");
   //  document.write("</table>");
     
	 var aa = 100;
     var bb = x[0].getElementsByTagName('totalTime')[0].childNodes[0].nodeValue;
     
     alert(bb);
     return bb;
     
   }
   </script>

   <%
   String aa = request.getParameter("s");
   if(aa!=null){
      out.println("The value is "+aa);

     
   %>
   
<!--<jsp:useBean id="trial" class="alg.astar">
      <jsp:setProperty name="trial" property="time"
         value='<%=Integer.parseInt(aa)%>' />  -->
         This line has entered Java code
         <%
         astar trial1 = new astar(Integer.parseInt(aa));
         trial1.getTime();
         %>
<!--<jsp:getProperty name="trial" property="time"           /> -->
   <!--</jsp:useBean>-->
   <%} %>
   <input type="button" value="get" onclick='trial()'/>
Testing
</body>
</html>