<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="br.fiap.contato.util.Util"%>
<%@page import="br.fiap.contato.dao.ContatoDAO"%>
<%@page import="br.fiap.contato.modelo.Contato"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>

</head>
<body>

	<div class="container">	
		<table class="bordered striped centered highlight responsive-table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Telefone</th>
				<th>Data de Nascimento</th>
				<th>Ação</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<Contato> lista = new ContatoDAO().listar();
				Util util = new Util();
				DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");				
				for (Contato contato : lista) {
					String data = formato.format(contato.getDataNascimento());
			%>
			<tr>
				<td><%=contato.getId()%></td>
				<td><%=contato.getNome()%></td>
				<td><%=contato.getEmail()%></td>
				<td><%=contato.getTelefone()%></td>
				<td><%=data%></td>
				<td><a href="form/formAlterar.jsp?id=<%=contato.getId()%>">
					<button class="btn waves-effect waves-teal" type="submit">Alterar<i class="material-icons right">send</i></button></a>
				</td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>	
	
	<a href="index.jsp">		
		<button class="btn waves-effect waves-ligth red" type="submit">Sair</button>
	</a>
	<!--  
	<form method="post" action="alterar">
		<p align="center">
		<button class="btn waves-effect waves-ligth red" type="submit">Sair</button>
	</form>
	-->
	</div>



</body>
</html>