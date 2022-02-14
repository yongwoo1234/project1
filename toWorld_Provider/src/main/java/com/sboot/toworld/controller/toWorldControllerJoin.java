package com.sboot.toworld.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sboot.toworld.dao.MemberDAO;

@Controller
@RequestMapping("/join")
public class toWorldControllerJoin {
	
	
		//memberDAO를 사용 가능하게 함
		@Autowired
		MemberDAO mdao;
	
		@GetMapping()
		public String GoJoin() {
			return "join/joinForm";
		}
		
		//회원가입 프로세스
		@PostMapping("/joinProcess")
		public String DoLogin(@RequestParam("username") String userid, 
							  @RequestParam("password") String userpw, 
							  @RequestParam("name") String username, 
							  @RequestParam("birthdate") String birthdate,
							  @RequestParam("tel") String tel,
							  HttpServletRequest request) {
			//입력한 패스워드를 암호화
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String rawPassword = userpw;
			String encodedPassword = encoder.encode(rawPassword);
				
			//만약 회원가입 폼에서 입력한 아이디가 없으면
			if(mdao.getMember(userid) == null) {
				//회원 추가
		        mdao.insertMember(userid, encodedPassword, username, birthdate, tel, 1);
		            
		        return "join/joinSuccess";
		    }else {//입력한 아이디가 존재하면
		        return "join/joinconfirm";  
		    }
		}

		//회원가입 실패 시 이동
		@RequestMapping("/joinfail")
		public String joinfail() {
			return "join/joinfail";
		}
	
		//아이디 중복 확인
		@ResponseBody
		@RequestMapping(value="/joinCheck", method=RequestMethod.POST)
	    public int joinCheck(String id) {
	      
		      int flag = 0;
		      
		      //만약 아이디가 없으면 flag를 1로
		      if(mdao.checkId(id) == null) {
		         flag = 1;
		      }else
		         flag = 0;
		      
		      return flag;
		}
	
	
}
