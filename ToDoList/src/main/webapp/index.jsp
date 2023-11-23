<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Manager</title>

<link rel="stylesheet" href="css/style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

</head>
<body>
	<div class="circle"></div>
	<div class="card">
	<div class="logo">
			<i class="bi bi-list-check"></i>
		</div>
	<h2>Login de Usuário</h2>
	<form action="./authControl" method="post" class="form">
		<c:if test="${not empty erroLogin}">
        <p class="error">${erroLogin}</p>
    </c:if>
		<label for="username">Nome de Usuário: </label>
		<input type="text" name="username">
		<br>
		<label for="password">Senha: </label>
		<input type="password" name="password">
		<br>
		<button type="submit">Entrar</button>
		<br>
	</form>
	<footer style="text-align: center;">
		Registre-se
		<a href="form/register.jsp"> aqui</a>
	</footer>
</div>
	
</body>
</html>
