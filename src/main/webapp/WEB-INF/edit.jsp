<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit My Task</title>
</head>
<body>
<h1>Edit Expense</h1><a href="/">Go back</a>
<br>
<div>
<h1>Expense</h1>
<form:form action="/expense/edit/${expense.id}" method="Post" modelAttribute="expense">
<input type="hidden" name="_method" value="PUT" />

	<div>
		<form:label path="expenseName">Expense: </form:label><br />
		<form:errors path="expenseName" class="text-danger"/>
		<form:input path="expenseName"/>
	</div>

	<div>
		<form:label path="vendor">Vendor: </form:label><br />
		<form:errors path="vendor" class="text-danger"/>
		<form:input path="vendor"/>
	</div>
	
	<div>
		<form:label path="amount">amount: </form:label><br />
		<form:errors path="amount" class="text-danger"/>
		<form:input type="amount" step="1" min="0" max="5" path="amount"/>
	</div>
	
	<div>
		<form:label path="description">Description: </form:label><br />
		<form:errors path="description" class="text-danger"/>
		<form:textarea rows="3" path="description"/>
	</div>
	
	<div>
		<input type="submit" value="Submit"/>
	</div>
	
	

</form:form>
</div>

</body>
</html>