package com.goodibooks.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CartListVO;

@Mapper
public interface CartMapper {

	void insertCartByMemberId(CartListVO cart);
	List<CartListVO> selectCartByMemberId(String id);
	void deleteCartByCartNo(int cart_no);
	void deleteCartById(String order_id);
	
}
