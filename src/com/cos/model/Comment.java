package com.cos.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private int id; //PK
	private int userId; //FK
	private int boardId; //FK
	private String content;
	private Timestamp createDate;
	private User user = new User(); //DB와 상관 없음.
}
