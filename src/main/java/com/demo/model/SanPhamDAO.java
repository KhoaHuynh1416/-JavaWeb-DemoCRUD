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

    private ArrayList <Object> listOfProduct;
    private ArrayList <Object> listOfType;
    
	public void them(SanPhamDTO sp) {
            // start a transaction
        	Session session = HiberConnection.getSessionFactory().openSession();
            session.beginTransaction();
            // save the new object
            session.save(sp);
            // commit transaction
            session.getTransaction().commit();
            session.close();
    }

    public void sua(SanPhamDTO sp) {
        // start a transaction
    	Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
        // update the existed object with new data
        session.update(sp);
        // commit transaction
        session.getTransaction().commit();
        session.close();
    }

    public void xoa(String masp) {
        // start a transaction
    	Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
        // get object by ID, then delete
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
        // Delete a user object
        SanPhamDTO sp = session.get(SanPhamDTO.class, masp);
     // commit transaction
        session.getTransaction().commit();
        session.close();
        
        return sp;
    }

    @SuppressWarnings("unchecked")
    public ArrayList <Object> docDSLoaiSP() {

        listOfType = new ArrayList<Object>();
        
        Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
     
        List<Object> temp = session.createQuery("SELECT t from TypeDTO t").getResultList();
        listOfType.addAll(temp);
     
        session.getTransaction().commit();
        session.close();
        
        return listOfType;
    }
    
    @SuppressWarnings("unchecked")
    public ArrayList <Object> docDSSP() {

        listOfProduct = new ArrayList<Object>();
        
        Session session = HiberConnection.getSessionFactory().openSession();
        session.beginTransaction();
     
        List<Object> temp = session.createQuery("SELECT s from SanPhamDTO s").getResultList();
        listOfProduct.addAll(temp);
     
        session.getTransaction().commit();
        session.close();
  
        return listOfProduct;
    }
}