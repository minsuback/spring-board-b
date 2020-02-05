package com.springboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springboard.service.ReplyService;
import com.springboard.vo.ReplyVO;

//@RestController		// @Controller + 모든 요청 메소드에 @ResponseBody를 추가함
@Controller
@RequestMapping( path = {"/reply"} )
public class ReplyController {

	@Autowired
	@Qualifier("replyService")
	private ReplyService replyService;
	
	@PostMapping("/write")
	@ResponseBody
	public String write(ReplyVO reply, String action ) {
		
		// reply.getRno() 가 이때는 0
		if( action.equals("reply")) {
			// reply.getRno() : 이때는 0이 호출됨
			replyService.writeReply(reply);
			// reply.getRno() : replyService가 실행된 후에는 새로 등록된 reply 번호가 호출됨
		} else if(action.equals("re-reply")) {
			replyService.writeReReply(reply);
		}
		// reply.getRno() 가 이때는 새로 등록된 reply 번호
		
		return "success"+ " : " + reply.getRno();
	}
	
	@GetMapping(path= {"/list-by/{bno}"})
	public String replyByBno(@PathVariable int bno, Model model) {
		
		List<ReplyVO> replies = replyService.getReplyListByBno(bno);
		
		model.addAttribute("replies", replies);
		
		return "/board/reply-list";
	}
	
	@DeleteMapping(path = {"/delete/{rno}"})	// "/delete/{ rno } : rno는 ajax가 보낸 데이터임 이름 일치해야함
	@ResponseBody
	public String delete(@PathVariable int rno) {
		// @PathVariable : ajax에서 경로로 데이터를 보내기때문에 이를 받기위한 기능(어노테이션)
		
		replyService.deleteReply(rno);
		
		return "success";
		
	}
	
	@PutMapping(path = {"/update" }, consumes= "application/json")
	@ResponseBody
	public String update(@RequestBody ReplyVO reply) {		// @RequesdtBody : 요청 본문을 직접 읽어서 객체 매핑
		
		replyService.updateReply(reply);
		
		return "success";
	}
	
}
