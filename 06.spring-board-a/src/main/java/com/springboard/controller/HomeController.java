package com.springboard.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller		// @Component + spring MVC 기능 추가 
public class HomeController {
	
	// @RequestMapping : 요청과 메서드를 매핑 
	@RequestMapping(path = { "/" } , method = RequestMethod.GET)
	// path 경로로 요청이 들어오면 home 메소드를 실행시킨다
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";		// viewName -> /WEB-INF/views/ + home + .jsp
	}
	
}
