<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Expense Details</h1><a href="/">return</a>
<h3>Expense Name:<c:out value="${expense.expenseName}"/></h3>
<h3>Expense Description: <c:out value="${expense.description}"/> </h3>
<h3> Vendor: <c:out value="${expense.vendor}"/></h3>
<h3> Amount spent: <c:out value="${expense.amount}"/></h3>


</body>
</html>