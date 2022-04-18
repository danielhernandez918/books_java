<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Read Share</title>
</head>
<body>
	<div class="container">
		<div class= "my-2">
			<div class="d-flex justify-content-between align-items-center">
				<h1>${book.title}</h1>
				<a href="/books"> back to the shelves</a>
			</div>
		<c:set var="user" scope="session" value="${userId}"/>
		<c:if test="${book.poster.id == user}">
			<h5>You read <span style="color: red"> ${book.title}</span> by <span style="color: green"> ${book.author}</span>.</h5>
			<p>Here are your thoughts: <br> ${book.description} </p>
			<a href="/books/${book.id}/edit"><button>Edit</button></a>
		</c:if>
		<c:if test="${book.poster.id != user}">
			<h5>${book.poster.userName} read ${book.title} by ${book.author}</h3>
			<h5>Here are ${book.poster.userName}'s thoughts:</h3>
			<p class=" border-top border-bottom border-dark">${book.description}</p>
		</c:if>
		</div>
	</div>
<body>
</html>