package com.goodibooks.service;

import java.util.List;

import com.goodibooks.mapper.BookMapper;
import com.goodibooks.mapper.CartMapper;
import com.goodibooks.vo.CartListVO;

import lombok.Setter;

public class CartServiceImpl implements CartService {

	@Setter
	private CartMapper cartMapper;
	@Setter
	private BookMapper bookMapper;
	
	@Override
	public void insertCartByMemberId(CartListVO cart) {
		
		cartMapper.insertCartByMemberId(cart);
		
	}

	@Override
	public List<CartListVO> showCartListByMemberId(String id) {
		
		List<CartListVO> carts = cartMapper.selectCartByMemberId(id); // member id 로 장바구니 목록 가져오기
		for (CartListVO c : carts) {
			c.setBook(bookMapper.selectBookByBookNo(c.getBook_no()));	// 장바구니 번호로 책정보 가져오기
			c.getBook().setImgs(bookMapper.selectImgByBookNo(c.getBook_no())); // 이미지 가져오기
		}
		
		return carts;
	}

	@Override
	public void deleteCartByCartNo(int cart_no) {

		cartMapper.deleteCartByCartNo(cart_no);
		
	}

}
