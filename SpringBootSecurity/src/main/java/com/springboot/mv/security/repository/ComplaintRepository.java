package com.springboot.mv.security.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.mv.security.entity.Complaint;
import com.springboot.mv.security.entity.Customer;

public interface ComplaintRepository extends JpaRepository<Complaint, Integer> {
	
	@Query
	(nativeQuery = true,value = "select * from complaint_task7")
	public List<Complaint> allComplaints();
	
	public List<Complaint> findByCustomer(Customer customer);
	
	@Query(nativeQuery = true, value = "select * from complaint_task7 where comments='In Processs' AND status='INPROCESS'")
	List<Complaint> findBySupport();
	
	// status 
		@Query
		(nativeQuery = true,value = "select * from complaint where comments='In processs' AND status='INPROCESS' AND customerid=?")
		public List<Complaint> getComplaintInProcess(Customer customerId);
		
		@Query(nativeQuery = true, value = "select * from customer_task7 where customerId=?")
		public List<Complaint> findComplaintByCustomerId(Customer customerId);
		
		public List<Complaint> findAllByCustomer(Customer customer);

}
