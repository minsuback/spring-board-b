package com.goodibooks.service;

import java.util.HashMap;
import java.util.List;

import com.goodibooks.mapper.ReviewMapper;
import com.goodibooks.vo.ReviewVO;

import lombok.Setter;

public class ReviewServiceImpl implements ReviewService {

	@Setter
	private ReviewMapper reviewMapper;

	@Override
	public void registerReview(ReviewVO review) {
		
		reviewMapper.insertReview(review);
		
	}

	@Override
	public List<ReviewVO> findReviewWithBookNo(int book_no) {
		
		return reviewMapper.findReviewWithBookNo(book_no);
	}


	@Override
	public void editReivew(ReviewVO review) {

		reviewMapper.updateReview(review);
	}

	@Override
	public void deleteReive(int re_no) {

		reviewMapper.deleteReview(re_no);
	}

	@Override
	public int findReivewCount(int book_no) {

		return reviewMapper.selectReivewCount(book_no);
	}

	@Override
	public List<ReviewVO> findReivewWithPaging(HashMap<String, Object> params) {
		
		return reviewMapper.findReviewWithPaging(params);
	}

	@Override
	public void reviewCount(int book_no) {

		reviewMapper.selectReviewCount(book_no);
	}

	@Override
	public List<ReviewVO> showReviewList(String id) {
		
		return reviewMapper.selectReviewList(id);
	}

	
}
