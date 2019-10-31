package com.cos.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.model.Board;
import com.cos.util.Utils;

public class BoardListAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("page") == null) return;
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		//page <= 0 혹은 page > maxNum 버튼 비활성화
		
		
		
		if(page <= 0) {
			page = 1;
		}
		
		BoardDao bDao = new BoardDao();
		List<Board> boards = bDao.findAll(page); //paging 하기
		List<Board> hotBoards = bDao.findOrderByReadCountDesc();
		
		Utils.setPreviewImg(boards); //이미지를 previewImg에 저장
		Utils.setPreviewContent(boards); //이미지 태그 제거
		Utils.setPreviewImg(hotBoards); //이미지를 previewImg에 저장(추가)
		
		request.setAttribute("boards", boards);
		request.setAttribute("hotBoards", hotBoards);
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("board/list.jsp");
		dis.forward(request, response);
	
	}
}





