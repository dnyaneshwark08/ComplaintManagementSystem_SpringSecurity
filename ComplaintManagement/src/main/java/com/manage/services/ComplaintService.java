package com.manage.services;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.manage.converter.ComplainToDto;
import com.manage.dto.ComplaintDto;
import com.manage.dto.UpdateDto;
import com.manage.entity.Complaint;
import com.manage.entity.Customer;
import com.manage.entity.ResponceStatus;
import com.manage.entity.Support;
import com.manage.repository.ComplaintRepository;

@Service
public class ComplaintService {

	Logger log = Logger.getLogger(ComplaintService.class);

	@Autowired
	private ComplaintRepository complaintRepository;

	// Insert Complaint By Customer
	public boolean saveComplaint(ComplaintDto complaintDTO) {
		Complaint complaint = ComplainToDto.convertDtoToEntity(complaintDTO);
		Support ss = new Support();
		ss.setStatus(ResponceStatus.INPROCESS);
		ss.setComments("INPROCESS");
		complaint.setSupport(ss);
		log.info("Service for insert Complaint");
		this.complaintRepository.save(complaint);
		return true;
	}

	// Customer Inprocess Complaint
	public List<Complaint> getComplaintByCustomerId(Customer customer) {
		List<Complaint> getCustomerComplaints = this.complaintRepository.getInProcessComplaint(customer);
		log.info("Service-get InProcess Comlaint By Id");
		return getCustomerComplaints;
	}

	// Customer Solved Complaint
	public List<Complaint> getSolvedComplaint(Customer customer) {
		List<Complaint> getCustomerComplaints = this.complaintRepository.getSolvedComplaint(customer);
		log.info("Service-get Solved Comlaint By Id");
		return getCustomerComplaints;
	}

	// Customer Total Complaint
	public List<Complaint> getComplaintHistory(Customer customer) {
		List<Complaint> getCustomerComplaints = this.complaintRepository.findAllComplaintByCustomer(customer);
		log.info("Service-get History for Customer ");
		return getCustomerComplaints;
	}

	// User Details
	public List<Complaint> getUserDetails(Customer customer) {
		log.info("Service-Get User Details");
		List<Complaint> getCustomerDetails = this.complaintRepository.getComplaintProfile(customer);
		return getCustomerDetails;
	}

	// Admin Unsolved Complaint
	public List<Complaint> getAllComplents() {
		List<Complaint> findAll = this.complaintRepository.findInprocessBySupport();
		log.info("Service-For admin dashboard ");
		return findAll;
	}

	// Admin Solved Complaint
	public List<Complaint> getSolvedComplentForSupport() {
		List<Complaint> findAll = this.complaintRepository.findSolvedBySupport();
		log.info("Service-For admin dashboard ");
		return findAll;
	}

	// History for Admin
	public List<Complaint> getHistory() {
		List<Complaint> history = this.complaintRepository.findAllCommplaint();
		log.info("Service-Get History for Admin");
		return history;
	}

	// Update Complaint Form For Customer
	public boolean updateComplaint(UpdateDto updateDto) {
		Complaint updateComplaintDtoToEntity = ComplainToDto.updateComplaintDtoToEntity(updateDto);
		if (this.complaintRepository.existsById(updateComplaintDtoToEntity.getComplaintId())) {
			this.complaintRepository.save(updateComplaintDtoToEntity);
			log.info("Service-Update Customer");
			return true;
		}
		log.error("Service-Update Customer");
		return false;
	}

	// History For Excel
	public List<Complaint> getExcel() {
		log.info("Service-Get Excel History for Admin");
		List<Complaint> getFile = this.complaintRepository.findAll();
		return getFile;
	}

	// Get Complaint By Id for Edit
	public Complaint getComplaintById(int complaintId) {
		log.info("Service-Get Complaint By Id for Edit");
		Complaint complaint = this.complaintRepository.findById(complaintId).get();
		return complaint;
	}

	// Delete Complaint By Id From Customer
	public boolean deleteComplainByCustomer(int complaintid) {
		if (this.complaintRepository.existsById(complaintid)) {
			this.complaintRepository.deleteById(complaintid);
			log.info("Service-Delete Complaint By Id From Customer");
			return true;
		}
		log.error("Service-Delete Complaint By Id From Customer");
		return false;
	}

	// Search Complaint By Product
	public List<Complaint> getComplaintBySearch(String product) {
		log.info("Service-Search By Complaint Product");
		return this.complaintRepository.findByProductContaining(product);
	}

}
