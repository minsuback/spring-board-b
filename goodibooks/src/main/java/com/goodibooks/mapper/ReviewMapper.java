package com.goodibooks.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	void insertReview(ReviewVO review);

	List<ReviewVO> findReviewWithBookNo(int book_no);

	void updateReview(ReviewVO review);

	void deleteReview(int re_no);

	int selectReivewCount(int book_no);

	List<ReviewVO> findReviewWithPaging(HashMap<String, Object> params);

	void selectReviewCount(int book_no);

	List<ReviewVO> selectReviewList(String id);

}
