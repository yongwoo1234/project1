package com.sboot.toworld.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sboot.toworld.dao.ReviewDAO;
import com.sboot.toworld.dao.ReviewReplyDAO;
import com.sboot.toworld.vo.Criteria;
import com.sboot.toworld.vo.ReviewReplyVO;
import com.sboot.toworld.vo.ReviewVO;
import com.sboot.toworld.vo.TogetherReplyVO;
import com.sboot.toworld.vo.TogetherVO;

//상세페이지 Controller

@Controller
public class toWorldControllerDetail {

   @Autowired
   ReviewDAO rdao;
   
   @Autowired
   ReviewReplyDAO rrdao;
   
   // 상세 페이지 ==========================================================
   
      @RequestMapping("/toCountry")
      public String toCountry(ReviewVO rvo, HttpServletRequest req) {
         
         String country = req.getParameter("country");
         
        if (country.equals("France")) {
           return "redirect:France";
        
        }if (country.equals("Switzer")) {
           return "redirect:Switzer";
        
        }if (country.equals("Canada")) {
           return "redirect:Canada";
        
        }if (country.equals("Thailand")) {
           return "redirect:Thailand";
        
        }if (country.equals("Hongkong")) {
           return "redirect:Hongkong";
        
        }if (country.equals("USA")) {
           return "redirect:USA";
        
        }if (country.equals("Korea")) {
           return "redirect:Korea";
        
        }if (country.equals("Spain")) {
           return "redirect:Spain";
        
        }if (country.equals("Italy")) {
           return "redirect:Italy";
        
        }if (country.equals("Portugal")) {
           return "redirect:Portugal";
        
        }if (country.equals("Japan")) {
           return "redirect:Japan";
        
        }else{
           return"redirect:Croatia";
        }
         
      }
   
      @RequestMapping("/France")
      public String France(Model model) {
            String country = "France";
            model.addAttribute("reviewCountry", rdao.getReview(country));
            return "country/France";
         }
      
      @RequestMapping("/Switzer")
      public String Switzer(Model model) {
        String country = "Switzer";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Switzer";
      }
      
      @RequestMapping("/Canada")
      public String Canada(Model model) {
         String country = "Canada";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Canada";
      }
      
      @RequestMapping("/Thailand")
      public String Thailand(Model model) {
         String country = "Thailand";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Thailand";
      }
      
      @RequestMapping("/Croatia")
      public String Croatia(Model model) {
         String country = "Croatia";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Croatia";
      }
      
      @RequestMapping("/Hongkong")
      public String Hongkong(Model model) {
         String country = "Hongkong";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Hongkong";
      }
      
      @RequestMapping("/Japan")
      public String Japan(Model model) {
         String country = "Japan";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Japan";
      }
      
      @RequestMapping("/USA")
      public String USA(Model model) {
         String country = "USA";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/USA";
      }
      
      @RequestMapping("/Portugal")
      public String Portugal(Model model) {
         String country = "Portugal";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Portugal";
      }
      
      @RequestMapping("/Italy")
      public String Italy(Model model) {
         String country = "Italy";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Italy";
      }
      
      @RequestMapping("/Spain")
      public String Spain(Model model) {
         String country = "Spain";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Spain";
      }
      
      @RequestMapping("/Korea")
      public String Korea(Model model) {
         String country = "Korea";
         model.addAttribute("reviewCountry", rdao.getReview(country));
         return "country/Korea";
      }
      
// 리뷰 =============================
      
      //리뷰 수정
      @GetMapping("/updateReview") 
      public String updateReview(@RequestParam("fileName") String fileName, Model model) {
         //ReviewVO 객체에 filename에 해당하는 리뷰의 vo를 넣은 후
    	 //model을 통해 updateReview로 전송
         ReviewVO rvo = rdao.getReview2(fileName);
         model.addAttribute("fileName", rvo.getFileName());
         model.addAttribute("title", rvo.getTitle());
         model.addAttribute("contents", rvo.getContents());
         model.addAttribute("country", rvo.getCountry());
         
         return "country/updateReview";
      }
      
      @PostMapping("/updateReview")
      public String updateReviewForm(@RequestParam("fileName") String fileName, 
                              HttpServletRequest req, RedirectAttributes rttr,
                              @RequestParam("country")String country) {
         //실제 리뷰 수정 작업
         rdao.updateReview(req.getParameter("title"), req.getParameter("contents"), fileName);
         rttr.addAttribute("country", country);
                 
         return "redirect:toCountry";
      }
      
      //리뷰 삭제
      @RequestMapping("/deleteReview")
      public String deleteReview(@RequestParam("fileName") String fileName,
                           @RequestParam("country")String country, RedirectAttributes rttr) {
         rdao.deleteReview(fileName);
         rttr.addAttribute("country", country);
         return "redirect:toCountry";
      }
      
