package com.goodibooks.vo;

import lombok.Data;

@Data
public class OrderDetailVO {

	private int detail_no; //주문상세번호
	private int detail_cnt;//수량
	private int detail_price;//책가격
	private int no2; //주문번호
	private int book_no;//책번호
	private String id;//회원id
	
}
