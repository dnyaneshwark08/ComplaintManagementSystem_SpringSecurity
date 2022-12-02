package com.springboot.mv.security.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CustomerDTO {
	
	private int customerId;
	private String userName;
	private String password;
	private String email;
	private String name;
	private String address;
	private String role;

}
