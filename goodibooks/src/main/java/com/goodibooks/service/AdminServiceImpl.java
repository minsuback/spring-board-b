package com.goodibooks.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.goodibooks.mapper.AdminMapper;
import com.goodibooks.vo.BookImgVO;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;
import com.goodibooks.vo.EventBoardVO;
import com.goodibooks.vo.MemberVO;
import com.goodibooks.vo.PublisherVO;

import lombok.Setter;

public class AdminServiceImpl implements AdminService {

	@Setter
	private AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> showMemberList() {
		
		return adminMapper.showMemberList();
	}

//	@Override
//	public void bookRegist(BookInfoVO bookinfo) {
//
//		adminMapper.insertBook(bookinfo);
//	}

	@Override
	public List<CategoryVO> showCategory() {

		return adminMapper.selectCategory();
	}

	@Override
	public List<PublisherVO> showPublisher() {

		return adminMapper.selectPublisher();
	}

	@Override
	public void bookRegister(BookInfoVO bookinfo, ArrayList<BookImgVO> bookImgs) {
		
		// 텍스트 정보 입력
		adminMapper.insertBook(bookinfo);
		
		// img 정보 입력
		int book_no = bookinfo.getBook_no();
		
		for(BookImgVO bookImg : bookImgs) {
			bookImg.setBook_no(book_no);
			adminMapper.insertBookImg(bookImg);
		}
		
	}

	@Override
	public void pubRegist(PublisherVO publisher) {
		
		adminMapper.insertPub(publisher);
		
	}

	@Override
	public void deletePubNo(int pub_no) {
		
		adminMapper.deletePub(pub_no);
		
	}

	@Override
	public List<PublisherVO> showPubListWithPaging(HashMap<String, Object> params) {
		
		return adminMapper.selectpubListWidthPaging(params);
	}

	@Override
	public int findPubCount() {
		
		return adminMapper.selectPubCount();
	}

	@Override
	public BookInfoVO showBookInfo(int book_no) {
		
		return adminMapper.selectBookInfoByBookNo(book_no);
	}

	@Override
	public List<BookImgVO> showBookImg(int book_no) {
		
		return adminMapper.selectBookImgByBookNo(book_no);
	}

	@Override
	public void editBook(BookInfoVO bookinfo, ArrayList<BookImgVO> bookImgs) {

		// 텍스트 정보 입력
		adminMapper.updateBook(bookinfo);

		// img 정보 입력
		int book_no = bookinfo.getBook_no();
		adminMapper.deleteBookImg(book_no);

		for (BookImgVO bookImg : bookImgs) {
			bookImg.setBook_no(book_no);
			adminMapper.updateBookImg(bookImg);
		}
		
	}

	@Override
	public void deleteBookByBookNo(int book_no) {

		adminMapper.deleteBook(book_no);
	}

	public void writeEvent(EventBoardVO event) {
		adminMapper.insertEvent(event);
	}

	@Override
	public List<EventBoardVO> showEventList() {
		return adminMapper.selectEventList();
	}

	@Override
	public EventBoardVO showEventByNo(int no) {
		return adminMapper.selectEventByNo(no);
	}

	@Override
	public void updateEventByNo(EventBoardVO event) {
		adminMapper.updateEventByNo(event);
	}

	@Override
	public void deleteEventByNo(int no) {
		adminMapper.deleteEventByNo(no);
	}

	@Override
	public void updateActiveByNo(HashMap<String, Object> params) {
		adminMapper.updateActiveByNo(params);
	}

}
