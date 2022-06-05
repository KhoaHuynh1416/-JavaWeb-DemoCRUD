<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products List</title>
<script>
	function confirmDel(){
		return confirm("Make sure you want to remove this product.");
	}
</script>
</head>
<body>
    <div align="center">
        <h1>Products Management</h1>
        <h2>
            <a href= "${pageContext.request.contextPath}/new">Add New Product</a>
            &nbsp;&nbsp;&nbsp;
            <a href= "${pageContext.request.contextPath}/list">List All Products</a>
        </h2>
    </div>
    <div align="center">
        <table border="1" cellpadding="5">
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
                        <a href="${pageContext.request.contextPath}/edit?id=<c:out value='${product.getMaSP()}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/delete?id=<c:out value='${product.getMaSP()}' />" onClick="return confirmDel()">Delete</a>                     
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>   
</body>
</html>