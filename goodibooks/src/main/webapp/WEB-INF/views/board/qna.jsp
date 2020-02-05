<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>구디북스-자주하는질문</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

<script src="/goodibooks/resources/js/vendor/modernizr-2.8.3.min.js"></script>

</head>
<body class="blog">
	<!-- header-area-start -->
	<header>

		<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />


	</header>
	<!-- header-area-end -->
	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="/goodibooks/">Home</a></li>
							<li><a href="#" class="active">자주 하는 질문</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	
	
	<!-- mainsection : 자주하는 질문 -->
	<!-- bootstrap의 accordion collapse 기능으로 자주하는 질문을 클릭시 expand/collapse 형태로 보여지게 만들었다. -->
	
	
	<div class="container accordion" id="accordionExample">
	<h1 style="border:2px]">자주 하는 질문</h1><br>
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button style="color:black" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
             [계정]휴면계정은 무엇인가요?
        </button>
      </h2>
    </div>
    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
        휴면계정이란 일정기간(만 1년)동안 회원이 구디북스 사이트에 로그인 하지 않았을 경우,<br> 
        원활하고 안전한 회원 관리를 위해 사이트 이용 및 계정으로 지급된 일체의 캐시 및 포인트 사용이 제한된 계정입니다.<br>

		※ 최근 1년간 구디북스 서비스를 이용한 기록이 없는 경우, 정보통신망법에 의거하여 2015년 8월부터 휴면회원으로 전환처리 됩니다.<br>

		※ 휴면계정으로 전환된 아이디의 경우 직접 구디북스 서점 홈페이지에 로그인을 하여주시면 휴면 계정 해제처리 됩니다.<br>

		※ 2016년 이후 이메일인증을 통해서 가입한 경우, 리디북스 서점 홈페이지 로그인 후 마이페이지>정보변경에서 이메일 인증을 완료하면 휴면 계정 해제 처리 됩니다.<br>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        	[편의]  내 서재에서 도서를 숨기고 싶어요. 안보이게 할 수 있나요?
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
        안드로이드 앱의 경우 19.11.5 버전부터는 앱의 [모든 책] 메뉴에서 아래의 방법으로 바로 숨기기가 가능합니다.<br><br>
        <ul>
        	<li>ㆍ도서 롱터치 하여 나타나는 팝업에서 [숨기기] 터치</li>
        	<li>ㆍ또는 우측 상단의 ⓥ  버튼 터치 후 하단의 [숨기기] 터치</li>
        </ul>
        이외의 환경에서는 앱(뷰어)의 구매목록에서 바로 도서 숨기기는 진행이 불가하며 [내 서재] 페이지에서 숨기기가 가능합니다.<br><br>
        
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        	[결제]  도서구입비 소득공제 대상 범위는 어떻게 되나요?
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
      <ul>
      	<li>ㆍ출판문화산업 진흥법 제2조 제3호에 따른 기록사항(저자, 발행인, 발행일, 출판사, 국제표준도서번호(ISBN, 전자책은 ECN 포함)이 표기된 간행물)</li>
      	<li>ㆍ종이책, 전자책, 외국 발행 간행물, 중고책(재판매 목적이 아닌 독서∙학습 등의 목적으로 최종소비자에게 판매되었던 간행물로 판매자에 의해 다시 판매되는 도서)포함</li>
      </ul>
      위에 해당되는 도서문화비 소득공제 대상 범위 도서를 아래의 결제수단으로 결제한 경우에 한하여 소득공제를 받으실 수 있습니다.<br><br>
      <ul>
      	<li>ㆍ신용카드, 실시간 계좌이체 (2018년 9월 28일 오전 11시 이후 결제 건에 한함) </li>
      	<li>ㆍ네이버페이, 카카오페이 (2018년 10월 30일 오후 3시 이후 결제 건에 한함)</li>
      	<li>ㆍ페이코, 삼성페이 (2019년 5월 22일 오후 5시 이후 결제 건에 한함)</li>
      	<li>ㆍ휴대폰 소액결제 (2019년 6월 3일 오후 6시 이후 결제 건에 한함)</li>
      </ul>
      타 결제수단의 경우 소득공제를 받으실 수 없습니다만, 소득공제 지원은 점차적으로 확대될 예정입니다.<br><br>
      Paynow 등을 통해 신용카드 또는 계좌이체 결제하신 경우에는 문화비 소득공제 적용에 포함되지 않으며 반드시 리디북스 결제 페이지에서 결제수단을 위 안내드린 지원 수단으로 선택하여 도서구입비 소득공제 대상 범위 도서를 결제한 경우에 한하여 적용 됩니다.<br><br>
      도서 결제 시도 시 비대상 도서가 포함되어있으면 소득공제를 받으실 수 없사오니 주문 시 꼭 확인을 부탁드립니다. (대여 도서는 소득공제 범위에 포함되지 않습니다.)<br><br>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFour">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        	[이용]  다운받은 책이 파일이 손상되었다며 열리지 않아요! (파일손상, 인코딩 오류)
        </button>
      </h2>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
      <div class="card-body">
        네트워크 환경이 불안정한 환경(간헐적 인터넷 끊김현상 등)에서 책을 다운받은 경우 다운받은 책파일이 손상되는 경우가 발생할 수 있습니다.<br><br>
        <text style="font-weight:bold">DRM 오류, 압축 해제 문구, 인코딩오류, 파일손상 안내</text> 등이 나타나거나 도서가 백지로 보일 경우 아래와 같이 조치하여 주시기 바랍니다.<br><br><br><br>
         1. 애플리케이션 [내 서재] 메뉴로 들어가신 후 iOS 기기에서는 [편집]버튼, 안드로이드 기기에서는 [ⓥ] 버튼을 눌러 해당 책을 선택, 우측 하단의 빨간색 [삭제]버튼을 터치하여 삭제합니다.<br><br>
         <ul>
         	<li>ㆍPC뷰어에서 이용하시는 경우에는 [내 서재] 에서 해당 도서 위에 마우스 커서를 올려놓으시고 우클릭 하시면 [책 삭제...] 버튼이 나타납니다. 해당 버튼으로 삭제 후 구매목록에서 다운로드 부탁드립니다.</li>
         	<li>ㆍ서점의 [내 서재] 페이지에서 숨기기를 하시거나 영구삭제를 하시면 구매목록에서 사라지오니 꼭 유의해주시고 애플리케이션의 [내 서재]에서 삭제 부탁드립니다.</li>
         </ul><br><br>
         2. 구디북스 앱 우측 하단의  [설정] 메뉴로 들어가신 후  [임시데이터  파일 삭제] 메뉴를 통하여 임시 데이터를 삭제합니다.<br><br>
         3. 네트워크 환경이 원활한 장소에서 앱 하단의 [구매목록]에서 도서를 검색 후 다운받아 주시기 바랍니다. <br><br>
         이러한 조치에도 불구하고 다운받은 책이 열리지 않는 경우 아래 정보를 기재하시어 고객센터로 문의하여 주시기 바랍니다.<br><br><br><br>
         &nbsp&nbsp 1. 이용하시는 기기명 :
         &nbsp&nbsp 2. 기기 OS 버전 : (기기의 환경설정에 디바이스 정보나 휴대폰 정보에서 확인하실 수 있습니다.)
         &nbsp&nbsp 3. 리디북스 앱(어플) 버전 : (최신버전이 아닌 경우 반드시 업데이트 부탁드립니다.)
         &nbsp&nbsp 4. 문제가 되는 도서명 :
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFive">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        	[이벤트]  이벤트 도서를 결제했는데 포인트백이 안돼요!
        </button>
      </h2>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
      <div class="card-body">
        미션1, 미션2 수행 후 포인트를 받으실 수 있는 [십오야의 핫딜], [신간알림 신청] 이벤트의 경우 이벤트 페이지에 안내된대로 미션1, 작가의 신간알림을 신청하여 주신 후 미션2에 안내된 세트도서를 결제해주셔야지만 포인트백 받기 버튼이 활성화됩니다.<br><br>
        반드시 이벤트 페이지에 안내되어있는 세트도서로 결제해주셔야 하며 전권구매, 혹은 단권을 각각 구매하신 경우에는 미션2로 인정되지 않아 포인트백 받기 진행이 되지 않습니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingSix">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
        	[결제]  자동충전 결제카드나 자동충전 금액을 변경하고 싶어요.
        </button>
      </h2>
    </div>
    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
      <div class="card-body">
        구디캐시 자동충전 카드 정보를 변경 원하시거나 또는 자동 충전 금액 변경을 원하실 경우에는 아래와 같이 진행해주시면 됩니다.<br><br>
        1. <text style="color:hotpink">[마이구디 → 구디캐시 → 자동충전]</text>에서 충전을 해지합니다.<br><br>
        2. 자동충전 페이지로 접속하시면 다시 신청하실 수 있으며 새로운 카드 정보 또는 금액으로 자동충전 설정을 합니다.<br><br>
        참고로, 1일이지만 아직 자동충전 결제가 이루어지지 않은 상태이시라면 반드시 [지금 충전하기] 옵션 체크를 하신 후 자동충전 신청을 해주셔야지만 결제가 이루어짐과 동시에 자동충전 결제 신청이 이루어집니다. ([지금 충전하기] 옵션은 123일 동안에만 표시됩니다.)<br><br>
        즉, 1~3일에 자동충전 카드, 금액을 변경하여 새로 신청 시 [지금 충전하기] 옵션을 체크하지 않으시면 자동충전 설정만 이루어지며 실제 첫 구디캐시 자동충전 결제는 익월 1일 오전에 10시 전후에 이루어집니다.<br><br>
        (자동충전의 경우 국내발행 신용/체크카드로 신청 가능하며 해외발행 카드 및 기타 결제수단으로는 신청이 불가한 점 양해 부탁드립니다.)<br><br><br>
        <text style="color:red; font-weight:bold">꼭 확인해주세요!!</text><br><br>
        ※ [마이구디 > 셀렉트 카드 관리] 메뉴에 등록되어있는 카드를 삭제하시면 해당 카드로 구디셀렉트 구독중일 경우 구디셀렉트 해지 예약이 이루어지므로 반드시 위 안내에 따라 해지 및 재설정 진행 부탁드립니다.
        
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingSeven">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
        	[편의]  아이디(ID), 비밀번호를 잊어버렸어요. 어떻게 확인하나요?
        </button>
      </h2>
    </div>
    <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordionExample">
      <div class="card-body">
        홈페이지에서 로그인버튼을 눌러 [아이디 찾기, 비밀번호 찾기] 메뉴를 이용하면 확인이 가능합니다.<br><br>
        아이디, 비밀번호 찾기 시 정상적으로 진행이 되지 않는다면 회원가입을 하지 않으셨거나 등록된 정보가 다른 경우일 수 있습니다.<br><br>
        (예를들어 회원가입 시 E-mail 주소 정보에 ridibooks@hanmail.net 으로 입력하셨다면 반드시 동일한 주소로 검색해주셔야 ID 찾기가 가능합니다.  ridibooks@daum.net 으로 검색 하실 경우 일치하지 않는 정보로서 조회가 되지 않습니다.)<br><br>
        가입정보가 확인되지 않으나 이전에 이용 기록이 있는 경우, 아래 정보를 기재하시어 고객센터 help@goodibooks.com 으로 문의하여 주시기 바랍니다.
        <ul>
        	<li>ㆍ성함 :</li>
        	<li>ㆍ태어나신 년도 :</li>
        	<li>ㆍ인터넷 상에서 주로 이용하시는 ID :</li>
        	<li>ㆍ사용하시는 E-mail 주소 :</li>
        	<li>ㆍ이용하셨던 도서명 :</li>
        </ul>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingEight">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
        	[편의]  앱에서는 회원가입이 안되나요?
        </button>
      </h2>
    </div>
    <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordionExample">
      <div class="card-body">
        회원가입은 PC의 인터넷 또는 모바일 기기에서 <text style="color:hotpink; font-weight:bold">구디북스 홈페이지(http://localhost:8081/goodibooks/)를 통하여 가능합니다.</text><br><br>
        (PC에서는 우측 상단의 [회원가입] 버튼을 통하여, 모바일에서는 구디북스 서점 우측 상단의 [로그인] 버튼을 누른 후 로그인 페이지 하단에 [회원가입] 메뉴를 확인하실 수 있습니다)<br><br>
        안드로이드 기반 기기의 경우 앱에서 아래 방법으로 회원가입 페이지로 이동하실 수 있습니다.<br><br>
        &nbsp&nbsp 1. 앱을 실행합니다.<br>
        &nbsp&nbsp 2. 우측 하단의 설정을 터치합니다.<br>
        &nbsp&nbsp 3. 로그인/회원가입을 터치합니다.<br>
        &nbsp&nbsp 4. 로그인 창 하단의 회원가입을 터치합니다.<br>
        &nbsp&nbsp 5. 회원가입 창이 나타나며 해당 페이지에서 회원가입을 진행하실 수 있습니다.<br><br>
        다만 iOS기반 기기에서는 구디북스 애플리케이션을 통한 회원가입이 제한되어 있으며, 구디북스 홈페이지에서만 가입이 가능합니다. 다소 번거로우시겠지만 Safari와 같은 인터넷 연결 앱을 통해 구디북스 홈페이지 접속 후 회원가입 시도 부탁드립니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingNine">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
        	[이용]  책은 어떻게 읽나요? - 안드로이드 앱, iOS 앱 이용 방법
        </button>
      </h2>
    </div>
    <div id="collapseNine" class="collapse" aria-labelledby="headingNine" data-parent="#accordionExample">
      <div class="card-body">
        <h5>01  구디북스 서점에서 <text style="color:hotpink; font-weight:bold">책을 구매</text>하세요.</h5><br>
        <h5>02  Play 스토어 / App Store에서 <text style="color:hotpink; font-weight:bold">앱을 다운로드</text> 하세요.</h5><br>
        <h5>03  구디북스 계정으로 <text style="color:hotpink; font-weight:bold">로그인</text> 하세요.</h5><br>
        <h5>04  구매목록에서 <text style="color:hotpink; font-weight:bold">책을 다운로드</text> 하세요.</h5><br>
        <h5>05  <text style="color:hotpink; font-weight:bold">책 모양 버튼을 누르면</text> 책이 펼쳐집니다.<br>즐거운 독서하세요!</h5>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTen">
      <h2 class="mb-0">
        <button style="color:black"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
        	[결제]  똑같은 책을 두 번 결제했습니다.
        </button>
      </h2>
    </div>
    <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#accordionExample">
      <div class="card-body">
        구디북스에서 이미 구매하신 도서는 도서 상세정보 페이지에서 [다운로드]로 표시되며 중복/추가결제는 불가하오나 다른 출판사를 통해 중복으로 출간, 서비스되고 있는 작품의 경우 중복결제가 이루어질 수 있습니다.<br><br>
        동일한 도서를 중복으로 결제하신 경우, 중복 구매한 도서명을 기재하여 고객센터로 문의하여 주시면 결제 내역 확인 후 환불을 도와드리고 있습니다.<br><br>
        (단, 단권 구매 후 세트를 다시 구매하실 경우에는 타인에게 선물할 수 있는 "선물 쿠폰"으로 지급되어 동일한 사유로 환불이 불가합니다.)<br><br>
        <text style="color:red; font-weight:bold">또한 타사에서 중복으로 결제한 도서는 환불이 불가합니다.</text>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingEleven">
      <h2 class="mb-0">
        <button style="color:black;"  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
        	[결제]  구입한 책을 환불하고 싶어요.
        </button>
      </h2>
    </div>
    <div id="collapseEleven" class="collapse" aria-labelledby="headingEleven" data-parent="#accordionExample">
      <div class="card-body">
        결제 취소 및 환불은 다운로드 또는 스트리밍으로 이용하지 않는 경우에만 가능합니다.<br><br>
        책을 다운로드 (다운로드 시작, 다운로드 시도 포함) 하지 않았거나 연재도서의 경우 웹에서 바로 열람하여 스트리밍으로 이용하지 않았다면, 결제일로부터 7일 이내에 결제내역 페이지에서 상품명 클릭 하여 결제취소 버튼을 통해서 구매하신 도서를 결제 취소하고 환불 받으실 수 있습니다.<br><br>
        ※ 세트도서의 경우 하나의 단일 상품으로서 세트 구성 도서 중 한 권 이라도 다운로드 시도 하시면 세트도서 환불 및 부분 취소 등이 불가합니다.
        ※ 결제일로부터 7일이 경과된 경우에는 다운로드 시도 (또는 스트리밍 여부) 관계 없이 결제 취소가 불가하며 이 경우 [결제 취소] 버튼이 나타나지 않습니다.  
      </div>
    </div>
  </div>
</div>
	
	<br><br><br>
	
	<!-- end of mainsection -->
	
	

	<!-- footer-area-start -->
	<footer>

		<jsp:include page="/WEB-INF/views/modules/footbar.jsp" />

	</footer>
	<!-- Modal end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

</body>
</html>
