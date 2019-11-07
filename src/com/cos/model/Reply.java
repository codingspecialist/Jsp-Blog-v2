package com.cos.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply{	
	private ResponseData responseData = new ResponseData(); //DB와 상관 없음.
	private int id;
	private int commentId;
	private int userId;
	private String content;
	private Timestamp createDate;
	private User user = new User(); //DB와 상관 없음.
}
