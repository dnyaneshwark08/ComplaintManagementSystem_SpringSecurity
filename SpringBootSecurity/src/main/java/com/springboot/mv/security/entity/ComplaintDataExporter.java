package com.springboot.mv.security.entity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class ComplaintDataExporter {

	Support support= new Support();
	Customer customer = new Customer();
	
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	
	private List<Complaint> complaints;
	
	public ComplaintDataExporter(List<Complaint> complaints) {
		
		this.complaints = complaints;
		
		workbook = new XSSFWorkbook();
		sheet = workbook.createSheet("customerData");
		
	}
	
	
	private void writeHeaderRow()
	{
		Row row = sheet.createRow(0);
		
		Cell cell = row.createCell(0);
		cell.setCellValue("complaintId");
		
		cell = row.createCell(1);
		cell.setCellValue("category");
		
		cell = row.createCell(2);
		cell.setCellValue("subCategory");
		
		cell= row.createCell(3);
		cell.setCellValue("description");
		
		cell= row.createCell(4);
		cell.setCellValue("support");
		
		cell = row.createCell(5);
		cell.setCellValue("customerId");
		
		
		
		
		
	}
	
	private void writeDataRows()
	{
		int rowCount = 1;
		
		for(Complaint complaint : complaints)
		{
			Row row = sheet.createRow(rowCount++);
			
			Cell cell = row.createCell(0);
			cell.setCellValue(complaint.getComplaintId());
			
			cell = row.createCell(1);
			cell.setCellValue(complaint.getCategory());
			
			cell = row.createCell(2);
			cell.setCellValue(complaint.getSubCategory());
			
			cell = row.createCell(3);
			cell.setCellValue(complaint.getDescription());
			
			cell = row.createCell(4);
			cell.setCellValue(complaint.getSupport().toString());
			
			cell = row.createCell(5);
			cell.setCellValue(complaint.getCustomer().getCustomerId());
			
			
			
		}
	}
	
	public void export(HttpServletResponse response) throws IOException
	{
		writeHeaderRow();
		writeDataRows();
		
		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();
	}

	
	
}
