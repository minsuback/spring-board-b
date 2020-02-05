package com.springboard.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private Date updateDate;
	private boolean deleted;
	private int readCount;
	
	// Board 테이블과 Reply테이블사이의 1:many 관계를 구현하는 필드
	private List<ReplyVO> replies;
	
}
