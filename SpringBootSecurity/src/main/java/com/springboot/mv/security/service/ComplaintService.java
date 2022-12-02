package com.springboot.mv.security.service;




import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.springboot.mv.security.converter.ComplaintConverter;
import com.springboot.mv.security.dto.ComplaintDTO;
import com.springboot.mv.security.dto.ComplaintRequestDTO;
import com.springboot.mv.security.entity.Complaint;
import com.springboot.mv.security.entity.Customer;
import com.springboot.mv.security.entity.Status;
import com.springboot.mv.security.entity.Support;
import com.springboot.mv.security.repository.ComplaintRepository;
import com.springboot.mv.security.repository.CustomerRepository;

@Service
public class ComplaintService {

	@Autowired
	private ComplaintRepository complaintRepository;
	
	@Autowired
	CustomerRepository customerRepository;
	
	
	public boolean registerComplaint(ComplaintDTO complaintDTO) 
	{
	
		Complaint customerDtotoEntity = ComplaintConverter.complaintDtotoEntity(complaintDTO);
		Support support = new Support();
		
		support.setStatus(Status.INPROCESS);
		support.setComments("In Processs");
		
		customerDtotoEntity.setSupport(support);
		this.complaintRepository.save(customerDtotoEntity);
		return true;
	}
	
	 public List<Complaint> getAllPendingComplaints() {

			return complaintRepository.findBySupport();
			
	    }
	 
	public List<Complaint> getComplaintByCustomerId(Customer customer) {
		
		return this.complaintRepository.findByCustomer(customer);
	}
	
	public Complaint getComplaintById(int complaintId)
	{
		Optional<Complaint> optional = this.complaintRepository.findById(complaintId);
		if (optional.isPresent()) {
			return optional.get();
		}
	
	return null;
	}	
	 public boolean updateComplaint(ComplaintRequestDTO complaintRequestDto)
	 {
		 Complaint updateComplaintDtoToEntity =
				  ComplaintConverter.updateComplaintDtoToEntity(complaintRequestDto);
		 
		 
		 
		 if(this.complaintRepository.existsById(updateComplaintDtoToEntity.getComplaintId()))
		 {
			 this.complaintRepository.save(updateComplaintDtoToEntity);
			 return true;
		 }
		 
		 
		 return false;
	
	 }
	 
	 public List<Complaint> allComplaints()
	 {
		 return complaintRepository.findAll();
	 }
	 
	 public List<Complaint> findByCustomer(Customer customer)
	 {
		return complaintRepository.findAllByCustomer(customer);
		 
	 }
}