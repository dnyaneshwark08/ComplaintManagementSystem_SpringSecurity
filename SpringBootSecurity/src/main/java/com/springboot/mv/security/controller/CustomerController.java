package com.springboot.mv.security.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.springboot.mv.security.dto.ComplaintDTO;
import com.springboot.mv.security.dto.ComplaintRequestDTO;
import com.springboot.mv.security.dto.CustomerDTO;
import com.springboot.mv.security.entity.Complaint;
import com.springboot.mv.security.entity.Customer;
import com.springboot.mv.security.entity.ReponseData;
import com.springboot.mv.security.service.ComplaintService;
import com.springboot.mv.security.service.CustomerService;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ComplaintService complaintService;
	
	
	
	
	
	@GetMapping("/complaint")
	public String complaint(Model model, Principal p) 
	{
		Customer customer=this.customerService.getUserbyUserName(p.getName());
		
		List<Complaint> complaintsByCustomer = this.complaintService.getComplaintByCustomerId(customer); 
	
		model.addAttribute("complaintList", complaintsByCustomer);
		
		
		return "complaint";
	}
	
	@PostMapping("/addcomplaint")
	public @ResponseBody ReponseData addComplaint(@RequestBody ComplaintDTO complaintDTO, Principal p, Model model)
	{
		Customer customer=this.customerService.getUserbyUserName(p.getName());
		complaintDTO.setName(customer.getName());
        complaintDTO.setCustomer(customer);
       
		this.complaintService.registerComplaint(complaintDTO);
			return new ReponseData("success");
		
	}
	
	
	@RequestMapping("/custcomphistory")
	public String compHistory(Model model, Principal p)
	{
		
		try {
		     Customer customer=this.customerService.getUserbyUserName(p.getName());
		   
				
				List<Complaint> complaintsByCustomer = this.complaintService.getComplaintByCustomerId(customer); 
				
				model.addAttribute("complaintList", complaintsByCustomer);
				
				
				return "custcomphistory";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "complaint";
	}
	
	
	@RequestMapping("/updateComplaint")
	public String updateComplaint(@RequestParam("complaintId") int complaintId,Model m) {
		Complaint complaint= this.complaintService.getComplaintById(complaintId);
		m.addAttribute("complaint",complaint);
		return "editcomplaint";
	}
	
	@PostMapping("/updateform")
	public @ResponseBody ReponseData updateForm(@RequestBody ComplaintRequestDTO complaintRequestDto)
	{
	Complaint complaint=this.complaintService.getComplaintById(complaintRequestDto.getComplaintId());
	
	complaintRequestDto.setComments(complaint.getSupport().getComments());
	complaintRequestDto.setStatus(complaint.getSupport().getStatus());
		
	
		 this.complaintService.updateComplaint(complaintRequestDto);
		
	
		return new ReponseData("SUCCESS");
	}
	
	@RequestMapping("/custprofile")
	public String custprofile(Model model, Principal p)
	{
		Customer customer = this.customerService.getUserbyUserName(p.getName());
		model.addAttribute("customerDetails", customer);
		return "custprofile";
	}
	
	@RequestMapping("/editCustomer")
	public String editprofile(@RequestParam("customerId") int customerId, Model model ) {
		
		Customer customer = this.customerService.getCustomerById(customerId);
		
		model.addAttribute("customer", customer);
		return "editCustomer";
	}
	
	@PostMapping("/updateCustomer") // Edit Costumer Form
	public @ResponseBody ReponseData updateCustomer(@RequestBody CustomerDTO customerDto) {
		
		Customer customer = this.customerService.getCustomerById(customerDto.getCustomerId());
		customerDto.setUserName(customer.getUserName());
		
		customerDto.setPassword(customer.getPassword());
		customerDto.setRole(customer.getRole());
		this.customerService.updateCustomer(customerDto);
		return new ReponseData("SUCCESS");
	}
	
}
