package com.goodibooks.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderInfoVO {

	private int no;
	private Date payDate;
	private String id;
	private int ship_no;
	
	private int detail_no;
	private int detail_cnt;
	private int detail_price;
	private String name;

}
