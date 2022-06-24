<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products List</title>

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script> 

<script>
	function confirmDel(){
		return confirm("Make sure you want to remove this product.");
	}
	
	$(document).ready(function() {
		    $('#addToggle').on("click", function() {
		    	$("#productForm")[0].reset();
		        $('#detailedForm').toggle();
		        $('#FormTitle').html("<h2> Add New Product </h2>");
		        
		        if($('#detailedForm').is(":hidden"))
		        	$('#addToggle').text("Add New Product");
		        else $('#addToggle').text("Close");
		    });
		    
		    $('#addBtn').on("click", function(e) {
		        $.ajax({
		        	url:"",
		        	data:{
		        		id: $('#id').val(),
		        		pname: $('#pname').val(),
		        		pquantity: $('#pquantity').val(),
		        		price: $('#price').val(),
		        		ptype: $('#ptype').val()
		        	},
		        	success: function(res){
		        		$("#productForm")[0].reset();
		        		$('#productList').html(res);
		        		$('#FormTitle').html("<h2> Add New Product </h2>");
		        	}
		        });
		        e.preventDefault();
		    });
		    
		    $('.deleteToggle').on("click", function(e) {
		        $.ajax({
		        	url:"",
		        	data:{
		        		id: $(this).val()
		        	},
		        	success: function(res){
		        		$('#productList').html(res);
		        	}
		        });
		        e.preventDefault();
		    });
		    
		    $('.editToggle').on("click", function(e) {
		        $.ajax({
		        	url:"",
		        	data:{
		        		id: $(this).val(),
		        		edit: "yes"
		        	},
		        	success: function(res){
		        		$('#detailedForm').show();
				        $('#FormTitle').html("<h2> Edit Product </h2>");
				        $('#addToggle').text("Close");
				        $('#pname').focus();
				        
				        $('#id').val(res.id);
				        $('#pname').val(res.pname);
				        $('#price').val(res.price);
				        $('#pquantity').val(res.pquantity);
				        $('#ptype').val(res.ptype);
		        	}
		        });
		        e.preventDefault();
		    });
		    
			$(document).ajaxStop(function() {			    			    
			    $('.deleteToggle').on("click", function(e) {
			        $.ajax({
			        	url:"",
			        	data:{
			        		id: $(this).val()
			        	},
			        	success: function(res){
			        		$('#productList').html(res);
			        	}
			        });
			        e.preventDefault();
			    });
			    
			    $('.editToggle').on("click", function(e) {
			        $.ajax({
			        	url:"",
			        	data:{
			        		id: $(this).val(),
			        		edit: "yes"
			        	},
			        	success: function(res){
			        		$('#detailedForm').show();
					        $('#FormTitle').html("<h2> Edit Product </h2>");
					        $('#addToggle').text("Close");
					        $('#pname').focus();
					        
					        $('#id').val(res.id);
					        $('#pname').val(res.pname);
					        $('#price').val(res.price);
					        $('#pquantity').val(res.pquantity);
					        $('#ptype').val(res.ptype);
			        	}
			        });
			        e.preventDefault();
			    });
		});
	});
	
</script>
</head>
<body>
    <div align="center">
        <h1>Products Management</h1>
        <button id="addToggle" style=font-size:20px> Add New Product </button>
    </div>
        <div id="detailedForm" align="center" style="display:none">
		<form id="productForm">
        <table border="1" cellpadding="5">
            <caption id="FormTitle">
            </caption> 
            <tr>
            	<th>ProductID: </th>
            	<td>
            		<input name="id" id="id" size="10" value="" readonly/>
            	</td>
            </tr>          
            <tr>
                <th>ProductName: </th>
                <td>
                    <input type="text" name="pname" id="pname" size="45" value=""/>
                </td>
            </tr>
            <tr>
                <th>Quantity: </th>
                <td>
                    <input type="text" name="pquantity" id="pquantity" size="5" value=""/>
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                    <input type="text" name="price" id="price" size="45" value=""/>
                </td>
            </tr>
            <tr>
                <th>Type: </th>
                <td>
                    <select name="ptype" id="ptype">
                    <c:forEach var="type" items="${typeList}">
                    <option value="${type.getMaLoai()}"> ${type.getTenLoai()} </option>
                    </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <button id="addBtn" style=font-size:16px> Save </button>
                </td>
            </tr>
        </table>
        </form>
    <br></br>
    </div>
    <div align="center">
        <table border="1" cellpadding="5" id="productList">
            <caption> List of Products </caption>
            <tr>
                <th>ProductID</th>
                <th>ProductName</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <c:forEach var="product" items="${listProduct}">
                <tr>
                    <td><c:out value="${product.getMaSP()}" /></td>
                    <td><c:out value="${product.getTenSP()}" /></td>
                    <td><c:out value="${product.getSoLuong()}" /></td>
                    <td><c:out value="${product.getDonGia()}" /></td>
                    <td>
                        <button class="editToggle" value="<c:out value='${product.getMaSP()}' />"> Edit </button>
                        <button class="deleteToggle" value="<c:out value='${product.getMaSP()}' />" onClick="return confirmDel()">Delete</button>                     
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>   
</body>
</html>