$(function() {
	// 장바구니에서 물건 삭제
	$(".deleteCartBtn").on("click", function(event) {
		if (!confirm("장바구니에서 삭제할까요?")) {
			event.preventDefault(); return;
		}
		
		if (!$("#loginuser").val()) {
			alert("로그인이 필요합니다."); 
			return;
		}
		
		$.ajax({
			"url" : "/goodibooks/mypage/mycart-delete.action",
			"method" : "post",
			"data" : {
				"cart_no" : $(this).attr("cartNo")
			},
			"success" : function(data, status, xhr) {
				alert("상품을 장바구니에서 삭제했습니다.");
				
				$('#topbar-cart').load("/goodibooks/mypage/cartlist/" + $("#loginuser").val());
				location.reload();

			},	
			"error" : function(xhr, status, err) {
				alert("삭제 실패");
			}
		});
	});
	
	// 책의 총 가격 계산하는 함수
	$.fn.priceTotal = function() {
		var total = $(".cart-products .product-subtotal").text().split("원");
		var total2 = 0;
		for (var i = 0; i < total.length; i ++) total2 += Number(total[i]);

		$(".subtotal").text(total2 + "원");
		$("#total").text(total2 + "원");
	}
	
	// 장바구니 페이지 로드될때 총가격 계산
	$(".cart-products").ready(function() {
		$().priceTotal();
	})
	
	// 개수증가할때 총가격계산
	$(".product-quantity input").change(function(event) {
		if ($(this).val() < 1) {
			$(this).val("1");
		} else {
			var price = $(this).attr("price") * $(this).val();
			var cartNo = $(this).attr('cartNo');
			$(".cart-products[cartNo=" + cartNo + "] .product-subtotal").text(price + "원");
			$().priceTotal();
		}
	});
	
});









