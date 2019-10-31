package com.cos.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int id; //PK
	private int userId; //FK
	private String title;
	private String content;
	private int readCount;
	private Timestamp createDate;
	private String previewImg; //DB와 상관 없음.
	private User user = new User(); //DB와 상관 없음. (1) board에 user객체 추가
}
