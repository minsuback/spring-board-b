package com.goodibooks.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodibooks.service.AskService;
import com.goodibooks.service.CartService;
import com.goodibooks.service.PurchaseService;
import com.goodibooks.service.ReviewService;
import com.goodibooks.vo.CartListVO;
import com.goodibooks.vo.OrderDetailVO;
import com.goodibooks.vo.OrderInfoVO;
import com.goodibooks.vo.QnAVO;
import com.goodibooks.vo.ReviewVO;

@Controller
@RequestMapping( path= {"/mypage/"})
public class MyPageController {
	
	@Autowired
	@Qualifier("cartService")
	private CartService cartService;
	
	@Autowired
	@Qualifier("purchaseService")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;
	
	@Autowired
	@Qualifier("askService")
	private AskService askService;
	
	// 마이페이지로 이동
	@GetMapping( path= {"/mypage.action"})
	public String toMypage(HttpSession session, Model model, String id, OrderInfoVO info, OrderDetailVO detail) {
		
		// 구매내역 조회
		List<OrderInfoVO> infos = purchaseService.showCheckoutList(id);
		
		// 한줄평 조회
		List<ReviewVO> reviews = reviewService.showReviewList(id); 
		
		// 1대1문의 조회
		List<QnAVO> qnas = askService.showAskList(id);

		model.addAttribute("infos", infos);
		model.addAttribute("reviews", reviews);
		model.addAttribute("qnas", qnas);
		
		return "mypage/mypage";
	}

	// 장바구니 페이지로 이동
	@GetMapping( path= {"/mycart.action"})
	public String toMyCart() {
		
		return "mypage/mycart";
	}
	
	// 장바구니에 책 추가
	@PostMapping("/mycart-insert.action")
	@ResponseBody
	public String addCart(CartListVO cart, HttpSession session) {
		
		List<CartListVO> carts = (List<CartListVO>)session.getAttribute("cartlist");
		
		if (carts == null) {
			cartService.insertCartByMemberId(cart);
		} else {
			for (int i = 0; i < carts.size(); i ++) {
				if (carts.get(i).getBook_no() == cart.getBook_no()) {
					cart.setCart_count(carts.get(i).getCart_count() + cart.getCart_count());
					cartService.deleteCartByCartNo(carts.get(i).getCart_no());
					carts.remove(i);
				}
			}
			
			cartService.insertCartByMemberId(cart);
		}
		
		return "success";
	}
	
	// 장바구니 목록 가져오기
	@GetMapping("/cartlist/{id}")
	public String cartList(@PathVariable String id, HttpSession session) {
		
		List<CartListVO> carts = cartService.showCartListByMemberId(id);
		session.setAttribute("cartlist", carts);
		
		//return "/goodibooks/modules/cartlist";
		return "/goodibooks/modules/topbar";
	}

	//장바구니에서 삭제
	@PostMapping("/mycart-delete.action")
	@ResponseBody
	public String deleteCart(int cart_no) {

		cartService.deleteCartByCartNo(cart_no);
		
		return "success";
	}
}
