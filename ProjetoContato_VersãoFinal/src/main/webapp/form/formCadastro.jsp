<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>

	<div class="container">
		<div class="content">
		
			<!--FORMULÁRIO DE CADASTRO-->
			<div id="cadastro">
				<form method="post" action="../cadastro">
					<h1>Cadastro</h1>

					<p>
						<label for="nome">Nome</label> 
						<input id="nome" name="nome" required="required" type="text" placeholder="nome" />
					</p>

					<p>
						<label for="email">Email</label> 
						<input id="email" name="email" required="required" type="email" placeholder="contato@htmlecsspro.com" />
					</p>

					<p>
						<label for="senha">Senha</label> 
						<input id="senha" name="senha" required="required" type="password" placeholder="senha" />
					</p>

					<p>
						<label for="fone">Telefone</label> 
						<input id="fone" name="fone" required="required" type="text" placeholder="ex. (11) 9 9999-1234" />
					</p>

					<p>
						<label for="data">Data Nascimento</label> <input id="data"
							name="data" required="required" type="date"
							placeholder="ex. 10/06/1990" />
					</p>

					<p>
						<input type="submit" value="Cadastrar" />
					</p>

				</form>
			</div>
		</div>
	</div>

</body>
</html>