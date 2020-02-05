package com.springboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springboard.service.BoardService;
import com.springboard.service.BoardServiceImpl;
import com.springboard.ui.ThePager;
import com.springboard.ui.ThePager2;
import com.springboard.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(path = { "/board" })
@Log4j // lombok이 log변수를 자동으로 생성
public class BoardController {

	@Autowired 											// 의존성 주입(root-context 에서 사용한 것을 사용함)
	@Qualifier("boardService") 							// (root-context에서) "boardService" 이름으로 된 애를 사용하겠다 - 매칭해줌
	private BoardService boardService; 					// 필드 선언은 무적권 private 로 한다

	@GetMapping(path = { "/list2.action" })
	public String list(Model model) { // 목록 보기

		// 데이터 조회 ( 서비스에 요청 )
		List<BoardVO> boards = boardService.findBoard();

		// Model 타입 전달인자에 데이터 저장 -> View 로 전달함!!@!@!@
		// (실제로는 Model이 아닌 Request 객체에 데이터를 저장함)
		model.addAttribute("boards", boards);

		return "board/list"; 							// /WEB-INF/views/ + board/list + .jsp
	}

	@GetMapping(path = { "/list.action" })
	public String list2(@RequestParam(defaultValue = "1")int pageNo , 
						@RequestParam(required = false)String searchType , 
						@RequestParam(required = false)String searchKey , HttpServletRequest req , Model model ) {
		// @RequestParam(defaultValue = "1") : 값이 안들어오면 pageNo=1 로 보내줘라 라는 뜻
		// @RequestParam(required = false) : 데이터가 요청데이터에 없으면 null로 처리 / 해당 옵션이 없으면 오류가 발생함 - 리스트 진입 시, 오류
		
		int pageSize = 3;
		int pagerSize =3;
		HashMap<String, Object> params = new HashMap<String, Object>();
		int beginning = (pageNo -1 ) * pageSize + 1;
		params.put("beginning", beginning );
		params.put("end", beginning + pageSize);
		
		params.put("searchType", searchType);
		params.put("searchKey", searchKey);
		
		// 데이터 조회 ( 서비스에 요청 )
		List<BoardVO> boards = boardService.findBoardWithPaging(params);
		
		int boardCount = boardService.findBoardCount(params);		// 전체 글 개수

//		ThePager pager = new ThePager(boardCount, pageNo, pageSize, pagerSize, "list.action");
		ThePager2 pager = new ThePager2(boardCount, pageNo, pageSize, pagerSize, "list.action", req.getQueryString());
		
		// Model 타입 전달인자에 데이터 저장 -> View 로 전달함!!@!@!@
		// (실제로는 Model이 아닌 Request 객체에 데이터를 저장함)
		model.addAttribute("boards", boards);
		model.addAttribute("pager", pager);
		
		return "board/list"; // /WEB-INF/views/ + board/list + .jsp
	}

	@GetMapping(path = { "/write.action" })
	public String showWriteForm() { // 글쓰기 화면 보기

		return "board/write"; // /WEB-INF/views/ + board/list + .jsp
	}

	@PostMapping(path = { "/write.action" })
	public String writer(BoardVO board, RedirectAttributes attr) { // 글쓰기 처리
		// writer메소드의 매개변수 BoardVO로 인해, list.jsp에서 작성하는 데이터를 그냥 읽어들여서 BoardVO에 저장함.

		// log로 데이터가 잘 들어오는지 확인하는 코드
//		log.warn(board.getTitle());
//		log.warn(board.getWriter());
//		log.warn(board.getContent());

//		BoardService boardService = new BoardServiceImpl();
		// 26 line의 선언으로 인해 55 line을 사용하지 않고 boardService를 객체를 생성하고 사용함
		int newBoardNo = boardService.writeBoard(board);
		log.warn("new Board NO : " + newBoardNo);

		// 1. GET 방식으로 데이타 전달
//		return "redirect:list.action?newBno=" + newBoardNo;			// /WEB-INF/views/ + board/list + .jsp
//		attr.addAttribute("newBno", newBoardNo);

		// 2. 스프링의 기능을 이용해서 데이터 전달(Redirect 하는 이동에서 한단계만 데이터가 유지됨)
		attr.addFlashAttribute("newBno", newBoardNo); // session에 저장 / jsp에서는 이 데이터를 ${ newBno } 로 사용할 수 있음
		return "redirect:list.action";
	}

