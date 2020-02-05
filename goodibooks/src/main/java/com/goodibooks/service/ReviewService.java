package com.goodibooks.service;

import java.util.HashMap;
import java.util.List;

import com.goodibooks.vo.ReviewVO;

public interface ReviewService {

	void registerReview(ReviewVO review);

	List<ReviewVO> findReviewWithBookNo(int book_no);

	// 태스트
	// 리뷰 리스트 읽어오는거
//	List<ReviewVO> findReviewTest();
	
	// 리뷰 업데이트
	void editReivew(ReviewVO review);

	void deleteReive(int re_no);

	int findReivewCount(int book_no);

	List<ReviewVO> findReivewWithPaging(HashMap<String, Object> params);

	void reviewCount(int book_no);

	List<ReviewVO> showReviewList(String id);


}
