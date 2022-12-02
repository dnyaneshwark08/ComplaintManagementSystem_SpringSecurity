package com.springboot.mv.security.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.mv.security.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	public Optional<Customer> findByUserName(String custUserName);
	
	public boolean existsByUserName(String custUserName);
	public Optional<Customer> findByName(String name);

}
