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
		<div class="d-flex justify-content-between align-items-center">
			<h1>Welcome, ${userName}</h1>
			<a href="/logout"> logout</a>
		</div>
		<div class="d-flex justify-content-between align-items-center">
			<h3>Books from everyone's shelves:</h3>
			<a href="/books/new">+Add a book to my shelf</a>
		</div>
		<table class="table">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>Title</th>
		            <th>Author</th>
		            <th>Posted By</th>
		        </tr>
		    </thead>
		    <tbody>
				<c:forEach var="book" items="${books}">
         			 <tr>
         			     <td><c:out value="${book.id}"/></td>
         			     <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
						 <td><c:out value="${book.author}"/></td>
						 <td><c:out value="${book.poster.userName}"/></td>
         			 <tr>
     			</c:forEach>
		    </tbody>
		</table>
	</div>
<body>
</html>