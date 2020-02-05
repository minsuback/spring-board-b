package com.goodibooks.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodibooks.service.BookService;
import com.goodibooks.service.ReviewService;
import com.goodibooks.ui.ThePager;
import com.goodibooks.ui.ThePager2;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;
import com.goodibooks.vo.ReviewVO;

@Controller
@RequestMapping(path= {"/book/"})
public class BookController {
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	
	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;

	// 상품 리스트 페이지로 이동
	@GetMapping(path= {"/list.action"} )
	// @RequestParam(required = false) : 데이터 없으면 null 로 설정
	public String toList(Model model, 
			@RequestParam(required = false)String searchType, 
			@RequestParam(required = false)String searchKey, 
			@RequestParam(defaultValue = "1")int page_no, 
			HttpServletRequest req) {

		//페이징
		int pageSize = 4;
		int pagerSize = 5;
		int start = (page_no - 1) * pageSize + 1;
		int end = start + pageSize;
		int total = bookService.bookCount();

		HashMap<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("end", end);
		//////////////////////
		
		int stotal = 0;
		
		if (searchType == null) model.addAttribute("books", bookService.showBookList(params));
		else {
			params.put("searchType", searchType);
			params.put("searchKey", searchKey);
			
			List<BookInfoVO> books =  bookService.searchBook(params);
			stotal = books.size();
			model.addAttribute("books", books);
		}

		ThePager2 pager = new ThePager2((stotal == 0) ? total : stotal, page_no, pageSize, pagerSize, "list.action", req.getQueryString());
		
		model.addAttribute("pager", pager);
		model.addAttribute("categorys", bookService.getCategoryList());
		model.addAttribute("totalBook", total);

		return "book/list";
	}
	
	// 상품 디테일 페이지로 이동
	@GetMapping(path= {"/detail.action"})
	public String toDetail(int book_no, Model model, @RequestParam(defaultValue = "1")int pageNo) {
		
		BookInfoVO book = bookService.showBookDetailByBookNo(book_no);
		
		if (book == null) return "redirect:list";

		model.addAttribute("book", book);
		
		// 함께 구매한 책
		model.addAttribute("products", bookService.selectDetailProducts(book));
		
		// 리뷰 페이징
		int pageSize = 5;
		int pagerSize = 3;
		int beginning = (pageNo -1) * pageSize +1;
		int reviewCount = reviewService.findReivewCount(book_no);
		
		HashMap<String, Object>params = new HashMap<String, Object>();
		params.put("beginning", beginning);
		params.put("end", beginning + pageSize);
		params.put("book_no", book_no);
		
		List<ReviewVO> reviews = reviewService.findReivewWithPaging(params);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("reviewCount", reviewCount);
		
		String format = "detail.action?book_no="+book_no;
		
		ThePager pager = new ThePager(reviewCount, pageNo, pageSize, pagerSize, format);

		model.addAttribute("pager", pager);
		
		return "book/detail";
	}
	
}
