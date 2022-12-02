package com.springboot.mv.security.service;

import java.util.Arrays;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springboot.mv.security.entity.Customer;
import com.springboot.mv.security.repository.CustomerRepository;


@Service
public class LoginUserDetailsService implements UserDetailsService {
	
	
	@Autowired
	private CustomerRepository  customerRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException 
	{	
		Optional<Customer> optionalcustomer=this.customerRepository.findByUserName(username);
		if(optionalcustomer.isPresent()) {
		return optionalcustomer.map(user->new User(user.getUserName(), user.getPassword(),
				Arrays.stream(user.getRole().split(",")).map(SimpleGrantedAuthority::new).toList())
				).get();
		}
		throw new UsernameNotFoundException("Username not found");
	}

	
}
