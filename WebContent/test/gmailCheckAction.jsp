<%@page import="java.io.PrintWriter"%>
<%@page import="com.cos.util.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// code 값 받기
	String code = request.getParameter("code");

	// return code 값이랑 send code 값을 비교해서 동일하면
	boolean rightCode = 
		SHA256.getEncrypt("getinthere@naver.com", "cos").equals(code) ? true : false;
		
	PrintWriter script = response.getWriter();
	if(rightCode == true){
		//DB에 emailCheck 칼럼 update 해주기 1 : 인증완료, -1 : 미인증
		script.println("<script>");
		script.println("alert('이메일 인증에 성공하였습니다.')");
		script.println("location.href='logintest.jsp'");
		script.println("</script>");
	} else{
		script.println("<script>");
		script.println("alert('이메일 인증을 실패하였습니다.')");
		script.println("location.href='error.jsp'");
		script.println("</script>");
	}

	
	
	// 인증 완료 로그인 페이지 이동
	
	// 미인증 error 페이지 이동
	
%>