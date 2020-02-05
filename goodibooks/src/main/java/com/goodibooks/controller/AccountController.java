package com.goodibooks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodibooks.service.CartService;
import com.goodibooks.service.MemberService;
import com.goodibooks.vo.MemberVO;

@Controller
@RequestMapping(path = {"/account/"})
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("cartService")
	private CartService cartService;
	
	// 회원가입 페이지 이동
	@GetMapping(path = {"/register.action"})
	public String toRegister() {
		
		return "account/register";
	}
	
	// 회원가입 처리
	@PostMapping(path = {"/register.action"})
	public String register(MemberVO member, RedirectAttributes attr) {
		
		memberService.registerMember(member);
		
		// 회원가입 완료 Alert를 위한 변수
		attr.addFlashAttribute("newId", member.getId());
		
		return "redirect:login.action";
	}
	
	// 로그인 페이지 이동
	@GetMapping(path = {"/login.action"})
	public String toLogin() {
				
			return "account/login";
	}
	
	@PostMapping(path = {"/login.action"})
	public String login(MemberVO member, HttpSession session, Model model, RedirectAttributes attr) {

		MemberVO member2 = memberService.findMemberByIdAndPasswd(member);
		if (member2 == null) {
			attr.addFlashAttribute("loginFalse", member);
			return "redirect:/account/login.action";
		} else {
			// 로그인 처리
			session.setAttribute("loginuser", member2);
			session.setAttribute("cartlist", cartService.showCartListByMemberId(member2.getId()));
			model.addAttribute("member", member2);
			//attr.addFlashAttribute("login", member2.getId());

			return "redirect:/";
		}
	}
	
	// 회원 PW 확인 페이지 이동
	@GetMapping(path= {"/checkpw.action"})
	public String toCheckpw() {

		return "/account/checkPw";
	}
	
//	@PostMapping(path= {"/checkpw.action"})
//	public String checkPw(MemberVO member, RedirectAttributes attr) {
//		
//		// 기존회원의 PW 확인
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("id", member.getId());
//		map.put("passwd", member.getPasswd());
//				
//		boolean result = memberService.chekPw(map);
//		        
//		if( result ) {	// PW 일치했을 때
//		
//			return "account/checkpw";
//			
//		} else {
//			attr.addFlashAttribute("checkFalse", member);
//			return "redirect:/account/checkPw.action";
//		}
//	}
	
	@PostMapping(path= {"/checkpw.action"})
	public String checkPw(MemberVO member, RedirectAttributes attr, Model model) {

//		MemberVO member2 = memberService.findMemberByIdAndPasswd(member);
//		
//		if (member2 != null) attr.addFlashAttribute("pwcheck", true);	
//		else attr.addFlashAttribute("pwcheck", false);

		if (memberService.findMemberByIdAndPasswd(member) != null) attr.addFlashAttribute("pwcheck", true);	
		else attr.addFlashAttribute("pwcheck", false);
		
//		MemberVO membervo = memberService.findMemberByIdAndPasswd(member);
//		
//		if(membervo != null ) {
//			attr.addFlashAttribute("pwcheck", true);
//		} else {
//			attr.addFlashAttribute("pwcheck", false);
//		}

		return "redirect:/mypage/mypage.action?id=" + member.getId();
	}
	
	// 회원정보 수정
	@PostMapping(path = {"/edit.action"})
	public String toEdit(MemberVO member, RedirectAttributes attr) {
		
//		// 기존회원의 PW 확인
//		Map<String, String> map = new HashMap<String, String>();
//        map.put("id", member.getId());
//        map.put("passwd", member.getPasswd());
		
//        boolean result = memberService.chekPw(map);
        
        memberService.updateMember(member);
		attr.addFlashAttribute("updateMember", member);
		
        
		return "redirect:/mypage/mypage.action";
		
//		if( result ) {	// PW 일치했을 때
//			
//			memberService.updateMember(member);
//			attr.addFlashAttribute("updateMember", member);
//		
//			return "/";
//			
//		} else { 		// PW 불일치 했을 때
//			
//			attr.addFlashAttribute("updateFalse", member);
//			
//			return "redirect:/mypage/mypage.action";
//		}
		
	}
	@GetMapping(path = {"/deleteMember.action"})
	public String deleteMember(MemberVO member) {
		
		
        memberService.deleteMember(member);
       
        
		return "redirect:/account/logout.action";
	}
	
	// 결제 페이지로 이동
	@GetMapping(path = {"/checkout.action"})
	public String toCheckout() {
		
		return "account/checkout";
	}
	
	// 로그아웃 실행 - ms
	@GetMapping(path = {"/logout.action"})
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		session.removeAttribute("cartlist");
		
		return "redirect:/";
	}
	
	// 아이디 중복체크
	@GetMapping("/checkId.action")
	@ResponseBody
	public String checkId(String id) {
		MemberVO member = memberService.findMemberById(id);
		if (member == null) return "success";
		else return "error";
	}
	
}
