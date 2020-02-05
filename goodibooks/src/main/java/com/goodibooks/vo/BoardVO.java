package com.goodibooks.vo;



import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private int no;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	private boolean deleted;

}
