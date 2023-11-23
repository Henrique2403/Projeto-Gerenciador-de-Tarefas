<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Manager</title>

<link rel="stylesheet" href="../css/style.css">

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
	<h2>Registro de Usuário</h2>
		<form action="../userControl" method="post" class="form">
			<label for="username">Nome de Usuário: </label>
			<input type="text" name="username" required>
			<br>
			<label for="email">E-mail: </label>
			<input type="email" name="email" required>
			<br>
			<label for="password">Senha: </label>
			<input type="password" name="password" required>
			<br>
			<button type="submit">Registrar</button>
	</form>
	<footer style="text-align: center;">
		Usuário existente, faça login
		<a href="../index.jsp">aqui</a>
		</footer>
	</div>

</body>
</html>