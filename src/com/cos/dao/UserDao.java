package com.cos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cos.model.User;
import com.cos.util.DBClose;

public class UserDao {
	// 싱글톤으로 만들어야 하는데 그냥 함.

	private Connection conn; // MySQL과 연결하기 위해 필요
	private PreparedStatement pstmt; // 쿼리문을 작성 - 실행 하기 위해 필요
	private ResultSet rs; // 결과를 보관할 커서

	//1
	public User findByUsername(String username) {

		final String SQL = "SELECT * FROM user WHERE username = ?";
		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, username);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address")); // 주소 추가
				user.setCreateDate(rs.getTimestamp("createDate"));

				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return null;
	}

	//2
	public int update(User user) {

		final String SQL = "UPDATE user SET password = ?, address = ? WHERE id = ?";

		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getAddress());
			pstmt.setInt(3, user.getId());
			int result = pstmt.executeUpdate(); // 변경된 튜플의 개수를 리턴
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

		return -1;
	}

	//3
	public int save(User user) {

		final String SQL = "INSERT INTO user(username, password, email, address, createDate) VALUES(?, ?, ?, ?,now())";

		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			int result = pstmt.executeUpdate(); // 변경된 튜플의 개수를 리턴
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

		return -1;
	}

	//4
	public int findByUsernameAndPassword(String username, String password) {
		final String SQL = "SELECT count(id) FROM user WHERE username = ? AND password = ?";
		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int result = rs.getInt(1);
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return -1;
	}
}
