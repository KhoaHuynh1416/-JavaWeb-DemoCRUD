<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ProductForm</title>
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
        <c:if test="${product != null}">
            <form action="update" method="post">
        </c:if>
        <c:if test="${product == null}">
            <form action="insert" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    <c:if test="${product != null}">
                        Edit Product
                    </c:if>
                    <c:if test="${product == null}">
                        Add New Product
                    </c:if>
                </h2>
            </caption>
                <c:if test="${product != null}">
                    <input type="hidden" name="id" value="<c:out value='${product.getMaSP()}' />" />
                </c:if>           
            <tr>
                <th>ProductName: </th>
                <td>
                    <input type="text" name="pname" size="45"
                            value="<c:out value='${product.getTenSP()}' />"
                        />
                </td>
            </tr>
            <tr>
                <th>Quantity: </th>
                <td>
                    <input type="text" name="pquantity" size="5"
                            value="<c:out value='${product.getSoLuong()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                    <input type="text" name="price" size="45"
                            value="<c:out value='${product.getDonGia()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Type: </th>
                <td>
                    <select name="ptype">
                    <c:forEach var="type" items="${typeList}">
                    <c:if test="${(product==null) || product!=null && !type.getMaLoai().equalsIgnoreCase(product.getMaLoai())}">
                    <option value="${type.getMaLoai()}"> ${type.getTenLoai()} </option>
                    </c:if>
                    <c:if test="${product!=null && type.getMaLoai().equalsIgnoreCase(product.getMaLoai())}">
                    <option value="${type.getMaLoai()}" selected="selected"> ${type.getTenLoai()} </option>
                    </c:if>
                    </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save" />
                </td>
            </tr>
        </table>
        </form>
    </div>   
</body>
</html>