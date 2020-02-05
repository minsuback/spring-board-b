package com.goodibooks.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.goodibooks.vo.BookImgVO;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;
import com.goodibooks.vo.EventBoardVO;
import com.goodibooks.vo.MemberVO;
import com.goodibooks.vo.PublisherVO;

public interface AdminService {

	List<MemberVO> showMemberList();

	//void bookRegist(BookInfoVO bookinfo);

	List<CategoryVO> showCategory();

	List<PublisherVO> showPublisher();

	void bookRegister(BookInfoVO bookinfo, ArrayList<BookImgVO> bookImgs);

	void pubRegist(PublisherVO publisher);

	void deletePubNo(int pub_no);

	List<PublisherVO> showPubListWithPaging(HashMap<String, Object> params);

	int findPubCount();

	BookInfoVO showBookInfo(int book_no);

	List<BookImgVO> showBookImg(int book_no);

	void editBook(BookInfoVO bookinfo, ArrayList<BookImgVO> bookImgs);

	void deleteBookByBookNo(int book_no);


	// 이벤트 관련
	void writeEvent(EventBoardVO event);
	List<EventBoardVO> showEventList();
	EventBoardVO showEventByNo(int no);
	void updateEventByNo(EventBoardVO event);
	void deleteEventByNo(int no);
	void updateActiveByNo(HashMap<String, Object> params);
}
