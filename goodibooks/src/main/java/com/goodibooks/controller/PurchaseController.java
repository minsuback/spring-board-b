package com.goodibooks.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodibooks.service.BookService;
import com.goodibooks.service.CartService;
import com.goodibooks.service.PurchaseService;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CartListVO;
import com.goodibooks.vo.MemberVO;
import com.goodibooks.vo.OrderDetailVO;
import com.goodibooks.vo.OrderInfoVO;

@Controller
@RequestMapping( path= {"/purchase/"})
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseService")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("cartService")
	private CartService cartService;
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	
	// 결제 페이지로 이동
	@GetMapping( path= {"/purchase.action"})
	public String toPurchase(int book_no, int book_cnt, Model model) {
		
		BookInfoVO book = bookService.showBookDetailByBookNo(book_no);

		model.addAttribute("book", book);
		model.addAttribute("book_cnt", book_cnt);
		
		return "purchase/purchase";
	}
	
//	@PostMapping(path = { "/loginuserpurchase.action" })
//	public String orderInfo(OrderInfoVO order_info, RedirectAttributes attr) {
//		
//		System.out.println(order_info.toString());
//		
//		int newOrderInfoNo = purchaseService.orderInfoPlus(order_info);
//		
//		attr.addFlashAttribute("newOrderInfoNo", newOrderInfoNo);
//		
//		return "redirect:/";
//	}

	// 책 상세페이지에서 구매하기
	@PostMapping(path = { "/loginuserpurchase.action" })
	public String orderInfo(RedirectAttributes attr, OrderDetailVO detail) {
		
		int orderSuccess = purchaseService.purchaseBook(detail);
		
		attr.addFlashAttribute("newOrderInfoNo", orderSuccess);
		
		return "redirect:/";
	}
	
	// 장바구니에서 구매하기
	@PostMapping(path= {"cartListPurchase.action"})
	public String cartListOrder(RedirectAttributes attr, HttpSession session, String id) {
		
		// 회원 id 로 orderinfo 생성
		purchaseService.orderInfoPlus(id);
		
		// 장바구니 리스트 -> Order_Deatil 로 카피 and 장바구니 삭제
		// int cartListOrder = purchaseService.purchaseCartList(detail);
		List<OrderDetailVO> orderList = new ArrayList<>();

		for (CartListVO c : (List<CartListVO>)session.getAttribute("cartlist")) {
			OrderDetailVO order = new OrderDetailVO();
			order.setDetail_cnt(c.getCart_count());
			order.setDetail_price(c.getBook().getPrice() * c.getCart_count());
			order.setBook_no(c.getBook_no());
			order.setId(id);
			
			orderList.add(order);
		}
		
		// DB 에 orderDetail 저장
		purchaseService.purchaseCartList(orderList);
		
		// 모달띄우기
		attr.addFlashAttribute("newOrderInfoNo", 1);
		
		return "redirect:/";
	}
	

}























