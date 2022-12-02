package com.springboot.mv.security.dto;

import com.springboot.mv.security.entity.Customer;
import com.springboot.mv.security.entity.Support;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ComplaintDTO {

	private int complaintId;
	private String description;
	private Support support;
	private Customer customer;
	private String name;
	private String category;
	private String subCategory;
	
	public int getComplaintId() {
		return complaintId;
	}
	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Support getSupport() {
		return support;
	}
	public void setSupport(Support support) {
		this.support = support;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getName() {
		return customer.getName();
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	
	
	
}
