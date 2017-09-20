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
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Photo</th>
			<th>Option</th>
		</tr>
		<c:set var="s" value="0"></c:set>
		<c:forEach var="p" items="${products }" varStatus="i">
			<tr>
				<td>${p.id }</td>
				<td>${p.name }</td>
				<td>${p.price }</td>
				<td>${p.quantity }</td>
				<td><img width="100" height="100" src="images/${p.photo }"></td>
				<td><a href="Cart?action=buy&id=${p.id }">Buy Now</a></td>
			</tr>

		</c:forEach>
		<tr>
			<td colspan="6" align="right">Sum</td>
			<td>${s }</td>

		</tr>
	</table>
</body>
</html>