package com.goodibooks.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.goodibooks.mapper.BookMapper;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;

import lombok.Setter;

public class BookServiceImpl implements BookService {

	@Setter
	private BookMapper bookMapper;

	@Override
	public BookInfoVO showBookDetailByBookNo(int book_no) {

		BookInfoVO book = bookMapper.selectBookByBookNo(book_no); // 책정보 가져오기
		book.setImgs(bookMapper.selectImgByBookNo(book_no));	  // 이미지 가져오기
		
		return book;
		
	}

	@Override
	public List<BookInfoVO> showBookList(HashMap<String, Object> params) {
		
		ArrayList<BookInfoVO> books = new ArrayList<>();
		
		for (BookInfoVO b : bookMapper.selectBooks(params)) {
			
			b.setImgs(bookMapper.selectImgByBookNo(b.getBook_no()));
			books.add(b);
		}
		
		return books;
	}

	@Override
	public List<CategoryVO> getCategoryList() {

		List<CategoryVO> categorys = bookMapper.selectCategorys(); // 카테고리 목록 가져오기
				
		for (int i = 0; i < categorys.size(); i++) {
			int bookCount;
			try { // try catch : mapper 에서 return null 인경우 VO 에 저장하지 않음.
				bookCount = bookMapper.bookCountByCategoryNo(categorys.get(i).getCategory_no());	
			} catch(Exception ex) {continue;}
			
			categorys.get(i).setBook_count(bookCount);
		}
				
		return categorys;
	}

	@Override
	public int bookCount() {
		
		return bookMapper.bookCount();
	}

	@Override
	public List<BookInfoVO> searchBook(HashMap<String, Object> params) {
		
		List<BookInfoVO> books;
		
		if (params.get("searchType").equals("A")) books = bookMapper.searchBookByKey(params);
		else books = bookMapper.searchBook(params);
		
		for (int i = 0; i < books.size(); i++) {
			books.get(i).setImgs(bookMapper.selectImgByBookNo(books.get(i).getBook_no()));
		}
		
		return books;
	}

	// 디테일에서 함께 구매한책 목록
	@Override
	public List<BookInfoVO> selectDetailProducts(BookInfoVO book) {

		List<BookInfoVO> books = new ArrayList<>();

		for (BookInfoVO b : bookMapper.selectDetailProducts(book)) {
			b.setImgs(bookMapper.selectImgByBookNo(b.getBook_no()));
			books.add(b);
		}
		
		return books;
	}

	@Override
	public List<BookInfoVO> showBookListNoPaging() {
		
		List<BookInfoVO> books = new ArrayList<>();
		
		for (BookInfoVO b : bookMapper.selectBooksNoPaging()) {
			b.setImgs(bookMapper.selectImgByBookNo(b.getBook_no()));
			books.add(b);
		}
		
		return books;
	}
	
}
