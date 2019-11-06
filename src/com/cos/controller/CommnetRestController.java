package com.cos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.action.comment.CommentFactory;

//http://localhost:8000/blog/comment?cmd=값
@WebServlet("/api/comment")
public class CommnetRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommnetRestController() { super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getParameter("cmd");
		
		System.out.println("2. cmd : "+cmd);
		if(cmd == null || cmd.equals("")) {
			return;
		}
		
		Action action = CommentFactory.getAction(cmd);
		if(action != null) {
			action.execute(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
