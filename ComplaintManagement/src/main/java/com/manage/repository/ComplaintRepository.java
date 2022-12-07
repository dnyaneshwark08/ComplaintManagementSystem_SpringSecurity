package com.manage.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.manage.entity.Complaint;
import com.manage.entity.Customer;

public interface ComplaintRepository extends JpaRepository<Complaint, Integer> {

	// Customer Inprocess Complaint
	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE comments ='INPROCESS' AND status ='INPROCESS' AND customerId=? ")
	public List<Complaint> getInProcessComplaint(Customer customer);

	// Customer Solved Complaint
	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE status ='SOLVED' AND customerId=? ")
	public List<Complaint> getSolvedComplaint(Customer customer);

	// Customer Total Complaint
	@Query(nativeQuery = true, value = "SELECT * FROM concerto.complaint WHERE customerId=? ORDER BY Date DESC ")
	public List<Complaint> findAllComplaintByCustomer(Customer customer);

	// get Customer Details
	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE customerId=? ")
	public List<Complaint> getComplaintProfile(Customer customer);

	// Admin Unsolved Complaint
	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE comments ='INPROCESS' AND status ='INPROCESS'")
	public List<Complaint> findInprocessBySupport();

	// Admin Solved Complaint
	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE status ='SOLVED'")
	public List<Complaint> findSolvedBySupport();

	// History for Admin
	@Query(nativeQuery = true, value = "SELECT * FROM concerto.complaint ORDER BY Date DESC")
	public List<Complaint> findAllCommplaint();

	// For Search
	public List<Complaint> findByProductContaining(String product);

}
