package com.springboot.mv.security.converter;




import com.springboot.mv.security.dto.ComplaintDTO;
import com.springboot.mv.security.dto.ComplaintRequestDTO;
import com.springboot.mv.security.entity.Complaint;
import com.springboot.mv.security.entity.Customer;
import com.springboot.mv.security.entity.Support;

public class ComplaintConverter {

	

	
	private ComplaintConverter() {
		
	}

	public static Complaint complaintDtotoEntity(ComplaintDTO complaintDTO)
	{
		Complaint complaint = new Complaint();
		complaint.setComplaintId(complaintDTO.getComplaintId());
		complaint.setDescription(complaintDTO.getDescription());
		complaint.setSupport(complaintDTO.getSupport());
		complaint.setCustomer(complaintDTO.getCustomer());	
		complaint.setCategory(complaintDTO.getCategory());
		complaint.setSubCategory(complaintDTO.getSubCategory());
		return complaint;
	}
	
	public static Complaint updateComplaintDtoToEntity(ComplaintRequestDTO complaintRequestDTO)
	{
		Complaint complaint = new Complaint();
		Support support = new Support();
		
		support.setStatus(complaintRequestDTO.getStatus());
		support.setComments(complaintRequestDTO.getComments());
		complaint.setComplaintId(complaintRequestDTO.getComplaintId());
		complaint.setSupport(support);
		complaint.setDescription(complaintRequestDTO.getDescription());
		complaint.setCategory(complaintRequestDTO.getCategory());
		complaint.setSubCategory(complaintRequestDTO.getSubCategory());
		Customer customer = new Customer();
		customer.setCustomerId(complaintRequestDTO.getCustomerId());
		customer.setName(complaintRequestDTO.getName());
		complaint.setCustomer(customer);
		
		
		return complaint;
	}
	
}
