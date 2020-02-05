package com.example.springmvc;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.springboard.service.BoardService;
import com.springboard.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
									"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"} )
@Log4j	// log4j 변수를 자동으로 만드러주는 annotaion ( 변수이름은 log )
public class DemoTest2 {

	// Controller , Service , Dao or MApper - 테스트코드 작성
	
	private MockMvc mockMvc; 	// 브라우저를 대신하는 모형
	
	@Autowired
	private WebApplicationContext ctx;
	
	@Before					// @Test로 지정된 메서드를 호출하기 전에 실행
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testOne() throws Exception {

		mockMvc.perform(post
					("/account/login.action").param("email","minsuback@naver.com").param("passwd", "123"))
					.andExpect(status().is3xxRedirection()).andDo(print());
		
	}
	
}
