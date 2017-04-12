<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script type="text/javascript" src="http://cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
	.row{
		margin-top:5px;
		margin-bottom:5px;
		width:100%;
		border: 1px solid black;
	}
	#Text{
		text-align: center;
	}
</style>
</head>
<body>
<nav class="navbar navbar-inverse" >
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
			<a class="navbar-brand" href="/">Home</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li ><a href="/admin">Chỉnh Sữa News</a></li>
				<li ><a href="/odernews">Các Trang còn lại</a></li>
				<li class="active"><a href="/accountmanager">Quản lý Account</a></li>
			</ul>
			<a href="/logout" class="btn btn-primary navbar-right">Logout</a>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<div class="container">
	<c:choose>
		<c:when test='${MODE == "MODE_HOME"}'>
			<a href="/themaccount" class="btn btn-primary">Thêm</a>
			<div class="row"></div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Password</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${account}" var="item">
						<tr>
							<th scope="row">${item.id}</th>
							<td>${item.password}</td>
							<td><a href='/chinhsuaaccount-${item.id}'><span class="glyphicon glyphicon-pencil"></span></a></td>
							<td><a href='/deleteaccount-${item.id}'><span class="glyphicon glyphicon-trash"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:when test='${MODE == "MODE_ADD"}'>
			<div class="row"></div>
			<form:form class="form-horizontal" action="/themaccount" modelAttribute="user" method="POST">
				<div class="form-group">
					<label class="col-sm-2 control-label">ID</label>
					<div class="col-sm-9">
						<form:input id="id" path="id" class="form-control" placeholder="ID"/>
						<div class="has-error">
                        	<form:errors class="control-label" path="id"/>
                        </div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Password</label>
					<div class="col-sm-9">
						<form:input id="password" path="password" class="form-control" placeholder="Password"/>
						<div class="has-error">
                        	<form:errors class="control-label" path="password"/>
                        </div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Save</button>
					</div>
				</div>
			</form:form>
		</c:when>
		<c:when test='${MODE == "MODE_EDIT"}'>
			<div class="row"></div>
			<form:form class="form-horizontal" action="/chinhsuaaccount" modelAttribute="user" method="POST">
				<form:input id="id" path="id" type="hidden" class="form-control" placeholder="ID"/>
				<div class="form-group">
					<label class="col-sm-2 control-label">Password</label>
					<div class="col-sm-9">
						<form:input id="password" path="password" class="form-control" placeholder="Password"/>
						<div class="has-error">
                        	<form:errors class="control-label" path="password"/>
                        </div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Save</button>
					</div>
				</div>
			</form:form>
		</c:when>
	</c:choose>
</div>
</body>
</html>