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
	<fieldset>
		<legend>Customer info</legend>
		<table>
			<tr>
				<td>Name</td>
				<td>${order.account.username }</td>
			</tr>
			<tr>
				<td>Date Creation</td>
				<td>${order.account.fullname }</td>
			</tr>
			<tr>
				<td>Status</td>
				<td>${order.account.email }</td>
			</tr>
		</table>
	</fieldset>

	<fieldset>
		<legend>Product List</legend>
		<table border="1">
			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Price</td>
				<td>Description</td>
				<td>Photo</td>
				<td>Quantity</td>
				<td>Sub Total</td>
			</tr>
		
		<c:set var="s" value="0"></c:set>
		<c:forEach var="orderDetail" items="${order.ordersdetails }">
			<c:set value=""></c:set>
			<tr>
				<td>${orderDetail.id.productid }</td>
				<td>${orderDetail.product.name }</td>
				<td>${orderDetail.price }</td>
				<td>${orderDetail.product.description }</td>
				<td><img width="400" height="300" src="${pageContext.request.contextPath }/images/${orderDetail.product.photo }"></td>
				<td>${orderDetail.quantity }</td>
				<td>${orderDetail.price * orderDetail.quantity }</td>
			</tr>
		</c:forEach>
		<%-- <tr>
			<td colspan="5">Sum</td/>
			<td>${s }</td>
		</tr> --%>
		</table>
		<a href="Orders">Back</a>
	</fieldset>
</body>
</html>