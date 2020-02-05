package com.goodibooks.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodibooks.service.ReviewService;
import com.goodibooks.ui.ThePager;
import com.goodibooks.vo.ReviewVO;

@Controller
@RequestMapping(path = {"/review/"})
public class ReviewController {

	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;
	
	@PostMapping(path = {"/review.action"})
	public String registerReview(ReviewVO review) {
		
		reviewService.registerReview(review);
		System.out.println(review.getBook_no());
		
		return String.format("redirect:/book/detail.action?book_no=%d", review.getBook_no() );
	}
	
	// 테스트
//	@GetMapping(path= {"/retest.action"})
//	public String reviewTest(Model model) {
//		
//		List<ReviewVO> reviews = reviewService.findReviewTest();
//		model.addAttribute("reviews", reviews);
//		return "/book/retest";
//	}
//	
//	@PostMapping(path= {"/retest.action"})
//	public String testWrite(ReviewVO review) {
//		
//		reviewService.registerReview(review);
//		
//		return "redirect:/";
//	}
	
	@PostMapping(path= {"/reviewRegister.action"})
	@ResponseBody
	public String reviewRegister(ReviewVO review) {
		
		reviewService.registerReview(review);
		
		return "success";
	}
	
	@GetMapping(path= {"/reviewContent/{book_no}"})
	public String ReviewContent(@PathVariable int book_no, Model model, @RequestParam(defaultValue = "1")int pageNo) {
		
//		List<ReviewVO> reviews = reviewService.findReviewWithBookNo(book_no);
//		model.addAttribute("reviews", reviews);
		
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
		
		String format = "detail.action?book_no="+book_no;
		
		ThePager pager = new ThePager(reviewCount, pageNo, pageSize, pagerSize, format);

		model.addAttribute("pager", pager);
		
		return "/book/reviews";
	}
	
	@PutMapping(path= {"/editReview"}, consumes="application/json")
	@ResponseBody
	public String editReview(@RequestBody ReviewVO review) {
		
		reviewService.editReivew(review);
		
		return "success";
	}
	
	@DeleteMapping(path= {"/delete/{re_no}"})
	@ResponseBody
	public String deleteReview(@PathVariable int re_no) {
		
		System.out.println(re_no);
		
		reviewService.deleteReive(re_no);
		
		return "success";
	}
	
}
