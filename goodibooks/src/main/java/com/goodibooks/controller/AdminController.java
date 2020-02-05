package com.goodibooks.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodibooks.service.AdminService;
import com.goodibooks.ui.ThePager;
import com.goodibooks.ui.ThePager2;
import com.goodibooks.vo.BookImgVO;
import com.goodibooks.vo.BookInfoVO;
import com.goodibooks.vo.CategoryVO;
import com.goodibooks.vo.EventBoardVO;
import com.goodibooks.vo.MemberVO;
import com.goodibooks.vo.PublisherVO;

@Controller
@RequestMapping(path = {"/admin/"})
public class AdminController {
	
	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	//어드민 페이지로 이동
	@GetMapping(path = {"/admin.action"})
	public String toAdmin(Model model) {
		
		List<MemberVO> list = adminService.showMemberList();
		model.addAttribute("list", list);
		
		return "account/admin";
	}
	
	// 책 등록 페이지로 이동
	@GetMapping(path = {"/register.action"})
	public String toRegister() {
			
		return "admin/register";
	}
	
	// 책 등록 페이지 이동
	@GetMapping(path= {"/bookRegister"})
	public String bookRegister(Model model) {

		// 카테고리 목록 조회
		List<CategoryVO> categorys = adminService.showCategory();
		model.addAttribute("categorys", categorys);
		
		// 출판사 목록 조회
		List<PublisherVO> publishers = adminService.showPublisher();
		model.addAttribute("publishers", publishers);
		
		return "/admin/book-register";
	}
	
