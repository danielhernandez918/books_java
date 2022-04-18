<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Read Share</title>
</head>
<body>
	<div class="container my-2">
		<div class="d-flex justify-content-between align-items-center">
			<h1>Add a Book to Your Shelf</h1>
			<a href="/books"> back to the shelves</a>
		</div>
		<form:form action="/books/create" method="post" modelAttribute="book">
		<form:hidden path="poster" value="${userId}" />
		<form:errors path="poster" style="color: red"/>
			<p class="d-flex align-items-center">
				<form:label path="title">Title: </form:label>
				<form:input path="title"/>
				<form:errors path="title" style="color: red"/>
			</p>
			<p class="d-flex align-items-center">
				<form:label path="author">Creator: </form:label>
				<form:input path="author"/>
				<form:errors path="author" style="color: red"/>
			</p>
			<p class="d-flex align-items-center">
				<form:label path="description">My thoughts: </form:label>
				<form:textarea row="4" cols="30" path="description"/>
				<form:errors path="description" style="color: red"/>
			</p>
			<input type="submit" value="Submit"/>	
		</form:form>
	</div>
	
<body>
</html>