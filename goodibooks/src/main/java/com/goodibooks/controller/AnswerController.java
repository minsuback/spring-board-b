package com.goodibooks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodibooks.service.AnswerService;
import com.goodibooks.vo.AnswerVO;
import com.goodibooks.vo.QnAVO;

@Controller
@RequestMapping(path= {"/board/"})
public class AnswerController {
	
	@Autowired
	@Qualifier("answerService")
	private AnswerService answerService;
	
	@PostMapping("/answerwrite")
	@ResponseBody
	public String reply(AnswerVO answer, QnAVO qna, String action, RedirectAttributes attr) {
		
		int newAnswerNo = answerService.answerWriteBoard(answer);
		
		answerService.updateAnsCheck(qna);
		
		attr.addFlashAttribute("newAnsNo", newAnswerNo);
		
		return "success";
	}
	
//	@GetMapping(path= {"/reviewContent/{no}"})
//	public String ReviewContent(@PathVariable int no, Model model) {
//		
//		List<AnswerVO> answers = answerService.getAnswerListByAnsNo(no);
//		model.addAttribute("answers", answers);
//		
//		return "/board/askdetail";
//	}

}
