package com.sboot.toworld.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class toWorldController {
   
   
   
	
	//(p)userLogin.jsp - babo/ondal - result.jsp - 포트번호링크
	//		- (c)@RequestMapping("/") - @RequestMapping("/getallinfo")
	@RequestMapping("/")
	public String connect() {
	//p의 controller2 loginvo로 가서 회원정보 가져옴
		
		
		return "translation";
	}			//회원정보를 갖고 @RequestMapping("/getallinfo")로 이동

  
   
}