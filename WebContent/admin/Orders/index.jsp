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
	<h3>orders List</h3>
	<table border="1">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Date creation</td>
			<td>Status</td>
			<td>Option</td>
		</tr>
		<c:forEach var="order" items="${orders }">
			<tr>
				<td>${order.id }</td>
				<td>${order.name }</td>
				<td>${order.datecreation }</td>
				<td>
					<c:if test="${order.status == false }">
						<a href="Orders?action=update&id=${order.id }" 
							onclick="return confirm('Are you sure?')">No Pay</a>
					</c:if>
					<c:if test="${order.status == true }">
						Pay
					</c:if>
				</td>
				<td><a href="Orders?action=detail&id=${order.id }">Detail</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>