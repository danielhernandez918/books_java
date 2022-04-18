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
			<h1>Change Your Entry</h1>
			<a href="/books"> back to the shelves</a>
		</div>
		<form:form action="/books/${book.id }/edit" method="post" modelAttribute="book">
		<input type="hidden" name="_method" value="put" />
		<form:hidden path="poster" value="${book.poster.id }" />
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
				<form:textarea rows="4" cols="30" path="description"/>
				<form:errors path="description" style="color: red"/>
			</p>
			<input type="submit" value="Update"/>
		</form:form>
	</div>
	
<body>
</html>