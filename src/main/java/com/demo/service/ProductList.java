package com.demo.service;

import static java.lang.Integer.parseInt;

import java.util.ArrayList;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.demo.model.SanPhamDTO;
import com.demo.model.SanPhamDAO;

/**
 * Session Bean implementation class ProductList
 */
@Stateless
@LocalBean
public class ProductList implements ProductListRemote, ProductListLocal {

    /**
     * Default constructor. 
     */
	private SanPhamDAO productConn;
	
    public ProductList() {
        // TODO Auto-generated constructor stub
		try {
			productConn = new SanPhamDAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	@Override
	public ArrayList<Object> fetchProduct() {
		// TODO Auto-generated method stub
		try {
			return productConn.docDSSP();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public SanPhamDTO getProductByID(String id) {
		// TODO Auto-generated method stub
		try {
			return productConn.getSanphamByMaSP(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insertProduct(SanPhamDTO sp) {
		// TODO Auto-generated method stub
		try {
			sp.setMaSP(this.taoMaSP());
			productConn.them(sp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteProduct(String id) {
		// TODO Auto-generated method stub
		try {
			productConn.xoa(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateProduct(SanPhamDTO sp) {
		// TODO Auto-generated method stub
		try {
			productConn.sua(sp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<Object> getTypeList() {
		// TODO Auto-generated method stub
		try {
			return productConn.docDSLoaiSP();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	 public String taoMaSP() throws Exception{
	        ArrayList<Object> DSSanPham = this.fetchProduct();
	        
	        if(DSSanPham.isEmpty()){
	            return "sp001";
	        }
	        
	        //Lay ma san pham cuoi cung trong CSDL
	        String MaSPCuoi = ((SanPhamDTO) DSSanPham.get(DSSanPham.size()-1)).getMaSP();
	        
	        String KeyString = "";
	        int vitri = 0;
	        
	        //MaSP = 'spxxx', Loai bo 'sp' de lay 'xxx' la mot so nguyen va gan cho KeyString
	        while(vitri < MaSPCuoi.length()){
	            if(MaSPCuoi.charAt(vitri) != 's' && MaSPCuoi.charAt(vitri) != 'p'){
	                KeyString += MaSPCuoi.charAt(vitri);
	            }
	            vitri++;
	        }
	        
	        //parse KeyString thanh Int va ++ de co ma so moi
	        int KeyCode = parseInt(KeyString);
	        KeyCode++;
	        
	        //Them 'sp' len truoc de tro ve dinh dang MaSP
	        if(KeyCode >= 100){
	            KeyString = "sp" + KeyCode;
	        }
	        else 
	            if(KeyCode >=10){
	            KeyString = "sp0" + KeyCode;
	        }
	            else{
	                KeyString = "sp00" + KeyCode;
	            }
	        
	        return KeyString;
	    }

}
