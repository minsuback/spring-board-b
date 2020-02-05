package com.goodibooks.service;

import java.util.List;

import com.goodibooks.vo.CartListVO;
import com.goodibooks.vo.OrderDetailVO;
import com.goodibooks.vo.OrderInfoVO;

public interface PurchaseService {

	void orderInfoPlus(String id);

	int purchaseBook(OrderDetailVO detail);

	void purchaseCartList(List<OrderDetailVO> orderList);

	List<OrderInfoVO> showCheckoutList(String id);

}
