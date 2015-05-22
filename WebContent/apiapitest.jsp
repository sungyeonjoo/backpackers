<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>apitabletest</title></head>
<!-- script불러오기-->
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

<body>
<h1>http://api.openapi.io/traffic/appletree/v1/0/Path/PathSearch_Exit.asp?</h1>

<table>

<tr>
<td>999</td><td id="totalTime12"></td><td id="totalTime13"></td>
</tr>

</table>



<script>
xmlhttp.open("GET","http://api.openapi.io/traffic/appletree/v1/0/Path/PathSearch_Exit.asp?SY=37.259172&SX=127.031395&EY=37.551111761905204&EX=126.98784838350313&changeCount=5&optCount=1&resultCount=10&OPT=0&encoding=utf-8&output=xml&radius=700:2000&weightTime=10:5:5:10:10:5&svcid=f78480bc1c06734607e4c7107d0642f3&x_api_key=MjM4NS0xNDI2NjgwMjg0MzI4LTJiMTAxYTgyLWI2ODgtNDYwYy05MDFhLTgyYjY4OGQ2MGNjMw==",false);
//Don't enforce the same-origin policy. (Used by people testing their sites.)
//const wchar_t kDisableWebSecurity[] = L"disable-web-security";
xmlhttp.send();
xmlDoc=xmlhttp.responseXML
document.getElementById("totalTime12").innerHTML=xmlDoc.getElementsByTagName("totalTime")[0].childNodes[0].nodeValue
</script>
<script>
xmlhttp.open("GET","http://api.openapi.io/traffic/appletree/v1/0/Path/PathSearch_Exit.asp?SY=37.259172&SX=127.031395&EY=37.58018596118851&EX=126.9767235747301&changeCount=5&optCount=1&resultCount=10&OPT=0&encoding=utf-8&output=xml&radius=700:2000&weightTime=10:5:5:10:10:5&svcid=f78480bc1c06734607e4c7107d0642f3&x_api_key=MjM4NS0xNDI2NjgwMjg0MzI4LTJiMTAxYTgyLWI2ODgtNDYwYy05MDFhLTgyYjY4OGQ2MGNjMw==",false);
xmlhttp.send();
xmlDoc=xmlhttp.responseXML
document.getElementById("totalTime13").innerHTML=xmlDoc.getElementsByTagName("totalTime")[0].childNodes[0].nodeValue
</script>


</body>
</html>