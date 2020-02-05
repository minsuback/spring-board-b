package com.goodibooks.ui;

import lombok.Data;

@Data
public class ThePager2 {
	
	private int pageSize;//한 페이지당 데이터 개수
	private int pagerSize;//번호로 보여주는 페이지 Link 개수
	private int dataCount;//총 데이터 수
	
	private int pageNo;//현재 페이지 번호
	private int pageCount;//총 페이지 수
	
	private String linkUrl;//페이저가 포함되는 페이지의 주소
	
	private String queryString;
	
	public ThePager2(int dataCount, int pageNo, 
		int pageSize, int pagerSize, String linkUrl, String queryString) {
		
		this.linkUrl = linkUrl;
		
		this.queryString = "";
		if (queryString != null && queryString.length() > 0) {
			String[] queryList = queryString.split("&");
			for (String query : queryList) {
				if (!query.contains("page_no=")) {
					if (this.queryString.length() > 0) {
						this.queryString += "&" + query;
					} else { 
						this.queryString += query;
					}
				}
			}
		}
		
		this.dataCount = dataCount;
		this.pageSize = pageSize;
		this.pagerSize = pagerSize;
		this.pageNo = pageNo;		
		pageCount = 
			(dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0); 
	}
	
	public String toString(){
		StringBuffer linkString = new StringBuffer(2048);
		
		if (pageNo > 1) linkString.append(String.format("<li><a href='%s?page_no=%d&%s'>&lt</a></li>", linkUrl, pageNo - 1, queryString));
		
		int pagerBlock = (pageNo - 1) / pagerSize;
		int start = (pagerBlock * pagerSize) + 1;
		int end = start + pagerSize;
		for (int i = start; i < end; i++) {
			if (i > pageCount) break;
			linkString.append("&nbsp;");
			if(i == pageNo) {
				linkString.append(String.format("<li class='active'> %d </li>", i));
			} else { 
				linkString.append(String.format("<li><a href='%s?page_no=%d&%s'>%d</a></li>", linkUrl, i, queryString, i));
			}
			linkString.append("&nbsp;");
		}
		
		if (pageNo < pageCount) linkString.append(String.format("<li><a href='%s?page_no=%d&%s'>&gt</a></li>", linkUrl, pageNo + 1, queryString));
		
		return linkString.toString();
	}

}













