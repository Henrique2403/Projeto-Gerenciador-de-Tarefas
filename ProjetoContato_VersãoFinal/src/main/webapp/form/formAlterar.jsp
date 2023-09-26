<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="br.fiap.contato.util.Util"%>
<%@page import="br.fiap.contato.dao.ContatoDAO"%>
<%@page import="br.fiap.contato.modelo.Contato"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
</head>
<body>
	<div class="container">
		<div class="content">

			<!--FORMULÁRIO DE ALTERAÇÃO-->
			<div id="cadastro">
				<form method="post" action="../alterar">
					<h1>Alteração de Dados</h1>
					<%
					Integer id = Integer.parseInt(request.getParameter("id"));
					Contato contato = new ContatoDAO().pesquisarId(id);					
					
					%>
					<p>
						<input id="id" name="id" type="hidden" value=<%=contato.getId()%>>
					</p>

					<p>
						<label for="nome">Nome</label> 
						<input id="nome" name="nome" type="text" value="<%=contato.getNome()%>" />
					</p>

					<p>
						<label for="email">Email</label> <input id="email" name="email"
							type="email" value="<%=contato.getEmail()%>" />
					</p>

					<p>
						<label for="senha">Senha</label> <input id="senha" name="senha"
							type="password" value="" />
					</p>

					<p>
						<label for="fone">Telefone</label> <input id="fone" name="fone"
							type="text" value="<%=contato.getTelefone()%>" />
					</p>

					<p>
						<label for="data">Data Nascimento</label> <input id="data"
							name="data" type="date" value=<%=contato.getDataNascimento()%> />
					</p>

					<p>
						<input type="submit" value="Alterar" />
					</p>

				</form>
			</div>
		</div>
	</div>

</body>
</html>