/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class SanPhamDAO {
    String host = "localhost";
    String user = "root";
    String password = "";
    String db = "phonestorage";   
    
    MyConnection MyConn;
    
    public SanPhamDAO() throws Exception{
            MyConn = new MyConnection(host,user,password,db);
    }

public ArrayList docDSSP() throws Exception{
    ArrayList dssp = new ArrayList<Object>();

    String qry = "CALL getSanphamAll()";
    ResultSet rs = MyConn.excuteQuery(qry);

    while(rs.next()){
        SanPhamDTO sp = new SanPhamDTO();
        sp.setMaSP(rs.getString(1));
        sp.setTenSP(rs.getString(2));
        sp.setSoLuong(rs.getInt(3));
        sp.setDonGia(rs.getFloat(4));
        sp.setMaLoai(rs.getString(5));
        dssp.add(sp);
    }
        return dssp;
}

public void them (SanPhamDTO sp) throws Exception{
    String qry = "Insert Into sanpham Values('";
    qry += sp.getMaSP() + "','";
    qry += sp.getTenSP() +"','";
    qry += sp.getSoLuong() + "','";
    qry += sp.getDonGia() + "','";
    qry += sp.getMaLoai() + "')";
    
    MyConn.excuteUpdate(qry);
}

public void xoa (String masp) throws Exception{
        String qry = "Delete from sanpham where masp ='" + masp +"'";
        MyConn.excuteUpdate(qry);
}

public void sua (SanPhamDTO sp) throws Exception{
    String qry = "Update sanpham SET ";
    qry += "tensp = '" + sp.getTenSP() +"',";
    qry += "soluong = '" + sp.getSoLuong() + "',";
    qry += "dongia = '" + sp.getDonGia() + "',";
    qry += "maloai = '" + sp.getMaLoai() + "' where masp ='" + sp.getMaSP() + "'";;
    
    MyConn.excuteUpdate(qry);
}

public SanPhamDTO getSanphamByMaSP(String maSP) throws Exception {
        
    String qry = "Select * From sanpham where MaSP ='" + maSP + "'";
    ResultSet rs = MyConn.excuteQuery(qry);        
                    
        try {
            while(rs.next()){
                SanPhamDTO sanpham = new SanPhamDTO();
                
                sanpham.setMaSP(rs.getString("MASP"));
                sanpham.setTenSP(rs.getString("TENSP"));
                sanpham.setSoLuong(rs.getInt("SOLUONG"));
                sanpham.setMaLoai(rs.getString("MALOAI"));              
                sanpham.setDonGia(rs.getFloat("DONGIA"));
                
                return sanpham;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }

public ArrayList<Object> docDSLoaiSP() throws Exception{
	
    ArrayList<Object> dslsp = new ArrayList<Object>();

    String qry = "Select * From LoaiSanPham";
    ResultSet rs = MyConn.excuteQuery(qry);

    while(rs.next()){
        String[] loai = {rs.getString(1), rs.getString(2)};
        dslsp.add(loai);
    }
        return dslsp;
}

 }
