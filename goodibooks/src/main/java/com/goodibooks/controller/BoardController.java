package com.goodibooks.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodibooks.service.BoardService;
import com.goodibooks.vo.BoardVO;

@Controller
@RequestMapping(path= {"/board/"})
public class BoardController {
	
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

	@GetMapping(path= {"/notice.action"})
	public String toNotice(Model model) {
		List<BoardVO> boards = boardService.findNotice();
		
		model.addAttribute("boards", boards);
		
		return "board/notice";
	}
	@GetMapping(path = { "/write.action" })
	public String noticeWriteForm() {
		return "board/write";
	}
	
	@PostMapping(path = { "/write.action" })
	public String writeNotice(BoardVO board, RedirectAttributes attr) {
		int newNoticeNo = boardService.writeNotice(board);
		
		
		return "redirect:notice.action";
	}
	@GetMapping(path = { "/detail.action" })
	public String showDatail(int no, Model model) {
		
		BoardVO board = boardService.findNoticeByNo(no);
		if (board == null) {
			return "redirect:notice.action";
		}
		model.addAttribute("board", board);
		return "board/detail";
	}
	@GetMapping(path = { "/delete2.action" })
	public String deleteNotice(int no) {
		boardService.deleteNotice(no);
		
		return "redirect:notice.action";
	}
	@GetMapping(path = { "/update.action" })
		public String showUpdateForm(int no, Model model) {
		
		BoardVO board = boardService.findNoticeByNo(no);
		if (board == null) {
			return "redirect:notice.action";
		}
		model.addAttribute("board", board);
		return "board/update";
	}
	@PostMapping(path = { "/update.action" })
	public String update(BoardVO board, int no) {
		boardService.updateNotice(board);
		return String.format(
				"redirect:detail.action?no=%d", no);
	}
	
}
