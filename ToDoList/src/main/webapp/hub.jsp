<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<h2 style="text-align: center;"	>Gerenciador de Tarefas</h2>
		<div class="card2">
			<a href="form/addTask.jsp">
				<button type="submit">Nova Tarefa</button>
			</a>
			<a href="form/listTask.jsp">
				<button type="submit">Ver tarefas</button>
			</a>
		</div>
	</div>

</body>
</html>