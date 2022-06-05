/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.model;

/**
 *
 * @author PC
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MyConnection {
    String Host = "";
    String UserName = "";
    String Password = "";
    String DataBase ="";
    
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
    
    public MyConnection(String host, String username, String pw, String db){
        Host = host;
        UserName = username;
        Password = pw;
        DataBase = db;
    }
    
    public void Close() throws Exception{
        if(rs != null && !rs.isClosed()){
            rs.close();
            rs = null;
        }
        
        if(st != null && !st.isClosed()){
            st.close();
            st = null;
        }
        
        if(conn != null && !conn.isClosed()){
            conn.close();
            conn = null;
        }
    }
    
    protected void driverTest() throws Exception{
            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("com.mysql.jdbc.Driver");
    }
    
    protected Connection getConnect() throws Exception{
        if(conn == null){
            driverTest();            
            String url = "jdbc:mysql://"+ Host + ":3306/" + DataBase;            
                conn = DriverManager.getConnection(url,UserName,Password);
        }  
        
        return conn;
    }
    
    protected Statement getStatement() throws Exception{
        if(st == null ?true : st.isClosed()){
            st = this.getConnect().createStatement();
        }
        
        return st;
    }
    
    public ResultSet excuteQuery(String qry) throws Exception{
            rs = getStatement().executeQuery(qry);
       
        return rs;
    }
    
    public int excuteUpdate(String qry) throws Exception{
        int res = Integer.MIN_VALUE;
        
        res = getStatement().executeUpdate(qry);
        this.Close();
        
        return res;
    }
    
}