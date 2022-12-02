package com.springboot.mv.security.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Service;

import com.springboot.mv.security.converter.CustomerConverter;
import com.springboot.mv.security.dto.CustomerDTO;

import com.springboot.mv.security.entity.Complaint;
import com.springboot.mv.security.entity.Customer;
import com.springboot.mv.security.repository.ComplaintRepository;
import com.springboot.mv.security.repository.CustomerRepository;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private ComplaintRepository complaintRepository;
	
	public boolean registerCustomer(CustomerDTO customerDTO) {
		if(this.customerRepository.existsByUserName(customerDTO.getUserName()))
		{
			
			throw new EntityNotFoundException("cust already exists");
		}
		
		
		
		Customer customer2 = CustomerConverter.customerDtotoEntity(customerDTO);
		if (customer2.getRole().equals("CUSTOMER")) {
			customer2.setRole("ROLE_CUSTOMER");
		} else {
			customer2.setRole("ROLE_ADMIN");
		}
		
		customer2.setPassword(PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(customer2.getPassword()));
	
		this.customerRepository.save(customer2);
		
		
		return true;
	}
	
	
	
	
	
	public Customer getUserbyUserName(String userName) throws EntityNotFoundException
	{
		Optional<Customer> customer=this.customerRepository.findByUserName(userName);
		if(customer.isPresent())
		{
			return customer.get();
		}
		return customer.orElseThrow(()->new EntityNotFoundException("Entity with this username not found" + userName));
	}
	
	public List<Complaint> getAllComplaints()
	{
		return this.complaintRepository.findAll();
	}
	
	public Customer getCustomerByName(String name) throws EntityNotFoundException
	{
		Optional<Customer> customer=this.customerRepository.findByName(name);
		if(customer.isPresent())
		{
			
			return customer.get();
		}
		return customer.orElseThrow(()->new EntityNotFoundException("Entity with this username not found " + name));
	}
	
	public Customer getCustomerById(int customerId)
	{
	 Optional<Customer> customer = this.customerRepository.findById(customerId);
		if(customer.isPresent()) {
			return customer.get();
		}else {
			return customer.orElseThrow(() -> new EntityNotFoundException("entity not fount"));
		}
	}
	
	public boolean updateCustomer(CustomerDTO customerDto) {
		Customer updateCustomerDtotoEntity = CustomerConverter.customerDtotoEntity(customerDto);
	
		if(this.customerRepository.existsById(updateCustomerDtotoEntity.getCustomerId())) {
			this.customerRepository.save(updateCustomerDtotoEntity);
			return true;
		}
		return false;
	}
	
}
