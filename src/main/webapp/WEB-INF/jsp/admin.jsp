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
<nav class="navbar navbar-inverse">
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
				<li class="active"><a href="/admin">Chỉnh Sữa News</a></li>
				<li><a href="/odernews">Các Trang còn lại</a></li>
				<li><a href="/accountmanager">Quản lý Account</a></li>
			</ul>
			<a href="/logout" class="btn btn-primary navbar-right">Logout</a>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<div class="container">
	<c:choose>
		<c:when test='${MODE == "MODE_HOME"}'>
			<a href="/themnew" class="btn btn-primary">Thêm</a>
			<div class="row"></div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tiêu Đề</th>
						<th>Ngày Đăng</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${news}" var="item">
						<tr>
							<th scope="row">${item.id}</th>
							<td>${item.tieude}</td>
							<td>${item.date}</td>
							<td><a href='/chinhsuanew-${item.id}'><span class="glyphicon glyphicon-pencil"></span></a></td>
							<td><a href='/deletenew-${item.id}'><span class="glyphicon glyphicon-trash"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:when test='${MODE == "MODE_ADD" || MODE == "MODE_EDIT"}'>
			<div class="row"></div>
			<form:form class="form-horizontal" method="post" modelAttribute="news" action="/themnew" enctype="multipart/form-data">
				<form:input type="hidden" path="id" id="id"/>
				<div class="form-group">
					<label class="col-sm-2 control-label">Tiêu Đề</label>
					<div class="col-sm-9">
						<form:input type="text" path="tieude" class="form-control" placeholder="Tiêu Đề" />
						<div class="has-error">
                        	<form:errors class="control-label" path="tieude"/>
                        </div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Nội Dung</label>
					<div class="col-sm-9">
						<form:textarea id="noidung" path="noidung" style="resize:none;" class="form-control" rows="10"/>
						<div class="has-error">
                        	<form:errors class="control-label" path="noidung"/>
                        </div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Ngày Đăng</label>
					<div class="col-sm-9">
						<form:input path="date" type="date" id="datePicker" class="form-control"/>
						<div class="has-error">
                        	<form:errors class="control-label" path="date"/>
                        </div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Ảnh</label>
					<div class="col-sm-9">
						<form:input type="file" id="fileanh" path="hinhanh" name="hinhanh" class="form-control" accept="image/*"/>
						<div class="has-error">
                        	<form:errors class="control-label" path="hinhanh"/>
                        </div>
						<img id="srcanh" src="<c:out value="${news.hinhanh}"/>" height="100px" width="100px">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">File</label>
					<div class="col-sm-9">
						<form:input type="file" id="file" path="file" name="file" class="form-control"/>
						<div class="has-error">
                        	<form:errors class="control-label" path="file"/>
                        </div>
						<a id ="hreffile" href="<c:out value="${news.file}"/>" download>
							<c:if test="${news.file != null}">File</c:if>
						</a>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Save</button>
					</div>
				</div>
			</form:form>
			<script type="text/javascript">
				function readURL(input) {
				    if (input.files && input.files[0]) {
				        var reader = new FileReader();

				        reader.onload = function (e) {
				            $('#srcanh').attr('src', e.target.result);
				        }

				        reader.readAsDataURL(input.files[0]);
				    }
				}
				CKEDITOR.replace( 'noidung' );
				$(document).ready(function() {
					$("#fileanh").change(function(){
					    readURL(this);
					});
					$('#file').change(function(){
						$('#hreffile').attr('href', this.value);
						$('#hreffile').text('File');
					})
				})

			</script>
		</c:when>
	</c:choose>
	
</div>
</body>
</html>