	// 책등록 실행
	@PostMapping(path= {"/bookRegister"})
	public String bookRegist(BookInfoVO bookinfo, @RequestParam("bookImg") MultipartFile[] files, HttpServletRequest req) {
		
		// bookInfo 정보 DB저장
		//adminService.bookRegist(bookinfo);
		
		// 이미지 파일 DB저장	
		ArrayList<BookImgVO> BookImgs = new ArrayList<BookImgVO>();
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/file/bookImg");
		
		for (MultipartFile file : files) {
			
			BookImgVO bookImg = new BookImgVO();
			
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
			
			try {
				File f = new File(path, fileName);
				if (f.exists()) {
					f.delete();
				}
				file.transferTo( f ); //파일 저장
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			bookImg.setImg(fileName);
			BookImgs.add(bookImg);
			
		}
		
		bookinfo.setIntro(bookinfo.getIntro().replace("\r\n","<br>"));
		bookinfo.setContents(bookinfo.getContents().replace("\r\n",  "<br>"));

		adminService.bookRegister(bookinfo, BookImgs);
		
		return "redirect:/book/list.action";
	}
	
	// 출판사 등록 페이지로 이동
//	@GetMapping(path= {"/toPubRegist"})
//	public String toPubRegist(Model model) {
//		
//		List<PublisherVO> publishers = adminService.showPublisher();
//		model.addAttribute("publishers", publishers);
//		
//		return "admin/pub-regist";
//	}
	
	// 출판사 등록 페이지로 이동
	@GetMapping(path= {"/toPubRegist"})
	public String toPubRegist(@RequestParam(defaultValue = "1")int pageNo, 
							  @RequestParam(required = false)String searchKey, HttpServletRequest req, Model model) {
		
		int pageSize = 10;
		int pagerSize = 3;
		int beginning = (pageNo -1) * pageSize +1;
		int pubCount = adminService.findPubCount();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("beginning", beginning);
		params.put("end", beginning + pageSize);
		params.put("searchKey", searchKey);
		
//		if(searchKey == null) model.addAttribute("publishers", adminService.showPubListWithPaging(params));
//		else {
//			params.put("searchKey", searchKey);
//			model.addAttribute("publishers", adminService.showPubListWithPaging(params));
//		}
		
		List<PublisherVO> publishers = adminService.showPubListWithPaging(params);
		
		model.addAttribute("publishers", publishers);
		
		ThePager2 pager = new ThePager2(pubCount, pageNo, pageSize, pagerSize, "toPubRegist", req.getQueryString());
		
		model.addAttribute("pager", pager);
		
		return "admin/pub-regist";
	}

	// 출판사 등록
	@PostMapping(path= {"/pubRegist"})
//	@ResponseBody
	public String pubRegist(PublisherVO publisher) {
		
		adminService.pubRegist(publisher);
		
		return "redirect:/admin/toPubRegist";
	}
	
	// 출판사 리스트 리로드
//	@GetMapping(path= {"/showPub"})
//	public String ShowPub(Model model) {
//		
//		List<PublisherVO> publishers = adminService.showPublisher();
//		model.addAttribute("publishers", publishers);
//		
//		return "admin/pub-list";
//	}
	
	// 출판사 삭제
	@GetMapping(path= {"/deletePub"})
	public String deletePub(int pub_no, @RequestParam(defaultValue = "1")int pageNo, @RequestParam(required = false) String searchKey) {
		
		System.out.println(pub_no);
		
		adminService.deletePubNo(pub_no);
		
		String encodedKey = "";
		try {
			encodedKey = URLEncoder.encode(searchKey, "utf-8");
		} catch(Exception ex) {
		}
		
		return String.format("redirect:toPubRegist?pageNo=%d&searchKey=%s" , pageNo, encodedKey);
	}
	
	// 책 수정 페이지로 이동
	@GetMapping(path= {"editBook"})
	public String editBook(int book_no, BookInfoVO bookinfo, BookImgVO bookImg, Model model) {
		
		BookInfoVO book = adminService.showBookInfo(book_no);
		List<BookImgVO> bookImgs = adminService.showBookImg(book_no);
		List<CategoryVO> categorys = adminService.showCategory();
		List<PublisherVO> publishers = adminService.showPublisher();
		
		model.addAttribute("book", book);
		model.addAttribute("bookImgs", bookImgs);
		model.addAttribute("categorys", categorys);
		model.addAttribute("publishers", publishers);
		
		return "admin/book-edit";
	}
	
	// 책 수정 실행
	@PostMapping(path= {"editBook"})
	public String editBook(BookInfoVO bookinfo, @RequestParam("bookImg") MultipartFile[] files, HttpServletRequest req, RedirectAttributes attr) {
		
		ArrayList<BookImgVO> BookImgs = new ArrayList<BookImgVO>();
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/file/bookImg");
		
		for (MultipartFile file : files) {
			
			BookImgVO bookImg = new BookImgVO();
			
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
			
			try {
				File f = new File(path, fileName);
				if (f.exists()) {
					f.delete();
				}
				file.transferTo( f ); //파일 저장
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			bookImg.setImg(fileName);
			BookImgs.add(bookImg);
			
		}
		
		bookinfo.setIntro(bookinfo.getIntro().replace("\r\n","<br>"));
		bookinfo.setContents(bookinfo.getContents().replace("\r\n",  "<br>"));

		adminService.editBook(bookinfo, BookImgs);
		
		return "redirect:/book/list.action";
	}
	
	@GetMapping(path= {"deleteBook"})
	public String deleteBook(int book_no) {
		
		adminService.deleteBookByBookNo(book_no);
		
		return "redirect:/book/list.action";
	}
	
	// 이벤트 페이지
	@GetMapping("/eventBoard.action")
	public String showEvent(Model model) {
		model.addAttribute("eventList", adminService.showEventList());
		
		return "admin/event-board";
	}

	// 이벤트 등록
	@GetMapping("/eventBoard-write.action")
	public String writeEvent() {
		return "admin/event-board-write";
	}
	
	// 이벤트 등록
	@PostMapping(path= {"/eventBoard-write.action"})
	public String eventRegister(EventBoardVO event, @RequestParam("eventImg") MultipartFile file, HttpServletRequest req) {
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/file/eventImg");

		String fileName = file.getOriginalFilename();
			
			try {
				File f = new File(path, fileName);
				if (f.exists()) {
					f.delete();
				}
				file.transferTo( f ); //파일 저장
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
		event.setImg(fileName);
		event.setContent(event.getContent().replace("\r\n", "<br>"));
		adminService.writeEvent(event);
		
		return "redirect:/admin/eventBoard.action";
	}
	
	@GetMapping("/eventBoard-detail.action")
	public String showEventDetail(int no, Model model) {
		EventBoardVO event = adminService.showEventByNo(no);
		if (event == null) return "redirect:/admin/eventBoard.action";
		
		model.addAttribute("event", event);
		return "admin/event-board-detail";
	}
	
	@GetMapping("/eventBoard-update.action")
	public String eventUpdate(int no, Model model) {
		model.addAttribute("event", adminService.showEventByNo(no));
		
		return "admin/event-board-update";
	}
	
	@PostMapping(path= {"/eventBoard-update.action"})
	public String eventUpdate(EventBoardVO event, @RequestParam("eventImg") MultipartFile file, HttpServletRequest req) {
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/file/eventImg");

		String fileName = file.getOriginalFilename();
			
			try {
				File f = new File(path, fileName);
				if (f.exists()) {
					f.delete();
				}
				file.transferTo( f ); //파일 저장
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
		event.setImg(fileName);
		event.setContent(event.getContent().replace("\r\n", "<br>"));
		adminService.updateEventByNo(event);
		
		return "redirect:/admin/eventBoard.action";
	}
	
	@PostMapping("/eventBoard-delete.action")
	public String eventDelete(int no) {
		adminService.deleteEventByNo(no);
		
		return "redirect:/admin/eventBoard.action";
	}
	
	@PostMapping("/eventActive.action")
	@ResponseBody
	public String eventBannerActive(int no, boolean active) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("no", no);
		params.put("active", active);
		
		adminService.updateActiveByNo(params);
		
		return "success";
	}
}
