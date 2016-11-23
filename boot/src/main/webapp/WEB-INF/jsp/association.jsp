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
<title>Association</title>
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/style.css">
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="association">Association</a></li>
					<li><a href="new-association">New Association</a></li>
					<li><a href="all-associations">All Association</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_ASSOCIATION'}">
			<div class="container">
				<div class="jumbotron text-center" id="homeDiv">
					<h1>Welcome to Association Manager</h1>
				</div>
			</div>
		</c:when>
			
		<c:when test="${mode=='MODE_ASSOCIATIONS'}">
			<div class="container text-center" id="associationsDiv">
				<h3>My Associations</h3>
				<hr />
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Term Id</th>
								<th>Gene Product Id</th>
								<th>Is Not</th>
								<th>Role Group</th>
								<th>Assocdate</th>
								<th>Source DB Id</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="association" items="${associations}">
								<tr>
									<td>${association.id}</td>
									<td>${association.termId}</td>
									<td>${association.geneProductId}</td>
									<td>${association.isNot}</td>
									<td>${association.roleGroup}</td>
									<td>${association.assocdate}</td>
									<td>${association.sourceDbId}</td>
									<td><a href="update-association?id=${association.id}"> <span
											class="glyphicon glyphicon-pencil"></span>
									</a></td>
									<td><a href="delete-association?id=${association.id}"> <span
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
				<h3>Manage Association</h3>
				<hr />
				<form class="form-horizontal" method="POST" action="save-association">
					<input type="hidden" name="id" value="${association.id}" />
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Term ID:</label>
							<input type="text" class="form-control" name="termId"
								value="${association.termId}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Gene Product Id:</label>
							<input type="text" class="form-control" name="geneProductId"
								value="${association.geneProductId}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Is Not:</label>
							<input type="text" class="form-control" name="isNot"
								value="${association.isNot}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Role Group:</label>
							<input type="text" class="form-control" name="roleGroup"
								value="${association.roleGroup}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Assocdate:</label>
							<input type="text" class="form-control" name="assocdate"
								value="${association.assocdate}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-7">
							<label class="control-label col-sm-3">Source DB Id:</label>
							<input type="text" class="form-control" name="sourceDbId"
								value="${association.sourceDbId}" />
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