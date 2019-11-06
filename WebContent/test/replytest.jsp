<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	let replyJS = {
			id: null,
			boardId: 5,
			userId: 3,
			content: "글이 참 좋습니다.",
			createDate: null
	}
	
	function send(){
		// replyJS를 -> json으로 변환 JSON.stringify()
		
		// ajax 호출 -> /blog/test/reply -> POST -> application/json, utf-8
	}

</script>
</head>
<body>
<button onClick="send()">전송</button>
</body>
</html>