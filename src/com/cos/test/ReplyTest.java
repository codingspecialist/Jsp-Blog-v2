package com.cos.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/reply")
public class ReplyTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ReplyTest() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8"); //MIME 타입
		
		//(1) json 데이터를 받기 , getReader()
		
		//(2) json 데이터 sysout으로 출력해보기
		
		//(3) json 데이터를 java 오브젝트로 변환 (Gson 라이브러리, fromJson())
		
		//(4) java 오브젝트를 sysout으로 출력해보기
		
		PrintWriter out = response.getWriter();
		out.print("ok");
		out.flush();
	}

}
