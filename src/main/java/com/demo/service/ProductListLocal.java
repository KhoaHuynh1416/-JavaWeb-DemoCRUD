package com.demo.service;

import java.util.ArrayList;

import javax.ejb.Local;

import com.demo.model.SanPhamDTO;

@Local
public interface ProductListLocal {
	ArrayList<Object> fetchProduct();	
	SanPhamDTO getProductByID(String id);
	ArrayList<Object> getTypeList();
	
	void insertProduct(SanPhamDTO sp);
	void deleteProduct(String id);
	void updateProduct(SanPhamDTO sp);
}