      //상세 게시글 조회
      @RequestMapping("/reviewCountryDetail")
      public String reviewCountryDetail(Model model,
                                @RequestParam("fileName") String fileName,
                                HttpSession session, 
                                @RequestParam("serial") int serial,
                                HttpServletRequest req, RedirectAttributes rttr) {
         //조회수 증가
         rdao.plusCount(fileName);
         
         String sesid = (String)session.getAttribute("sid");
         ReviewVO rvo = rdao.getReview2(fileName);
         serial = Integer.parseInt(req.getParameter("serial"));
         
         
         if(sesid.equals(rvo.getId())) {
            rttr.addAttribute("fileName", fileName);
            rttr.addAttribute("serial", serial);
            
            return "redirect:toReviewCountryDetail";
         
         }else {
            
            rttr.addAttribute("fileName", fileName);
            rttr.addAttribute("serial", serial);
            
            return "redirect:reviewComment";
         }
      }
      
      @RequestMapping("/toReviewCountryDetail")
      public String toReviewCountryDetail(Model model, HttpServletRequest req, ReviewReplyVO rrvo) {
         
         int serial = Integer.parseInt(req.getParameter("serial"));
         String fileName = req.getParameter("fileName");
         
         model.addAttribute("serial", serial);
         model.addAttribute("rp_no", rrvo.getRp_no());
         model.addAttribute("comment", rrvo.getRvwcomment());
         model.addAttribute("id", rrvo.getRvwid());
         model.addAttribute("datetime", rrvo.getDatetime());
         
             
         model.addAttribute("getComments", rrdao.getComment(serial));
         
         model.addAttribute("reviewCountryDetail", rdao.getReviewDetail(fileName));
         
         return "country/reviewCountryDetail";
   }
      
      @RequestMapping("/reviewFrance")
      public String reviewFrance() {
            return "country/reviewFrance";
      }
     
      @RequestMapping("/reviewSwitzer")
      public String reviewSwitzer() {
         return "country/reviewSwitzer";
      }
      
      @RequestMapping("/reviewCanada")
      public String reviewCanada() {
         return "country/reviewCanada";
      }
      
      @RequestMapping("/reviewThailand")
      public String reviewThailand() {
         return "country/reviewThailand";
      }
      
      @RequestMapping("/reviewCroatia")
      public String reviewCroatia() {
         return "country/reviewCroatia";
      }
      
      @RequestMapping("/reviewHongkong")
      public String reviewHongkong() {
         return "country/reviewHongkong";
      }
      
      @RequestMapping("/reviewJapan")
      public String reviewJapan() {
         return "country/reviewJapan";
      }
      
      @RequestMapping("/reviewUSA")
      public String reviewUSA() {
         return "country/reviewUSA";
      }
      
      @RequestMapping("/reviewPortugal")
      public String reviewPortugal() {
         return "country/reviewPortugal";
      }
      
      @RequestMapping("/reviewItaly")
      public String reviewItaly() {
         return "country/reviewItaly";
      }
      
      @RequestMapping("/reviewSpain")
      public String reviewSpain() {
         return "country/reviewSpain";
      }
      
      @RequestMapping("/reviewKorea")
      public String reviewKorea() {
         return "country/reviewKorea";
      }
     
         @PostMapping("/sendFranceReview")
         public String sendFranceReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "France";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                   
                   //실제 파일의 경로
                   String realPath = newFileName.getCanonicalPath();
                   
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             
             model.addAttribute("files", list);
             
            
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            
             
            return "country/toFrance";
         }
         
         @PostMapping("/sendSwitzerReview")
         public String sendSwitzerReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Switzer";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toSwitzer";
         }
         
         @PostMapping("/sendCanadaReview")
         public String sendCanadaReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Canada";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toCanada";
         }
     
         @PostMapping("/sendThailandReview")
         public String sendThailandReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Thailand";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toThailand";
         }
         
         @PostMapping("/sendCroatiaReview")
         public String sendCroatiaReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Croatia";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toCroatia";
         }
         
         @PostMapping("/sendHongkongReview")
         public String sendHongkongReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Hongkong";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toHongkong";
         }
         
         @PostMapping("/sendJapanReview")
         public String sendJapanReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Japan";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toJapan";
         }
         
         @PostMapping("/sendUSAReview")
         public String sendUSAReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "USA";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toUSA";
         }
         
         @PostMapping("/sendPortugalReview")
         public String sendPortugalReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Portugal";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toPortugal";
         }  
         
         @PostMapping("/sendItalyReview")
         public String sendItalyReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Italy";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toItaly";
         }  
         
         @PostMapping("/sendSpainReview")
         public String sendSpainReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Spain";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toSpain";
         }  
         
         @PostMapping("/sendKoreaReview")
         public String sendKoreaReview(@RequestParam("title") String title,
                                @RequestParam("contents") String contents,
                                @RequestParam MultipartFile[] uploadfile,
                                HttpSession session,
                                HttpServletRequest request,
                                Model model) throws Exception {
            
             String url = null;
             String fileNa = null;
             String sesid = (String)session.getAttribute("sid");
             String country = "Korea";
             int viewcnt = 0;
             int serial = 0;
             
             Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
             
             List<ReviewVO> list = new ArrayList<>();
             
             for(MultipartFile file : uploadfile) {
                if(!file.isEmpty()) {
                   //UUID를 이용해 unique한 이름을 생성
                   ReviewVO rvo = new ReviewVO(serial, country ,sesid, contents, title, formeddate, UUID.randomUUID().toString(),
                         file.getOriginalFilename(),
                         file.getContentType(), url, viewcnt);
                   
                   list.add(rvo);
                   
                   File newFileName = new File(rvo.getUuid()+"_"+rvo.getFileName());
                   //전달된 내용을 실제 물리적인 파일로 저장
                   
                   file.transferTo(newFileName);
                  
                   String realPath = newFileName.getCanonicalPath();
                   
                   fileNa = rvo.getUuid()+"_"+rvo.getFileName();
                   url = realPath + fileNa;
                }
             }
             model.addAttribute("files", list);
             rdao.insertReview(serial, country, sesid, title, contents, formeddate, fileNa, url, viewcnt);
            return "country/toKorea";
         }  

