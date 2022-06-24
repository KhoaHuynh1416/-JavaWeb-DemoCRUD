package com.demo.model;

import java.util.ArrayList;

import org.hibernate.Session;
import java.util.List;

/**
 * 
 * @author PC
 *
 */
public class SanPhamDAO {

    private ArrayList <SanPhamDTO> listOfProduct;
    private ArrayList <SanPhamDTO> listOfType;
    
	public void them(SanPhamDTO sp) {
            // start a transaction
        	Session session = HiberConnection.getSessionFactory().openSession();
            session.beginTransaction();
            // save the new SanPhamDTO
            session.save(sp);
            // commit transaction
            session.getTransaction().commit();
            session.close();
    }

    public void sua(SanPhamDTO sp) {
        // start a transaction
    	Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
        // update the existed SanPhamDTO with new data
        session.update(sp);
        // commit transaction
        session.getTransaction().commit();
        session.close();
    }

    public void xoa(String masp) {
        // start a transaction
    	Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
        // get SanPhamDTO by ID, then delete
        SanPhamDTO sp = session.get(SanPhamDTO.class, masp);
        if (sp != null) {
            session.delete(sp);              
        }
     // commit transaction
        session.getTransaction().commit();
        session.close();
    }

    public SanPhamDTO getSanphamByMaSP(String masp) {

        // start a transaction
    	Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
        // Delete a user SanPhamDTO
        SanPhamDTO sp = session.get(SanPhamDTO.class, masp);
     // commit transaction
        session.getTransaction().commit();
        session.close();
        
        return sp;
    }

    @SuppressWarnings("unchecked")
    public ArrayList <SanPhamDTO> docDSLoaiSP() {

        listOfType = new ArrayList<SanPhamDTO>();
        
        Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
     
        List<SanPhamDTO> temp = session.createQuery("SELECT t from TypeDTO t").getResultList();
        listOfType.addAll(temp);
     
        session.getTransaction().commit();
        session.close();
        
        return listOfType;
    }
    
    @SuppressWarnings("unchecked")
    public ArrayList <SanPhamDTO> docDSSP() {

        listOfProduct = new ArrayList<SanPhamDTO>();
        
        Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
     
        List<SanPhamDTO> temp = session.createQuery("SELECT s from SanPhamDTO s").getResultList();
        listOfProduct.addAll(temp);
     
        session.getTransaction().commit();
        session.close();
  
        return listOfProduct;
    }
}