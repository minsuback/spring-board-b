package com.goodibooks.vo;

import java.util.List;

import lombok.Data;

@Data
public class BookInfoVO {

	private int book_no;
	private String name;
	private int price;
	private String intro;
	private String writer;
	private String pub_name;	
	private String category_name;
	private String contents;
	
	private int pub_no;
	private int category_no;
	
	private int book_count;
	
//	private List<BookImgVO> imgs = new ArrayList<>();
	private List<BookImgVO> imgs;
	
}
