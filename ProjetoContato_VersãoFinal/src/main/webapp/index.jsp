<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/estilo.css" />
</head>
<body>
	<div class="container">
		<div class="content">
			<!--FORMULÁRIO DE LOGIN-->
			<div id="cadastro">
				<form method="post" action="listagem">
					<h1>Login</h1>

					<p>
						<label for="email">Email</label> <input id="email" name="email"
							required="required" type="text"
							placeholder="contato@contato.com.br" />
					</p>

					<p>
						<label for="senha">Senha</label> <input id="senha" name="senha"
							required="required" type="password" placeholder="senha" />
					</p>
					<p>
						<input type="submit" value="Entrar" />
					</p>

					<p align="center">
						<a href="form/formCadastro.jsp">Ainda não sou cadastrado</a>
					</p>

				</form>
			</div>
		</div>
	</div>
</body>
</html>