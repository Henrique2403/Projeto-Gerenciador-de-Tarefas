<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Manager</title>
</head>
<body>
	<h1>Login de Usuário</h1>
	<form action="./authControl" method="post">
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
		<a href="form/register.jsp">
        <button type="button">Novo Usuário</button>
    	</a>
	</form>
	
</body>
</html>