package com.springboot.mv.security.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.mv.security.dto.ComplaintRequestDTO;
import com.springboot.mv.security.entity.Complaint;
import com.springboot.mv.security.entity.ComplaintDataExporter;
import com.springboot.mv.security.entity.Customer;
import com.springboot.mv.security.entity.ReponseData;
import com.springboot.mv.security.service.ComplaintService;
import com.springboot.mv.security.service.CustomerService;




@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	CustomerService customerService;
	
	@Autowired
	private ComplaintService complaintService;
	
	
	
	// this method will get Admin Dashboard
	@GetMapping("/admindashboard")
	public String dashboard(HttpSession httpSession) {
		List<Complaint> fetchAll = this.complaintService.getAllPendingComplaints();
		
		httpSession.setAttribute("fetchAll", fetchAll);
		return "admindashboard";
	}
	
	//when an admin has to give comment and status 
	@RequestMapping("/updateComplaint")
	public String updateComplaint(@RequestParam("complaintId") int complaintId,Model m) {
		Complaint complaint= this.complaintService.getComplaintById(complaintId);
		m.addAttribute("complaint",complaint);
		return "updateComplaint";
	}
	
	//after providing comments and status 
	@PostMapping("/updateform")
	public @ResponseBody ReponseData updateForm(@RequestBody ComplaintRequestDTO complaintRequestDto)
	{
	Complaint complaint=this.complaintService.getComplaintById(complaintRequestDto.getComplaintId());
		complaintRequestDto.setDescription(complaint.getDescription());
		complaintRequestDto.setCategory(complaint.getCategory());
		complaintRequestDto.setSubCategory(complaint.getSubCategory());
		
			
		this.complaintService.updateComplaint(complaintRequestDto);
	
		return new ReponseData("SUCCESS");
	}
	
	@GetMapping("/history")
	public  String allComplaints(Complaint complaint, Model m)
	{
		List<Complaint> complaints = this.complaintService.allComplaints();
	
		m.addAttribute("complanits",complaints);
		return "history";	
	}
	
	@GetMapping("/serch")
	public String search()
	{
		return "serch";
	}
	
	@GetMapping("/export")
	public void exportToExcel(HttpServletResponse response) throws IOException
	{
		response.setContentType("application/octet-stream");
		String headerKey = "Content-Disposition";
		String headerValue = "attatchment; filename=customersData.xlsx";
		
		response.setHeader(headerKey, headerValue);
		
		
		List<Complaint> complaints = complaintService.allComplaints();
		
		ComplaintDataExporter dataExporter = new ComplaintDataExporter(complaints);
		dataExporter.export(response);
		
		
	}
	
	 @RequestMapping("/searchcomplaint")
	 public String searchComplaint(@RequestParam("name") String name,Customer customer,Model model)
	 {
		 List<Complaint> complaints= this.complaintService.getComplaintByCustomerId(customer);
	
		 model.addAttribute("complaints", complaints);
		 return "serch";
	 }
	
	 @PostMapping("/compsearch")
	    public@ResponseBody ReponseData complaintbyName(@RequestBody String name,HttpSession session) 
	 {
		 		 JSONObject jsonObject=new JSONObject(name);
		 String customerName=jsonObject.getString("name");
		 
		 Customer customer = this.customerService.getCustomerByName(customerName);
		 
		 
		 session.setAttribute("complaints",this.complaintService.findByCustomer(customer));
		

		 	return new ReponseData("SUCCESS");
	    }
	 

	 
	 
}
