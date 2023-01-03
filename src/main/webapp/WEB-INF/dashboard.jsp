<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense</title>
</head>
<body>
<table>
<thead>
      <tr>
          <td>Expense</td>
          <td>Vendor</td>
          <td>Amount</td>
         </tr>
</thead>
<tbody>
  <c:forEach var="expense" items="${expenses}">
			<tr>
				<td><a href="/expense/show/${expense.id}"> <c:out value="${expense.expenseName}"/></a></td>				
				<td><c:out value="${expense.vendor}"/></td>
				<td><c:out value="${expense.amount}"/></td>
				<td> <a href ="/expense/edit/${expense.id}">Edit</a></td>
				<td>
				<form action="/expense/delete/${expense.id}" method="post">
    			<input type="hidden" name="_method" value="delete">
    			<input type="submit" value="Delete">
				</form>
				</td>
				
			</tr>
	</c:forEach>
  </tbody>
</table>
<h1>Add Expense</h1>

<form:form action="/expense/add" method="post" modelAttribute="expense">
 <form:label path="expenseName" >Expense:</form:label >
   <form:errors path="expenseName"/>
  <form:input type="text" path="expenseName"></form:input><br>
  
  <form:label path="vendor">Vendor:</form:label>
   <form:errors path="vendor"/>
  <form:input type="text" path="vendor"></form:input><br>
  
  <form:label path="amount">Amount:</form:label>
   <form:errors path="amount"/>
  <form:input type="text" path="amount"></form:input><br>
  
  <form:label path="description">Description:</form:label><br>
  <form:errors path="description"/>
  <form:input type="text" path= "description"></form:input> <br>
  <button type="submit">submit</button>

 
  </form:form>
</body>
