package com.sboot.toworld.controller;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sboot.toworld.dao.MemberDAO;
import com.sboot.toworld.dao.ReviewDAO;
import com.sboot.toworld.dao.TogetherDAO;

@Controller
public class toWorldController {
   
   @Autowired
   MemberDAO mdao;
   
   @Autowired
   TogetherDAO tdao;
   
   @Autowired
   ReviewDAO rdao;
   
   
   // 페이지 구성 ============================================
   
   //메인 페이지로 이동
   @RequestMapping("/")
   public String GoHome() {
      return "home";
   }
   
   @RequestMapping("/home")
   public String GoHome2(HttpSession session) {
      session.getAttribute("sid");
      return "home";
   }
   
   
   
   @RequestMapping("/map")
      public String map() {
         return "map";
      }
   
   
   
   //로그인 =====================================
   
   //로그인 폼으로 이동
   @RequestMapping("/login")
   public String GoLogin() {
      return "loginForm";
   }
   
   //로그인 실패 시 
   @GetMapping("/loginFail")
   public String fail() throws IOException{
      return "/loginFail";
   }
   
   //시큐리티 부분=================================================================
   //로그인 성공 시
   @RequestMapping("/loginSuccess")
   public String loginSucess(HttpSession session, HttpServletRequest request, Principal principal) {
      
      session.setAttribute("sid", principal.getName());
      
      
      return "loginSuccess";
   }
//      
//     
//   
   

 //번역 ===============================
   //번역기로 이동
   @RequestMapping("/translation")
   public String translation() {
      return "/translation";
   }
  
   
}