package com.cos.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.UserDao;
import com.cos.model.User;
import com.cos.util.Script;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserProfileAction implements Action {
	
	private final static String TAG = "UserProfileAction : "; 
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getServletContext().getRealPath("media");
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request,		
					path,	
					1024*1024*2,	// 2MB
					"UTF-8",
					new DefaultFileRenamePolicy() //동일한 파일명이 들어오면 파일명 뒤에 숫자를 붙임.
				); 
			
		 	String filename = multi.getFilesystemName("userProfile"); //정책에 의해서 변경된 이름
		 	String contextPath = request.getServletContext().getContextPath();
		 	
		 	int id = Integer.parseInt(multi.getParameter("id"));
		 	String userProfile = contextPath+"/media/"+filename; //이 친구만 DB에 저장
		 	
		 	UserDao dao = new UserDao();
		 	int result = dao.update(userProfile, id); //오버로딩 하기
		 	
		 	if(result == 1) {
		 		
		 		// 세션에 userProfile 추가해주기
		 		HttpSession session = request.getSession();
		 		User user = (User) session.getAttribute("user");
		 		user.setUserProfile(userProfile);
				session.setAttribute("user", user); //추가
				
		 		response.sendRedirect("/blog/index.jsp");
		 	}else {
		 		Script.back(response);
		 	}
		 	
		} catch (Exception e) {
			e.printStackTrace();
		}
	 	
	}
}
