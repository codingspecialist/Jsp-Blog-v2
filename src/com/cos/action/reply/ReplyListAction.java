package com.cos.action.reply;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.ReplyDao;
import com.cos.model.Reply;
import com.cos.util.Script;
import com.google.gson.Gson;

public class ReplyListAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader in = request.getReader();
		int commentId = Integer.parseInt(in.readLine());
		
		System.out.println("commentId : "+commentId);
		
		ReplyDao dao = new ReplyDao();
		List<Reply> replys = dao.findByCommentId(commentId);
		
		if(replys != null) {
			Gson gson = new Gson();
			String replyJson = gson.toJson(replys);
			System.out.println(replyJson);
			//Image 를 전송 = MIME 확인
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(replyJson);
			out.flush();
		}else {
			Script.back(response);
		}
	}
}
