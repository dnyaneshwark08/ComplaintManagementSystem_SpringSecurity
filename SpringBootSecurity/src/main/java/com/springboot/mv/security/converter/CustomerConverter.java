package com.springboot.mv.security.converter;




import com.springboot.mv.security.dto.CustomerDTO;
import com.springboot.mv.security.dto.CustomerRequestDTO;
import com.springboot.mv.security.entity.Customer;


public class CustomerConverter {

	private CustomerConverter() {
		
	}
	
	public static Customer customerDtotoEntity(CustomerDTO customerDTO)
	{
		Customer customer = new Customer();
		customer.setCustomerId(customerDTO.getCustomerId());
		customer.setUserName(customerDTO.getUserName());
		customer.setPassword(customerDTO.getPassword());
		customer.setEmail(customerDTO.getEmail());
		customer.setName(customerDTO.getName());
		customer.setAddress(customerDTO.getAddress());
		customer.setRole(customerDTO.getRole());
		return customer;
	}

	
	public static Customer updateCustomerDtotoEntity(CustomerRequestDTO customerRequestDTO)
	{
		Customer customer = new Customer();
		
		customer.setAddress(customerRequestDTO.getAddress());
		customer.setCustomerId(customerRequestDTO.getCustomerId());
		customer.setEmail(customerRequestDTO.getEmail());
		customer.setName(customerRequestDTO.getName());
//		customer.set
		
		return customer;
	}
	
}
