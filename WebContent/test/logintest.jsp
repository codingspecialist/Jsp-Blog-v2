<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>인증이 완료되었습니다. 로그인 해 주세요.</h1>
<form action="/blog/test/gmail?cmd=login" method="POST">
	<input type="text" name="username" placeholder="username" /><br />
	<input type="password" name="password" placeholder="password" /><br />
	<input type="submit" />
</form>
</body>
</html>