package com.goodibooks.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.CartListVO;
import com.goodibooks.vo.OrderDetailVO;
import com.goodibooks.vo.OrderInfoVO;

@Mapper
public interface PurchaseMapper {

	void orderInfoPlus(String id);

	void insertOrder(String id);

	void insertOrderDeatil(OrderDetailVO detail);

	void insertCartList(List<CartListVO> carts);

	List<OrderInfoVO> selectCheckoutList(String id);





}
