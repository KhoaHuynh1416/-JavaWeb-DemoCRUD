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
@Table(name="loaisanpham")
public class TypeDTO { 

	 @Id
	 @Column(name="MaLoai")
	 protected String MaLoai;
	 
	 protected String TenLoai;
	 
	 public TypeDTO() {
		 MaLoai = "";
		 TenLoai = "";
	 }

    public TypeDTO(String ma, String ten){
        this.setMaLoai(ma);
        this.setTenLoai(ten);
    }
    
    public void setAll(TypeDTO sp) {
        this.TenLoai = sp.getTenLoai();
        this.MaLoai = sp.getMaLoai();
    }
    
    public String getMaLoai() {
        return MaLoai;
    }

    public void setMaLoai(String MaLoai) {
        this.MaLoai = MaLoai;
    }

    public String getTenLoai() {
        return TenLoai;
    }

    public void setTenLoai(String TenLoai) {
        this.TenLoai = TenLoai;
    }
}
                                                                                                                                                          