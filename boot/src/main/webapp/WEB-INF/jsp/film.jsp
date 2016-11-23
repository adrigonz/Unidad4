<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<title>Film</title>
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/style.css">
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="film">Film</a></li>
					<li><a href="new-film">New Film</a></li>
					<li><a href="all-films">All Films</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_FILM'}">
			<div class="container">
				<div class="jumbotron text-center" id="homeDiv">
					<h1>Welcome to Film Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_FILMS'}">
			<div class="container text-center" id="filmsDiv">
				<h3>My Films</h3>
				<hr />
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Gender</th>
								<th>Description</th>
								<th>Date</th>
								<th>Existence</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="film" items="${films}">
								<tr>
									<td>${film.id}</td>
									<td>${film.name}</td>
									<td>${film.gender}</td>
									<td>${film.description}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${film.date}" /></td>
									<td>${film.existence==true?'YES':'NO'}</td>
									<td><a href="update-film?id=${film.id}"> <span
											class="glyphicon glyphicon-pencil"></span>
									</a></td>
									<td><a href="delete-film?id=${film.id}"> <span
											class="glyphicon glyphicon-trash"></span>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_NEW' || mode=='MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Film</h3>
				<hr />
				<form class="form-horizontal" method="POST" action="save-film">
					<input type="hidden" name="id" value="${film.id}" />
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Name:</label>
							<input type="text" class="form-control" name="name"
								value="${film.name}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Gender:</label>
							<input type="text" class="form-control" name="gender"
								value="${film.gender}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Description:</label>
							<input type="text" class="form-control" name="description"
								value="${film.description}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Existence:</label>
							<input type="radio" class="col-sm-1" name="existence"
								value="true" />
								<div class="col-sm-1">YES</div>
							<input type="radio" class="col-sm-1" name="existence"
								value="false" checked="checked"/>
								<div class="col-sm-1">NO</div>
						</div>
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-prymary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>
		
	</c:choose>
	<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</body>
</html>