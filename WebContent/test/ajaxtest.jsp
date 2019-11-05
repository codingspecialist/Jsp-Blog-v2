<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Ajax 테스트</h1>
	<hr />


	<div id="demo">1</div>
	<button type="button" onclick="loadDoc()">Change Count</button>

	<!-- 
		자바스크립트 오브젝트 => JSON처럼 생긴 문자열로 변경하려면!!
		WHEN : 데이터 전송시
		var replyString = JSON.stringify(오브젝트);
		
		JSON처럼 생긴 문자열 => 자바스크립트 오브젝트
		WHEN : 데이터 다운받았을 때
		var replyObject = JSON.parse(제이슨 문자열); 
	-->

	<script>
		//자바스크립트 오브젝트
		var reply = {
			id: null,
			boardId: 1,
			userId: 3,
			content: 'input태그에 적힌 값을 들고 온다.',
			createDate: null
		}
		
		console.log(reply);
		var replyString = JSON.stringify(reply); //json 문자열로 변경
		console.log(replyString);
		
		function loadDoc() {
			var xhttp = new XMLHttpRequest();
			//콜백함수 --> xhttp.send() 된 뒤 요청받은 서버에서 응답이 정상으로 처리되면 콜백!!
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(this.responseText);
					var jsonData = JSON.parse(this.responseText); //Javascript Object 변경
					console.log(jsonData);
					document.querySelector("#demo").innerHTML = jsonData.name
							+ " " + jsonData.sal;
				}
			};

			xhttp.open("POST", "http://localhost:8000/blog/test", true);
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(replyString);
		}
	</script>
</body>
</html>