package com.cos.action.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.ReplyDao;
import com.cos.model.Reply;
import com.cos.util.Script;
import com.google.gson.Gson;

public class ReplyWriteAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		String content = request.getParameter("content");
		
		System.out.println(commentId);
		System.out.println(userId);
		System.out.println(content);
		
		Reply replyForm = new Reply();
		replyForm.setCommentId(commentId);
		replyForm.setUserId(userId);
		replyForm.setContent(content);
		ReplyDao dao = new ReplyDao();
		int result = dao.save(replyForm);
		
		
		if(result == 1) {
			// 정상적으로 save 됐으면 max값 찾기
			Reply reply = dao.findByMaxId();
			reply.getResponseData().setStatusCode(1);
			reply.getResponseData().setStatus("ok");
			reply.getResponseData().setStatusMessage("Write was completed");
			
			// Gson을 이용해서 Json으로 변환
			Gson gson = new Gson();
			String replyJson = gson.toJson(reply);

			System.out.println("(1) replyJson : "+replyJson);
			// 데이터 응답
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(replyJson);
			out.flush();
		}else {
			Script.back(response);
		}
	}
}
