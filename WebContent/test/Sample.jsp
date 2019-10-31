<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/blog/test/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

//주소 입력 버튼을 클릭하면 콜백된다.
function jusoCallBack(roadFullAddr){
		var juso = document.querySelector('#roadFullAddr');
		juso.value = roadFullAddr;
}

</script>
<title>주소 입력 샘플</title>
</head>
<body>
<form name="form" id="form" method="post">

	<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
	<div id="list"></div>
	<div id="callBackDiv">
		<table>
			<tr><td>도로명주소 전체(포멧)</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" /></td></tr>
		</table>
	</div>

</form>
</body>
</html>