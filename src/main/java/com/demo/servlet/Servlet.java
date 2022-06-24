package com.demo.servlet;

import static java.lang.Integer.parseInt;

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

import org.json.JSONException;
import org.json.JSONObject;

import com.demo.model.SanPhamDTO;
import com.demo.service.ProductListLocal;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet(urlPatterns={"/", "/delete", "/list", "/update", "/new", "/insert", "/edit"})
public class Servlet extends HttpServlet {
			
	private static final long serialVersionUID = 1L;
 
	@EJB
	ProductListLocal productService;
	
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
		doPost(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String id = request.getParameter("id");
			if(id == null || id.equals("")) {
				String pname = request.getParameter("pname");
				if(pname == null || pname.equals("")) {
					listProduct(request, response);
				}
				else insertProduct(request, response);
			}
			else {
				String pname = request.getParameter("pname");
				if(pname == null || pname.equals("")) {
					String edit = "";
					edit = request.getParameter("edit");
					if(edit != null && edit.equals("yes")) {
						showEditForm(request, response);
					}
					else deleteProduct(request, response);
				}
				else updateProduct(request, response);
			}
		} catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}

    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        
    	//goi service lay ds san pham
    	ArrayList<SanPhamDTO> listProduct = productService.fetchProduct();
    	ArrayList<SanPhamDTO> productTypeList = productService.getTypeList();

    	//gui danh sach san pham len jsp
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("typeList", productTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProductList.jsp");
        dispatcher.forward(request, response);
    }
 
//    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {  	
//    	ArrayList<SanPhamDTO> productTypeList = productService.getTypeList();
//  
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProductForm.jsp");
//        request.setAttribute("typeList", productTypeList);
//        dispatcher.forward(request, response);
//    }
// 
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
    	response.setContentType("application/json");
    	
        String id = request.getParameter("id");
        SanPhamDTO existingProduct = productService.getProductByID(id);
        
        JSONObject jsonProduct = new JSONObject();
        try {
			jsonProduct.put("id", id);
			jsonProduct.put("pname", existingProduct.getTenSP());
			jsonProduct.put("pquantity", existingProduct.getSoLuong());
			jsonProduct.put("price", existingProduct.getDonGia());
			jsonProduct.put("ptype", existingProduct.getMaLoai());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        response.getWriter().write(jsonProduct.toString());
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
        	newProduct.setMaSP(taoMaSP());
			newProduct.setSoLuong(quantity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        //goi service gui input ve CSDL
        productService.insertProduct(newProduct);
        
        String table = getProductTable();
        response.setContentType("text/html");
        response.getWriter().write(table);
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
        
        String table = getProductTable();
        response.setContentType("text/html");
        response.getWriter().write(table);
    }
 
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String id = request.getParameter("id");
 
        productService.deleteProduct(id);
        
        String table = getProductTable();
        response.setContentType("text/html");
        response.getWriter().write(table);
    }
	
    public String getProductTable() {
    	String table = "            <caption> List of Products </caption>"
    			+ "            <tr>"
    			+ "                <th>ProductID</th>"
    			+ "                <th>ProductName</th>"
    			+ "                <th>Quantity</th>"
    			+ "                <th>Price</th>"
    			+ "                <th>Action</th>"
    			+ "            </tr>";
    	
    	ArrayList<SanPhamDTO> list = productService.fetchProduct();
    	
    	for(SanPhamDTO sp : list) {
    		table +="<tr>" + sp.toString() + "<td> <button class=\"editToggle\" value=\"" + sp.getMaSP() + "\"> Edit </button> <button class=\"deleteToggle\" value=\"" + sp.getMaSP() + "\" onClick=\"return confirmDel()\"> Delete </button>" + "</td></tr>";
    	}
    	
    	return table;
    }
    
	 public String taoMaSP() throws Exception{
	        ArrayList<SanPhamDTO> DSSanPham = productService.fetchProduct();
	        
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
