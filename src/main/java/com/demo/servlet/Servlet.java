package com.demo.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.model.SanPhamDAO;
import com.demo.model.SanPhamDTO;
import com.demo.service.ProductListLocal;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet(urlPatterns={"/", "/delete", "/list", "/update", "/new", "/insert", "/edit"})
public class Servlet extends HttpServlet {
	
	@EJB
	ProductListLocal productService;
		
	private static final long serialVersionUID = 1L;
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet(){
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		String action = request.getServletPath();
		int caseNum = 0;
		
		if(action.equalsIgnoreCase("/new"))
			caseNum = 1;
		if(action.equalsIgnoreCase("/edit"))
			caseNum = 2;
		if(action.equalsIgnoreCase("/insert"))
			caseNum = 3;
		if(action.equalsIgnoreCase("/delete"))
			caseNum = 4;
		if(action.equalsIgnoreCase("/update"))
			caseNum = 5;
		
        try {
            switch (caseNum) {
            case 1:
                showNewForm(request, response);
                break;
            case 2:
                showEditForm(request, response);
                break;
            case 3:
                insertProduct(request, response);
                break;
            case 4:
                deleteProduct(request, response);
                break;
            case 5:
                updateProduct(request, response);
                break;
            default:
                listProduct(request, response);
                break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        
    	//goi service lay ds san pham
    	ArrayList<Object> listProduct = productService.fetchProduct();

    	//gui danh sach san pham len jsp
        request.setAttribute("listProduct", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProductList.jsp");
        dispatcher.forward(request, response);
    }
 
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  	
    	ArrayList<Object> productTypeList = productService.getTypeList();
  
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProductForm.jsp");
        request.setAttribute("typeList", productTypeList);
        dispatcher.forward(request, response);
    }
 
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        SanPhamDTO existingProduct = productService.getProductByID(id);
		ArrayList<Object> productTypeList = productService.getTypeList();
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProductForm.jsp");
        request.setAttribute("product", existingProduct);
        request.setAttribute("typeList", productTypeList);
        dispatcher.forward(request, response);
 
    }
 
    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        
    	//Lay input tu jsp
    	String pname = request.getParameter("pname");
        int quantity = Integer.parseInt(request.getParameter("pquantity"));
        float price = Float.parseFloat(request.getParameter("price"));
        String ptype = request.getParameter("ptype");
        
        //tao mot DTO trung gian chua input
        SanPhamDTO newProduct = new SanPhamDTO();
        newProduct.setTenSP(pname);
        newProduct.setMaLoai(ptype);
        newProduct.setDonGia(price);
        try {
			newProduct.setSoLuong(quantity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        //goi service gui input ve CSDL
        productService.insertProduct(newProduct);
        response.sendRedirect("list");
    }
 
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String id = request.getParameter("id");
        String pname = request.getParameter("pname");
        int quantity = Integer.parseInt(request.getParameter("pquantity"));
        float price = Float.parseFloat(request.getParameter("price"));
        String ptype = request.getParameter("ptype");
 
        SanPhamDTO newProduct = new SanPhamDTO(id, pname, quantity, price, ptype);
        productService.updateProduct(newProduct);
        response.sendRedirect("list");
    }
 
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String id = request.getParameter("id");
 
        productService.deleteProduct(id);
        response.sendRedirect("list");
    }
	
}
