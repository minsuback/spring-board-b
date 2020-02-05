package com.goodibooks.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.BookImgVO;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;

@Mapper
public interface BookMapper {

	BookInfoVO selectBookByBookNo(int book_no);
	List<BookImgVO> selectImgByBookNo(int book_no);
	List<BookInfoVO> selectBooks(HashMap<String, Object> params);
	int bookCount();
	List<CategoryVO> selectCategorys();
	int bookCountByCategoryNo(int category_no);
	List<BookInfoVO> searchBook(HashMap<String, Object> params);
	List<BookInfoVO> searchBookByKey(HashMap<String, Object> params);
	List<BookInfoVO> selectDetailProducts(BookInfoVO book);
	List<BookInfoVO> selectBooksNoPaging();	// home 에서 사용할 페이징없는 책리스트
	
}
