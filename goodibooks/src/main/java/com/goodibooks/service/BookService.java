package com.goodibooks.service;

import java.util.HashMap;
import java.util.List;

import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;

public interface BookService {

	BookInfoVO showBookDetailByBookNo(int book_no);
	List<BookInfoVO> selectDetailProducts(BookInfoVO book);
	List<BookInfoVO> showBookList(HashMap<String, Object> params);
	List<CategoryVO> getCategoryList();
	int bookCount();
	List<BookInfoVO> searchBook(HashMap<String, Object> params);
	List<BookInfoVO> showBookListNoPaging();
	
}
