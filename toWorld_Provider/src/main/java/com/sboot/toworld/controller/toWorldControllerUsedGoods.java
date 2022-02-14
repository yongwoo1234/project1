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

import com.sboot.toworld.dao.MemberDAO;
import com.sboot.toworld.dao.UsedGoodsDAO;
import com.sboot.toworld.vo.MemberVO;
import com.sboot.toworld.vo.PageMaker;
import com.sboot.toworld.vo.SearchCriteria;
import com.sboot.toworld.vo.TogetherReplyVO;
import com.sboot.toworld.vo.UsedGoodsVO;


@Controller
@RequestMapping("/usedGoods")
public class toWorldControllerUsedGoods {

	
	@Autowired
	UsedGoodsDAO udao;
		
	@Autowired
	MemberDAO mdao;
	
	
	@RequestMapping("/usedGoods")
	public String together(Model model) {
		model.addAttribute("getTogether", udao.getUsedGoods());
		
		
		return "UsedGoods/usedGoods";
	}
	

	
	
	

	@RequestMapping("/insertForm")
	public String insertTogetherForm() {
		return "UsedGoods/insertUsedGoodsForm";
	}

	@RequestMapping("/insert")
	public String insertTogether(@RequestParam("title") String title, @RequestParam("context") String context,
			@RequestParam("price") int price,@RequestParam("goodsName") String goodsName,
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
				
				UsedGoodsVO uvo = new UsedGoodsVO(title, id, goodsName, ddate, UUID.randomUUID().toString()+"_"+file.getOriginalFilename(), url, 0, price, context, 1); 
				
				
				
				File newFileName = new File(uvo.getFileName());
				
				file.transferTo(newFileName);
		//파일경로		
				String realPath = newFileName.getCanonicalPath();
                
				filename = uvo.getFileName();
				
				url = realPath + filename;
				
			}
		}
		
		udao.insertUsedGoods(title, id, goodsName, ddate, filename, url, 0, price, context, 1);
		return "redirect:/usedGoods/list";
	}
	
	
	

	//상세 게시물 페이지
	@RequestMapping("/detail")
	public String detailUsedGoods(UsedGoodsVO uvo, HttpServletRequest req, Model model1) {
		
		//boolean flag = true;
		
		uvo = udao.detailUsedGoods(Integer.parseInt(req.getParameter("serial")));
		model1.addAttribute("serial", uvo.getSerial());
		model1.addAttribute("title", uvo.getTitle());
		model1.addAttribute("context", uvo.getContext());
		model1.addAttribute("goodsName", uvo.getGoodsName());
		model1.addAttribute("fileName", uvo.getFileName());
		model1.addAttribute("price", uvo.getPrice());
		model1.addAttribute("id", uvo.getId());
		//model1.addAttribute("flag", flag);
		
		model1.addAttribute("many", uvo.getMany());
		
		
		udao.plusCnt(Integer.parseInt(req.getParameter("serial")));
		
		return "UsedGoods/viewUsedGoods";

	}
	
	
	
	@RequestMapping("/soldDetail")
	public String soldDetail(UsedGoodsVO uvo,HttpServletRequest req, Model model1, int serial) {
		
		//boolean flag = false;
		
		uvo = udao.detailUsedGoods(Integer.parseInt(req.getParameter("serial")));
		model1.addAttribute("serial", uvo.getSerial());
		model1.addAttribute("title", uvo.getTitle());
		model1.addAttribute("context", uvo.getContext());
		model1.addAttribute("goodsName", uvo.getGoodsName());
		model1.addAttribute("fileName", uvo.getFileName());
		model1.addAttribute("price", uvo.getPrice());
		model1.addAttribute("id", uvo.getId());
		//model1.addAttribute("flag", flag);
		
		//model1.addAttribute("many", uvo.getMany());
		
		udao.soldOut(serial);
		
		udao.plusCnt(Integer.parseInt(req.getParameter("serial")));
		
		return "UsedGoods/viewUsedGoods";

	}
	
	
	

	@RequestMapping(value = "/updateUsedGoodsForm", method = RequestMethod.GET)
	   public String updateTogetherForm(HttpServletRequest req, Model model1) {
	      UsedGoodsVO uvo = udao.detailUsedGoods(Integer.parseInt(req.getParameter("serial")));
	      model1.addAttribute("serial", uvo.getSerial());
	      model1.addAttribute("title", uvo.getTitle());
	      model1.addAttribute("context", uvo.getContext());
	      model1.addAttribute("price", uvo.getPrice());
	      return "UsedGoods/updateForm";
	   }

	@RequestMapping(value = "/updateUsedGoodsForm", method = RequestMethod.POST)
	   public String updateTogether(HttpServletRequest req, RedirectAttributes rttr) {

	      int serial = Integer.parseInt(req.getParameter("serial"));
	      udao.updateUsedGoods(serial, req.getParameter("title"), Integer.parseInt(req.getParameter("price")), req.getParameter("context"));
	      rttr.addAttribute("serial", req.getParameter("serial"));
	      
	      return "redirect:/usedGoods/detail";
	   }

	
	
	@RequestMapping("/delete")
	public String deleteTogether(HttpServletRequest req) {
		udao.deleteUsedGoods(Integer.parseInt(req.getParameter("serial")));
		return "redirect:list";
	}
	
	
	///////////구매 폼
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public String buy(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
	      String id = (String) session.getAttribute("sid");
	      
	      int price = Integer.parseInt(request.getParameter("price"));
	      model.addAttribute("price", price);
	      int serial = Integer.parseInt(request.getParameter("serial"));
	      model.addAttribute("serial", serial);
	      
	      //int flag=0;
	      
	      MemberVO mvo = mdao.getMember(id);
	      
	      model.addAttribute("name", mvo.getName());
	      model.addAttribute("goodsName", request.getParameter("goodsName"));
	      model.addAttribute("gid", mvo.getUsername());
	      model.addAttribute("phone", mvo.getTel());
	      //model.addAttribute("flag", flag);
		
		return "UsedGoods/buyingForm";
	}
	
	
	///////////////////////////페이징////////////////////////////////
	// 게시물 목록 + 페이징 추가

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		model.addAttribute("list", udao.listPage(scri));
		model.addAttribute("getUsedGoods", udao.getUsedGoods());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(udao.count(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "UsedGoods/usedGoods";
		
	}
	
	

    
}


