<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Cart Info</h3>
	<table border="1">
		<th>Id</th>
		<th>Name</th>
		<th>Photo</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Sub Total</th>
	
	<c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
		<tr>
			<td align="center"><a href="Cart?action=delete&index=${i.index }">X</a></td>
			<td>${item.product.id }</td>
			<td>${item.product.name }</td>
			<td><img width="100" height="100" src="images/${item.product.photo }"></td>
			<td>${item.product.price }</td>
			<td>${item.product.quantity }</td>
			<td>${item.product.price * item.product.quantity }</td>
		</tr>
	</c:forEach>
	</table>
	<a href="Product">Countinue Shopping</a> |
	<c:if test="${sessionScope.username == null }">
		<a href="Cart?action=checkout">Login to Check Out</a>
	</c:if>
	<c:if test="${sessionScope.username != null }">
		<form action="${initParam['posturl'] }" method="post">
		
			<!-- Cau hinh cho thanh toan -->
			<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif">
			<input type="hidden" name="upload" value="1">
			<input type="hidden" name="cmd" value="_cart">
			<input type="hidden" name="return" value="${initParam['returnurl'] }">
			<input type="hidden" name="business" value="${initParam['business'] }">
			
			<!-- Thong tin san pham cho thanh toan -->
			<c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
				<input type="hidden" name="item_number_${i.index + 1 }" value="${item.product.id }">
				<input type="hidden" name="item_name_${i.index + 1 }" value="${item.product.name }">
				<input type="hidden" name="amount_${i.index + 1 }" value="${item.product.price }">
				<input type="hidden" name="quantity_${i.index + 1 }" value="${item.quantity }">
			</c:forEach>
		</form>		
	</c:if>
	
</body>
</html>