package com.goodibooks.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int re_no;
	private int rate;
	private String title;
	private String content;
	private Date writeDate;
	private boolean deleted;
	private String id;
	private int book_no;
	private String name;
}
