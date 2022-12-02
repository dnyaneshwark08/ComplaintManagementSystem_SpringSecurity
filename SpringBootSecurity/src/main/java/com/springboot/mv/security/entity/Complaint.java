package com.springboot.mv.security.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "Complaint_task7")
public class Complaint implements Serializable {


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int complaintId;
	private String description;

	@Column(name = "Date", nullable = false, columnDefinition = "TIMESTAMP default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP")
	private Date complaintDate = new Date();
	
	@Embedded
	private Support support;
	
	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customer;

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
	
	public int getCustomerId()
	{
		return customer.getCustomerId();
	}

	public String getName()
	{
		return customer.getName();
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
	
	public Date getComplaintDate() {
		return complaintDate;
	}
	public void setComplaintDate(Date complaintDate) {
		this.complaintDate = complaintDate;
	}
		
	@Override
	public String toString() {
		return "Complaint [complaintId=" + complaintId + ", description=" + description + "complaint date= "+complaintDate+
				", support=" + support + "customerId = " +getCustomerId()+" customerName = "+getName()+", category=" + category + ", subCategory=" + subCategory + "]";
	}
	
	
}
