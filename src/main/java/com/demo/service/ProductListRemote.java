package com.demo.service;

import java.util.ArrayList;

import javax.ejb.Remote;

import com.demo.model.SanPhamDTO;

@Remote
public interface ProductListRemote {
	ArrayList<Object> fetchProduct();	
	SanPhamDTO getProductByID(String id);
	ArrayList<Object> getTypeList();
}