	@GetMapping(path = { "/detail.action" })
	public String showDeatil(int bno, Model model , HttpServletRequest req, HttpServletResponse resp ) { 
		// MVC에서는 bno를 String으로 받아서 parseInt해줘야하지만, 스프링에서는 자동으로 형변환을 해줌
		
		// 1-1. bno 를 이용해서 게시물 조회
		BoardVO board = boardService.findBoardByBno(bno);
		if (board == null) {
			return "redirect:list.action";
		}
		
		// 1-2. 기존에 읽은 글번호 목록을 Cookie에서 읽기
		String bnoRead = "";
		Cookie[] cookies = req.getCookies();
		for( Cookie cookie : cookies) {
			if(cookie.getName().equals("bno_read")) {
				bnoRead = cookie.getValue();
			}
		}
		
		// 1-2. bno가 기존에 읽은 글번호 목록에 없다면 조회수 증가
		if( !bnoRead.contains(String.format("|%d|", bno)) ) {
			
			boardService.increaseReadCount(bno);
			// (1-2)가 적용된 카운트가 노출되지 않기때문에, readCount를 +1 해준다.
			board.setReadCount(board.getReadCount() + 1);
			
			// 1-3. 같은 사용자(브라우저)의 조회수 증가를 막기 위해 Cookie에 데이터 저장
			Cookie newCookie = new Cookie("bno_read" , String.format("%s|%d|", bnoRead , bno));
			
			resp.addCookie(newCookie);
			
		}
		
		// 2, 조회된 데이터를 View에서 사용헐수았도록 저장
		// controller -> jsp 로 전달인자 보내는방법 3가지 - Model , VO , ModelandView
		model.addAttribute("board", board);

		// 3. View 로 이동
		return "board/detail";
	}

	@GetMapping(path = { "/delete.action" })
	public String delete(int bno, int pageNo,
			@RequestParam(required = false) String searchType, @RequestParam(required = false) String searchKey ) {
		
		boardService.deleteBoard(bno);
		
		// searchKey 를 보낼때 한글이 깨지기 때문에, endcoing 작업을 해줘야함 -> 예외처리를 해야 (코딩)오류가 안남
		String encodedKey = "";
		try {
			encodedKey = URLEncoder.encode(searchKey, "utf-8");
		} catch(Exception ex) {
		}
		
		return String.format("redirect:list.action?pageNo=%d&searchKey=%s&searchType=%s", pageNo, encodedKey, searchType);
	}

	@GetMapping(path = { "/update.action" })
	public String showUpdateForm(int bno , Model model) {

		// 1. bno 를 이용해서 게시물 조회
		BoardVO board = boardService.findBoardByBno(bno);
		if (board == null) {
			return "redirect:list.action";
		}
		
		// 2, 조회된 데이터를 View에서 사용헐수았도록 저장
		// controller -> jsp 로 전달인자 보내는방법 3가지 - Model , VO , ModelandView
		model.addAttribute("board", board);

		return "board/update";
	}

	@PostMapping(path = { "/update.action" })
	public String update(BoardVO board , int pageNo,
			@RequestParam(required = false) String searchType, @RequestParam(required = false) String searchKey ) {
		
		boardService.updateBoard(board);
		
		String encodedKey = "";
		try {
			encodedKey = URLEncoder.encode(searchKey, "utf-8");
		} catch(Exception ex) {
		}
		
		return String.format("redirect:detail.action?bno=%d&pageNo=%d&searchType=%s&searchKey=%s", board.getBno(), pageNo, searchType , encodedKey);
		
	}
}
