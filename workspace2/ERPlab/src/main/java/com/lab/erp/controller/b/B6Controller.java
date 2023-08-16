package com.lab.erp.controller.b;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lab.erp.service.b.B6Service;
import com.lab.erp.vo.b.b6.Erp_ResignVO;
import com.lab.erp.vo.b.b6.Erp_SalaryVO;
import com.lab.erp.vo.login.Erp_Employee1VO;

@Controller
public class B6Controller {
	private B6Service b6;
	
	@Autowired
	public B6Controller(B6Service b6) {
		this.b6 = b6;
	}
	
	
	//추가근무수당 정산
	@GetMapping("/greeting/privacy")
	public String privacy() {
		return "/b/b6/b61/privacy";
	}
	
	@RequestMapping("/greeting/list")
	public String list(String employee1_code, Model model) {
		List<Erp_SalaryVO> list = b6.privacy(employee1_code);
		model.addAttribute("list", list);
		return "/b/b6/b61/list";
	}
	
	@RequestMapping("/greeting/salary/insertForm")
	public String insertForm() {
		return "/b/b6/b61/insertForm";
	}
	
	@RequestMapping("/greeting/salary/insert")
	public String insert(String salarytype_name, String salary_code, String salary_date, String salary_start, String salary_end, String employee1_code, Erp_SalaryVO vo, Model model) {
		int employee2_no = b6.selectEmployee(employee1_code);
		
		System.out.println(employee2_no);
		
		int salarytype_no = b6.salaryType(salarytype_name);
		
		double salarytype_magnification = b6.magnification(salarytype_no);
		
		vo.setSalary_code(salary_code);
		vo.setSalary_date(salary_date);
		vo.setSalary_start(salary_start);
		vo.setSalary_end(salary_end);
		vo.setEmployee2_no(employee2_no);
		vo.setSalarytype_no(salarytype_no);
		
		System.out.println(vo.getSalary_end());
		
		System.out.println(vo.getSalary_date());
		
		int month = b6.selectMonth(salary_date);
		
		System.out.println(month);
		
		int employee2_salary = b6.selectSalary(employee2_no);
		
		System.out.println(employee2_salary);
		
		int year = b6.selectYear(salary_date);
		
		System.out.println(year);
		
		int totalDays = YearMonth.of(year, month).lengthOfMonth();
		
		int weekdays = 0;
		
	       for (int day = 1; day <= totalDays; day++) {
	           LocalDate date = LocalDate.of(year, month, day);
	           if (date.getDayOfWeek() != DayOfWeek.SATURDAY && date.getDayOfWeek() != DayOfWeek.SUNDAY) {
	               weekdays++;
	           }
	       }
	        
	       
	    System.out.println(weekdays);
	    System.out.println(salarytype_magnification);
	    double salary_cash = (employee2_salary / 12.0 / weekdays / 8) * salarytype_magnification;
	    
	    vo.setSalary_cash(salary_cash);
	    
	    System.out.println(salary_cash);
	    
		int su = b6.insertSalary(vo);
		
		String msg = "";
		
		if(su != 0) {
			msg = "입력되었습니다";
		}
		
		model.addAttribute("msg", msg);
		
		return "/b/b6/b61/insertresult";
		
	}
	
	//퇴직
	@RequestMapping("/greeting/resignList")
	public String resignList(Model model) {
		List<Erp_Employee1VO> list = new ArrayList<>();
		list = b6.resignList();
		model.addAttribute("list", list);

		return "/b/b6/b62/resignList";
	}
	
	@RequestMapping("/greeting/resign/insertForm")
	public String resigninsertForm(Model model, int employee2_no) {
		System.out.println(employee2_no);
		model.addAttribute("employee2_no", employee2_no);
		return "/b/b6/b62/resigninsertForm";
	}
	
	@RequestMapping("/greeting/resign/insert")
	public String resigninsert(int employee2_no, String resign_code, String resign_date, Erp_ResignVO vo) {
		vo.setEmployee2_no(employee2_no);
		vo.setResign_code(resign_code);
		vo.setResign_date(resign_date);
		int employee2_salary = b6.selectSalary(employee2_no);
		int employee2_exp = b6.selectExp(employee2_no);
		int resign_cost = (employee2_salary / 12) * employee2_exp;
		vo.setResign_cost(resign_cost);
		int su = b6.resignInsert(vo);
		
		
		return "redirect:/greeting/resignList";
	}
	
}
