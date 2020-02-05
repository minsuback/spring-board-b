package com.goodibooks.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.BookImgVO;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;
import com.goodibooks.vo.EventBoardVO;
import com.goodibooks.vo.MemberVO;
import com.goodibooks.vo.PublisherVO;

@Mapper
public interface AdminMapper {

	List<MemberVO> showMemberList();

	void insertBook(BookInfoVO bookinfo);

	List<CategoryVO> selectCategory();

	List<PublisherVO> selectPublisher();

	void insertBookImg(BookImgVO bookImg);

	void insertPub(PublisherVO publisher);
	
	// 이벤트 관련
	void insertEvent(EventBoardVO event);
	List<EventBoardVO> selectEventList();
	EventBoardVO selectEventByNo(int no);
	void updateEventByNo(EventBoardVO event);
	void deleteEventByNo(int no);
	void updateActiveByNo(HashMap<String, Object> params);

	void deletePub(int pub_no);

	List<PublisherVO> selectpubListWidthPaging(HashMap<String, Object> params);

	int selectPubCount();

	BookInfoVO selectBookInfoByBookNo(int book_no);

	List<BookImgVO> selectBookImgByBookNo(int book_no);

	void updateBook(BookInfoVO bookinfo);

	void updateBookImg(BookImgVO bookImg);

	void deleteBook(int book_no);

	void deleteBookImg(int book_no);
	
}
