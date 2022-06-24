package com.demo.service;

import java.util.ArrayList;

import javax.ejb.Local;

import com.demo.model.SanPhamDTO;

@Local
public interface ProductListLocal {
	ArrayList<SanPhamDTO> fetchProduct();	
	SanPhamDTO getProductByID(String id);
	ArrayList<SanPhamDTO> getTypeList();
	
	void insertProduct(SanPhamDTO sp);
	void deleteProduct(String id);
	void updateProduct(SanPhamDTO sp);
}
