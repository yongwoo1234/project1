package com.sboot.toworld.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sboot.toworld.dao.TogetherDAO;
import com.sboot.toworld.dao.TogetherReplyDAO;
import com.sboot.toworld.vo.PageMaker;
import com.sboot.toworld.vo.SearchCriteria;
import com.sboot.toworld.vo.TogetherReplyVO;
import com.sboot.toworld.vo.TogetherVO;


@Controller
public class toWorldControllerTogether {
	
	@Autowired
	TogetherDAO tdao;
	
	@Autowired
	TogetherReplyDAO trdao;
		
	
	@RequestMapping("/together")
	public String together(Model model) {
		model.addAttribute("getTogether", tdao.getTogether());
		
		return "together/together";
	}
	

	@RequestMapping("/insertTogetherForm")
	public String insertTogetherForm() {
		return "together/insertTogetherForm";
	}

	@RequestMapping("/insertTogether")
	public String insertTogether(@RequestParam("title") String title, @RequestParam("context") String context,
			HttpServletRequest request,
			@RequestParam MultipartFile[] uploadReplyImg,
			RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sid");
		Date ddate = new Date(0, 0, 0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String str = sdf.format(ddate);

		String url = null;
		String filename = null;
		
		
		
		for(MultipartFile file: uploadReplyImg) {
			if(!file.isEmpty()) {
				
				TogetherVO tvo = new TogetherVO(title, id, ddate, UUID.randomUUID().toString()+"_"+file.getOriginalFilename(), url, 0, 0, context); 
					
				File newFileName = new File(tvo.getFileName());
				
				file.transferTo(newFileName);
				
				String realPath = newFileName.getCanonicalPath();
                
				filename = tvo.getFileName();
				
				url = realPath + filename;
				
			}
		}
		
		tdao.insertTogether(title, id, str, filename, url, 0, 0, context);
		return "redirect:list";
	}

	//상세 게시물 페이지
	@RequestMapping("/whoTogether")
	public String whoTogether(TogetherVO tvo,HttpServletRequest req, Model model1, TogetherReplyVO trvo) {
		
		tvo = tdao.whoTogether(Integer.parseInt(req.getParameter("serial")));
		model1.addAttribute("serial", tvo.getSerial());
		model1.addAttribute("title", tvo.getTitle());
		model1.addAttribute("context", tvo.getContext());
		model1.addAttribute("fileName", tvo.getFileName());
		model1.addAttribute("commentcnt", tvo.getCommentcnt());
		model1.addAttribute("id", tvo.getId());
	
		tdao.plusCnt(Integer.parseInt(req.getParameter("serial")));
		
		//trvo = trdao.updateReply1(Integer.parseInt(req.getParameter("rno")));
		model1.addAttribute("rno", trvo.getRno());
		
		////////////댓글보기
		model1.addAttribute("replyList", trdao.readReply(tvo.getSerial()));

		return "together/viewTogether";

	}
	
	
	//게시글 수정
	@RequestMapping(value = "/updateTogetherForm", method = RequestMethod.GET)
	public String updateTogetherForm(HttpServletRequest req, Model model1) {
		TogetherVO tvo = tdao.whoTogether(Integer.parseInt(req.getParameter("serial")));
		model1.addAttribute("serial", tvo.getSerial());
		model1.addAttribute("title", tvo.getTitle());		
		model1.addAttribute("context", tvo.getContext());

		return "together/updateForm";
	}

	//게시글 수정
	@RequestMapping(value = "/updateTogether", method = RequestMethod.POST)
	public String updateTogether(HttpServletRequest req, RedirectAttributes rttr, TogetherVO tvo) {
		
		rttr.addAttribute("serial", tvo.getSerial());
		
		int serial = Integer.parseInt(req.getParameter("serial"));
		tdao.updateTogether(serial, req.getParameter("title"), req.getParameter("context"));
		
		return "redirect:whoTogether";
	}

	
	//게시글 삭제
	@RequestMapping("/deleteTogether")
	public String deleteTogether(HttpServletRequest req) {
		tdao.deleteTogether(Integer.parseInt(req.getParameter("serial")));
		return "redirect:list";
	}
	
	
	///////////////////////////페이징////////////////////////////////
	// 게시물 목록 + 페이징 추가

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		model.addAttribute("list", tdao.listPage(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(tdao.count(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "together/together";
		
	}

	
 //상품 소감(댓글) 목록
    @ResponseBody
    @RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
    public List<TogetherReplyVO> getReplyList(@RequestParam("n") int serial, Model model) throws Exception {
       	
	    List<TogetherReplyVO> reply = trdao.readReply(serial);
	    System.out.println(reply);     
	    
	    return reply;
    
    } 
		
		
    
 // 상품 소감(댓글) 작성
    @ResponseBody
    @RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
    public void registReply(TogetherReplyVO reply, HttpSession session, HttpServletRequest request,
    		int serial, String repCon) throws Exception {
    	
		    String id = (String)session.getAttribute("sid");   
		    tdao.increaseReply(serial);
		    trdao.insertReply(serial, repCon, id);
		    
    	}
    
  
// 댓글 삭제
 // 상품 소감(댓글) 삭제
    @ResponseBody
    @RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
    public int getReplyList(TogetherReplyVO trvo, HttpSession session, int rno, int serial) throws Exception {
     
	     int result = 0; 
	     String id = (String)session.getAttribute("sid");
	     String replyId = trdao.replyUserIdCheck(rno);
	       
	     if(id.equals(replyId)) {
	      trdao.deleteReply(rno, id);
	      tdao.decreaseReply(serial);
	      result = 1;
	     }
	     
	     return result; 
    }
    

 // 상품 소감(댓글) 수정
    @ResponseBody
    @RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
    public int modifyReply(TogetherReplyVO reply, HttpSession session, int rno,
    		String content) throws Exception {
    
    		
    	String id = (String) session.getAttribute("sid");
    	String userId = trdao.replyUserIdCheck(rno);
	    int result = 0;
	     
	    if(id.equals(userId)) {
	    	trdao.updateReply(rno, content, id);
	    	result = 1;
	     }
	     
	     return result;
    } 
    
}

