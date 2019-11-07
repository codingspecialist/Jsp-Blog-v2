package com.cos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cos.model.Reply;
import com.cos.util.DBClose;

public class ReplyDao {
	// 싱글톤으로 만들어야 하는데 그냥 함.

	private Connection conn; // MySQL과 연결하기 위해 필요
	private PreparedStatement pstmt; // 쿼리문을 작성 - 실행 하기 위해 필요
	private ResultSet rs; // 결과를 보관할 커서
	
	public Reply findByMaxId() {
		
		StringBuffer sb = new StringBuffer();

		final String SQL = sb.toString();
		conn = DBConn.getConnection();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Reply reply = new Reply();

				
				return reply;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int save(Reply reply) {

		final String SQL = "INSERT INTO reply(commentId, userId, content, createDate) VALUES(?,?,?,now())";
		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, reply.getCommentId());
			pstmt.setInt(2, reply.getUserId());
			pstmt.setString(3, reply.getContent());
			
			int result = pstmt.executeUpdate(); // 변경된 튜플의 개수를 리턴
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

		return -1;
	}
	
	public int delete(int id) {

		final String SQL = "DELETE FROM reply WHERE id = ?";
		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, id);

			int result = pstmt.executeUpdate(); // 변경된 튜플의 개수를 리턴
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

		return -1;
	}
	
	public List<Reply> findByCommentId(int commentId){
		
		StringBuffer sb = new StringBuffer();
		
		final String SQL = sb.toString();
		
		conn = DBConn.getConnection();
		
		try {
			List<Reply> replys = new ArrayList<>();
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				
				replys.add(reply);
			}
			
			return replys;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return null;
	}
}
