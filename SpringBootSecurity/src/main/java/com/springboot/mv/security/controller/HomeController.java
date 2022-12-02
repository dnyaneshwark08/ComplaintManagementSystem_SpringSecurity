package com.springboot.mv.security.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.mv.security.dto.CustomerDTO;
import com.springboot.mv.security.service.CustomerService;


@Controller
public class HomeController {

	@Autowired
	private CustomerService customerService;

	public HomeController() {
		super();
		
	}
	@RequestMapping("/")
	public String greet() 
	{
		return "index";
	}

	
	@RequestMapping("register")
	public String registerCustomer()
	{
	return "registration";	
	}

	
	@PostMapping("/register")
	public String registerUser(CustomerDTO customerDTO)
	{
		
		if(this.customerService.registerCustomer(customerDTO))
				 return "redirect:loginPage?msg=registration successful";
		return "registration";
	}
	
	
	@RequestMapping("/loginPage")
	public String loginCustomer(Model model, @RequestParam(required = false, name = "error") String errorMsg)
	{
		if (errorMsg != null) {
			model.addAttribute("errorMsg", "Invalid Username or Password");
			return "login";
		}

		return "login";
	}

	@GetMapping("/logout")
	public String logout() 
	{
		return "/index";
	}

}