// 댓글 ==========================================================================================
         
         @RequestMapping("/reviewComment")
         public String reviewComment(Model model, HttpServletRequest req, ReviewReplyVO rrvo, 
       		  HttpSession session) throws Exception {
       	  
       	  //rp_no = Integer.parseInt(req.getParameter("rp_no"));
       	  int serial = Integer.parseInt(req.getParameter("serial"));
       	  String fileName = req.getParameter("fileName");
       	  String sesid = (String)session.getAttribute("sid");
       	  //String rvwcomment = req.getParameter("rvwcomment");
       	  
       	  model.addAttribute("serial", serial);
       	  model.addAttribute("sesid", sesid);
       	  //model.addAttribute("rvwcomment", rvwcomment);
       	  
       	  //model.addAttribute("commentId", rrdao.replyUserIdCheck(rp_no)); 
       	  model.addAttribute("getComments", rrdao.getComment(serial));
       	  model.addAttribute("reviewCountryDetail", rdao.getReviewDetail(fileName));
       	  // model.addAttribute("commentId", rrdao.getCommentId(rvwcomment));
       	  
       	  
       	  return "country/reviewComment";
         }
         
         @RequestMapping(value = "/insertComment", method = RequestMethod.POST)
         public String insertComment(Model model, HttpSession session,
                              @RequestParam("rvwcomment")String rvwcomment,
                              HttpServletRequest req,
                              @RequestParam("serial") int serial,
                              @RequestParam("fileName") String fileName,
                              RedirectAttributes rttr
                              
                              ) {
            
            
            String sesid = (String)session.getAttribute("sid");
            int rp_no = 0;
            serial = Integer.parseInt(req.getParameter("serial"));
            Date datetime = new Date(0, 0, 0);
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             String formeddate = sdf.format(datetime);
            
            rrdao.insertComment(serial, rp_no, sesid, rvwcomment, formeddate, fileName);
            
             rttr.addAttribute("fileName", fileName);
             rttr.addAttribute("serial", serial);
             //rttr.addAttribute("rvwcomment", rvwcomment);
             
             ReviewVO rvo = rdao.getReview2(fileName);
             
            if(sesid.equals(rvo.getId())) {
               return "redirect:toReviewCountryDetail";
            }else {
               return "redirect:reviewComment";
            }
              
         }
         
         @ResponseBody
         @RequestMapping(value = "/view/replyList2", method = RequestMethod.GET)
         public List<ReviewReplyVO> getReplyList(@RequestParam("n") int serial, Model model) throws Exception {
            List<ReviewReplyVO> reply = rrdao.getComment(serial);
            System.out.println(reply); 
            return reply;
         }
         
         @ResponseBody
         @RequestMapping(value = "/view/deleteReply2", method = RequestMethod.POST)
         public int getReplyList(ReviewReplyVO rrvo, HttpSession session, int rp_no, ReviewVO rvo) throws Exception {
             int result = 0;
             String sesid = (String)session.getAttribute("sid");
             String CommentId = rrdao.replyUserIdCheck(rp_no);
             if(sesid.equals(CommentId)) {
              rrdao.deleteComment(rp_no);
              result = 1;
             }
             return result; 
         }
         
         @ResponseBody
         @RequestMapping(value = "/view/modifyReply2", method = RequestMethod.POST)
         public int modifyReply(ReviewReplyVO reply, HttpSession session, int rp_no, String rvwcomment2) throws Exception {
            String id = (String) session.getAttribute("sid");
            String userId = rrdao.replyUserIdCheck(rp_no);
            int result = 0;
            if(id.equals(userId)) {
               rrdao.updateComment(rvwcomment2, rp_no);
               result = 1;
             }
             return result;
         } 
         
}
