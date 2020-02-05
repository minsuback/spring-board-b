package com.goodibooks.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class EventBoardVO {

	private int no;
	private String id;
	private String title;
	private Date regDate;
	private Date beginDate;
	private Date endDate;
	private String img;
	private String content;
	private boolean deleted;
	private boolean active;
}
