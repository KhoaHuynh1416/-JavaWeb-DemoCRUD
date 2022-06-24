package com.demo.service;

import java.util.ArrayList;

import javax.ejb.Remote;

import com.demo.model.SanPhamDTO;

@Remote
public interface ProductListRemote {
	ArrayList<SanPhamDTO> fetchProduct();	
	SanPhamDTO getProductByID(String id);
	ArrayList<SanPhamDTO> getTypeList();
}
