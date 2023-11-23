<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

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
    <h2>Editar Tarefas</h2>
        <c:set var="taskId" value="${param.taskId}"></c:set>
    <form action="../taskEditor" method="post" class="form">
        <input type="hidden" name="taskId" value="${taskId}">
        <label for="title">Título da Tarefa: </label>
        <input type="text" name="title" value="${task.title}" required>
        <br>
        <label for="description">Descrição da Tarefa: </label>
        <textarea name="description" required>${task.description}</textarea>
        <br>
        <label for="dueDate">Data de Vencimento: </label>
        <input type="date" name="dueDate" value="${task.dueDate}" required>
        <br>
        <label for="completed">Concluída:</label>
        <input type="checkbox" name="completed" <c:if test="${task.completed}">checked</c:if>>
        <br>
        <button type="submit">Salvar</button>
        <br>
    </form>
    <footer style="text-align: center;">
		<a href="listTask.jsp">
		<button type="submit">Voltar</button>
		</a>
		</footer>
    </div>
</body>

</html>