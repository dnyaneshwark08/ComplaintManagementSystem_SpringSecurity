package com.springboot.mv.security.dto;

import com.springboot.mv.security.entity.Status;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ComplaintRequestDTO {
	
	private int complaintId;
	private Status status;
	private String comments;
	private String description;
	private int customerId;
	private String name;
	private String category;
	private String subCategory;

}
