package com.lab.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
	public HomeController() {
		System.out.println("### LOG : " + getClass().getName() + "() 생성");
	}
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/test")
	public String test() {
		return "thymeleaf/test";
	}
	
	@GetMapping("/testjsp")
	public String sidebar() {
		return "sidebar";
	}
}
