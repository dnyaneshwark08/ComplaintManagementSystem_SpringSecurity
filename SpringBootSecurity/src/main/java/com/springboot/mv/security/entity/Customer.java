package com.springboot.mv.security.entity;


import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

@Entity
@Table(name = "Customer_task7")
public class Customer implements Serializable

{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int customerId;
	@Column(unique = true, length = 20)
	private String userName;
	private String password;
	@Column(unique = true)
	private String email;
	@Column(unique = true, length = 20)
	private String name;
	private String address;
	private String role;
	
	@OneToMany(mappedBy = "customer",fetch = FetchType.EAGER)
	private List<Complaint> complaints;

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", userName=" + userName + ", password=" + password + ", email="
				+ email + ", name=" + name + ", address=" + address + ", role=" + role + "]";
	}
	
	
	
	

}
