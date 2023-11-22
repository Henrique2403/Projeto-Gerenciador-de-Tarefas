<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Manager</title>
</head>
<body>
	<h1>Registro de Usuário</h1>
	<form action="../userControl" method="post">
		<label for="username">Nome de Usuário: </label>
		<input type="text" name="username" required>
		<br>
		<label for="password">Senha: </label>
		<input type="password" name="password" required>
		<br>
		<label for="email">E-mail: </label>
		<input type="email" name="email" required>
		<br>
		<button type="submit">Registrar</button>
		<br>
		<a href="../index.jsp">
		<button type="button">Voltar</button>
		</a>
	</form>

</body>
</html>