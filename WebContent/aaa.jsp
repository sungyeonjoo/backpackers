<%-- 
Document : tt
 Created on : 2008. 7. 29, 오후 1:36:00
 Author : Administrator
 --%> 
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd"> 
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP Page</title>
 <script>
 //기본 변수 지정//
var move_div = ""; //클릭한 드레그의 인덱스
var eventx = 0; //마우스 좌표값 X
 var eventy = 0; //마우스 좌표값 Y
 var drag_flag = "false"; //마우스를 누를때만 드레그가 되어야 하니까 마우스 누르고 있는지 체크하는 변수
var img_name = ""; //이미지명 변수 DB 연동시에는 필요 없을수도 있겠네요. 
 //처음 상품에 마우스를 눌렸을때
function drag_start(v,v2){ 
 move_div = v; //인덱스 저장
drag_flag = "true"; //마우스를 눌렸으니 true 로 바굼
img_name = v2; // 이미지명 저장
//document.all.product.style.left = eventx; //드레그 효과주는 레이어 위치 이동
//document.all.product.style.top = eventy; //드레그 효과주는 레이어 위치 이동 
//status_div.innerHTML = move_div; 
 }
 //마우스를 누른상태에서 움질일때 드레그 되는 부분
function mouse_move(){ 
 eventx = event.x - 10; // X 좌표 구하기
eventy = event.y - 10; // Y 좌표 구하기
if(drag_flag == "true"){ //마우스를 누르고 있을때만 스크립트가 작동되도록 설정
document.all.product.style.left = eventx; //레이어를 마우스 위치에 따라 이동 (X 좌표)
document.all.product.style.top = eventy; //레이어를 마우스 위치에 따라 이동 (Y 좌표)
document.all.product.innerHTML = "<img src=./img/" + img_name + ">"; //드레그 효과주는 레이어에다가 이미지 넣기
//status_div.innerHTML = eventx + "/" + eventy;
 }
 }
 //마우스를 떼었을때 이벤트
function drag_end(){
 move_div = ""; //저장된 인덱스를 비움
drag_flag = "false"; //다시 false 로 바꾸어줌
//status_div.innerHTML = move_div;
 document.all.product.innerHTML = ""; //드레그 효과 레이어에 상품 이미지 들어가 있던거도 삭제
//장바구니 테이블의 위치값구하기
var basket_top = table_basket.offsetTop; //장바구니 테이블의 시작 TOP
 var basket_left = table_basket.offsetLeft; //장바구니 테이블의 시작 LEFT
 var basket_width = document.getElementById('table_basket').offsetWidth; //장바구니 테이블의 WIDTH
 var basket_height = document.getElementById('table_basket').offsetHeight; //장바구니 테이블의 HEIGHT
 var basket_endt = parseInt(basket_top) + parseInt(basket_height); //장바구니 테이블의 끝나는 TOP
 var basket_endl = parseInt(basket_left) + parseInt(basket_width); //장바구니 테이블의 끝나는 LEFT
 if(parseInt(eventy) > parseInt(basket_top) && parseInt(eventy) < parseInt(basket_endt) && parseInt(eventx) > parseInt(basket_left) && parseInt(eventx) < parseInt(basket_endl)){//장바구니 테이블내에다가 상품을 드레그해 놓았을때 basket_go 이벤트 호출
basket_go() 
 }
 }
 //장바구니 테이블 내에다가 상품을 드레그해 놓았을때 실행되는 이벤트
//데이터베이스 연동하고픈 분은 이부분을 AJAX 로 고치면 될꺼에요. ㅋㅋ
//현제는 TR 추가 스크립트로 추가만 되요.
function basket_go(){
 trx = basket_product.insertRow(); //basket_product 테이블에 ROW 추가
tdx = trx.insertCell(); //basket_product 테이블에 CELL 추가
var tmpStr = "<img src='./img/" + img_name + "'>" //이미지 변수 만들기
tdx.insertAdjacentHTML( "BeforeEnd", tmpStr ); //추가된 CELL 에 이미지 박기 
}
 </script>
 </HEAD>
 <!--body 테그안에는 onselectstart="return false" ondragstart="return false" 이걸 넣어주어야지 드레그가 잘되어요.
저 테그는 드레그가 안되게 하는 테그임 그리고 onmousemove="mouse_move()" 이부분이 들어있어야 마우스의 위치를 표현할수 있어요.
-->
 <BODY onselectstart="return false" ondragstart="return false" onmousemove="mouse_move()">
 <table border=0 cellpadding=0 cellspacing=1 bgcolor="efefef" width="100%">
 <tr>
 <td bgcolor="ffffff">
 <table border=1 cellpadding=0 cellspacing=0>
 <tr>
 <%for(int i=1;i<=8;i++){%>
 <td align="center" width="200" height="200">
 <!--이미지 부분 드레그 시작 드레그 끝 스크립트를 넣어주어야 해요 ^^-->
 <div>
 <a href="javascript:alert('<%=i%>')">
 <img src="./img/<%=i%>.jpg" border=0 onmousedown="javascript:drag_start('<%=i - 1%>','<%=i%>.jpg')" onmouseup="javascript:drag_end()" />
 </a>
 </div>
 </td>
 <%if(i%4==0){%>
 </tr>
 <tr>
 <%}%>
 <%}%>
 </tr>
 </table>
 </td>
 <td width="150" height="100%" valign="top">
 <!--아래의 테이블이 장바구니 영역 테이블이에요. 이 테이블안으로 상품을 드레그해 같다 놓으면 장바구니에 담기는 루틴이 돌아가죠-->
 <table height="100%" width="100%" cellpadding="0" cellspacing="0" border="1" id="table_basket" bgcolor="ffffff" style="position:absolute;z-index:0">
 <tr>
 <td align="center" height="10">장바구니</td>
 </tr>
 <tr>
 <td>
 <!--아래의 테이블이 실제로 장바구니에 담기는 상품을 보여주는 테이블이에요
 나중에 DB 연동한다면 이부분에 기존에 장바구니 DB 에 담았던 것들을 불려와서 테이블 안에 tr 로 뿌려주면 되요.
상품 추가되는 루틴은 tr 이 추가되는 걸로 해 놓았으니까요.
-->
 <table id="basket_product">
 </table>
 </td>
 </tr>
 </table>
 </td>
 </tr>
 </table>
 <div id="status_div">위에 이미지를 드레그해서 장바구니로 끌고가 보세요.</div>
 <!--이 레이어가 상품을 클릭해 드레그할때 드레그 효과를 주는 레이어에요.-->
 <div id="product" style="position:absolute;z-index:1" onmouseup="javascript:drag_end()"></div>
 </BODY>
 </HTML> 