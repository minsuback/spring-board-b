package com.goodibooks.vo;

import lombok.Data;

@Data
public class CartListVO {

	private int cart_no;	//장바구니 번호
	private int cart_count;	//책수량
	private String id;		
	private int book_no;	//책번호
	
	private BookInfoVO book; //책번호로 가져온 책정보
}
