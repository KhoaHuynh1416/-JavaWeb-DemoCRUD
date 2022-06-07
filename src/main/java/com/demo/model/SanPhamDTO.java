/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author PC
 */

@Entity
@Table(name="sanpham")
public class SanPhamDTO { 

	 @Id
	 @Column(name="masp")
	 protected String MaSP;
	 
	 @Column(name="tensp")
	 protected String TenSP;
	 
	 @Column(name="dongia")
	 protected float DonGia;
	 
	 @Column(name="soluong")
	 protected int SoLuong;
	 
	 @Column(name="maloai")
	 protected String MaLoai;
	 
	 public SanPhamDTO() {
		 MaSP = "";
		 TenSP = "";
		 DonGia = 0;
		 SoLuong = 0;
		 MaLoai = "";
	 }

    public SanPhamDTO(String ma, String ten, int sl, float gia, String loai){
        this.setMaSP(ma);
        this.setTenSP(ten);
        try {
			this.setSoLuong(sl);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        this.setDonGia(gia);
        this.setMaLoai(loai);
    }
    
    public void setAll(SanPhamDTO sp) {
        this.MaSP = sp.getMaSP();
        this.TenSP = sp.getTenSP();
        this.SoLuong = sp.getSoLuong();
        this.DonGia = sp.getDonGia();
        this.MaLoai = sp.getMaLoai();
    }
    
    public String getMaLoai() {
        return MaLoai;
    }

    public void setMaLoai(String MaLoai) {
        this.MaLoai = MaLoai;
    }

    public String getMaSP() {
        return MaSP;
    }

    public void setMaSP(String MaSP) {
        this.MaSP = MaSP;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public int getSoLuong(){       
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) throws Exception {
        if(SoLuong < 0){
        	this.SoLuong = 0;
            throw new Exception("Quantity must be > 0!");
        }
        else
            this.SoLuong = SoLuong;
    }

    public float getDonGia() {
        return DonGia;
    }

    public void setDonGia(float DonGia) {
        this.DonGia = DonGia;
    }
}
                                                                                                                                                          