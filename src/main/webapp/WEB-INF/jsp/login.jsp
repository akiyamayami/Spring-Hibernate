<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="static/CSS/login.css" rel="stylesheet"/>
</head>
<body>
	<div class="login">
	  <div class="login-triangle"></div>
	  
	  <h2 class="login-header">Log in</h2>
		
	  <form class="login-container" action="/login" method="POST">
	    <p><input type="text" name="id" placeholder="ID"></p>
	    <p><input type="password" name="password" placeholder="Password"></p>
	    <c:if test="${param.error != null}">
			<p style="color:red;">Sai mật khẩu hoặc tài khoản</p>
		</c:if>
	    <p><input type="submit" value="Log in"></p>
	   	 <p><a href="/">Back to Home</a></p>
	  </form>
	</div>
</body>
</html>