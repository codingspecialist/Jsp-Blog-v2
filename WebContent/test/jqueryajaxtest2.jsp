<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		$.ajax({
			type: "POST",
			url: "/blog/test3",
			dataType: "text", //서버에서 기대하는 데이터
			contentType: "text/plain; charset=utf-8", //MIME 타입
			data: "i love you",
			success: function(r){
				console.log(r);
			},
			error: function(){
				alert("실패");
			}
		});
	});
	
	function send(){
		var formData = $("#user").serialize();
		console.log(formData);
		
		$.ajax({
			type: "POST",
			url: "/blog/test4",
			data: formData,
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success: function(r){
				alert(r);
			},
			error: function(xhr){
				console.log("xhr : "+xhr);
				console.log("xhr.status : "+xhr.status);
			}
		});
	}

</script>
</head>
<body>

<form id="user" >
	<input type="text" name="username" value="cos" /> <br />
	<input type="text" name="password" value="1234" /> <br />
	<input type="button" value="전송" onClick="send()" />
</form>

<div id="demo">

</div>

</body>
</html>