<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 페이지입니다.</h1>
<form action="/blog/test/gmail?cmd=join" method="POST">
	<input type="text" name="username" placeholder="username" value="ssar"/><br />
	<input type="password" name="password" placeholder="password" value="1234"/><br />
	<input type="email" name="email" placeholder="email" value="getinthere@naver.com" /><br />
	<input type="submit" />
</form>
</body>
</html>