package com.cos.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.model.Board;
import com.cos.util.Script;

public class BoardUpdateAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board board = new Board();
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		
		BoardDao dao = new BoardDao();
		int result = dao.update(board);
		
		if(result == 1) {
			response.sendRedirect("/blog/board?cmd=detail&id="+id);
		}else {
			Script.back(response);
		}
	}
}
