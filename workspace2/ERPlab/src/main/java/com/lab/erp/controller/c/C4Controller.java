package com.lab.erp.controller.c;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lab.erp.service.c.C4Service;
import com.lab.erp.vo.c.c1.Erp_ForsalesVO;
import com.lab.erp.vo.c.c2.Erp_LocalsalesVO;
import com.lab.erp.vo.c.c3.Erp_OnlineVO;
import com.lab.erp.vo.c.c3.Erp_StoresalesVO;
import com.lab.erp.vo.c.c4.Erp_SalesresultVO;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/c/c4")
public class C4Controller {
	private C4Service c4Service;
	
	@Autowired
	public void setC4Service(C4Service c4Service) {
		this.c4Service = c4Service;
	}
	
	// ---------영업실적관리---------
	@GetMapping("/c41/salesresult")
	public String salesresult (Model model) {
		List<Erp_SalesresultVO> list_res = c4Service.list_salesresult();
		model.addAttribute("salesresult_list", list_res);
		return "thymeleaf/c/salesresult";
	}
	
	@PostMapping("/c41/salesresult")
	public String salesresult (HttpSession session, @Valid @ModelAttribute("erp_salesresultVO") Erp_SalesresultVO erp_salesresultVO, BindingResult result, RedirectAttributes redirectAttributes) {
		// 에러있다면, 적힌 내용들 담고 해당 페이지 redirect 시킴
		if(result.hasErrors()) {
			if (!result.getFieldErrors().get(0).getField().equals("salesresult_no")) {
				redirectAttributes.addFlashAttribute("erp_salesresultVO", erp_salesresultVO);
			    redirectAttributes.addFlashAttribute("error", result.getFieldErrors().get(0).getField());	
			}
			// 에러가 없다며 일반적 저장기능 실행
			else {
//				int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
//				erp_salesresultVO.setComcode_no(comcode_no);
				erp_salesresultVO.setComcode_no(1); //temporary TODO 삭제할것
				c4Service.save_salesresult(erp_salesresultVO);
			}
		} 
		return "redirect:/c/c4/41/salesresult";
	}
	
	
	@PostMapping("/c41/salesresult_update")
	public String salesresult_update (HttpSession session, Erp_SalesresultVO erp_salesresultVO) {
		int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
		erp_salesresultVO.setComcode_no(comcode_no); 
		int res = c4Service.update_salesresult(erp_salesresultVO);
		return "redirect:/c/c4/c41/salesresult";
	}
	
	@PostMapping("/c41/salesresult_delete")
	public String event_delete (Erp_SalesresultVO erp_salesresultVO) {
		int res = c4Service.delete_salesresult(erp_salesresultVO.getSalesresult_no());
		return "redirect:/c/c32/salesresult";
	}
	
	// ---------해외영업매출조회---------
	@GetMapping("/c4/forsales_list")
	public String forsales_list (Model model) {
		List<Erp_ForsalesVO> list_res = c4Service.findForsalesAll();
		model.addAttribute("forsales_list", list_res);
		return "thymeleaf/c/forsales_list";
	}
	
	// ---------국내영업매출조회---------
	@GetMapping("/c4/localsales_list")
	public String localsales_list (Model model) {
		List<Erp_LocalsalesVO> list_res = c4Service.findLocalsalesAll();
		model.addAttribute("localsales_list", list_res);
		return "thymeleaf/c/forsales_list";
	}
	
	// ---------매장영업매출조회---------
	@GetMapping("/c4/storesales_list")
	public String storesales_list (Model model) {
		List<Erp_StoresalesVO> list_res = c4Service.findStoresalesAll();
		model.addAttribute("storesales_list", list_res);
		return "thymeleaf/c/storesales_list";
	}
	
	// ---------온라인영업매출조회---------
	@GetMapping("/c4/online_list")
	public String online_list (Model model) {
		List<Erp_OnlineVO> list_res = c4Service.findOnlineAll();
		model.addAttribute("online_list", list_res);
		return "thymeleaf/c/online_list";
	}
	
	// ---------고객관리---------

}
