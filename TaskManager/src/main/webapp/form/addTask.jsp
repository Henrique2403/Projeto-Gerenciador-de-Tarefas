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
	<h1>Adicionar Tarefas</h1>
	<form action="../addTask" method="post">
	<c:if test="${not empty erroAddTask}">
        <p class="error">${erroAddTask}</p>
    </c:if>
        <input type="hidden" name="taskId" value="${taskId}">
		<label for="title">Título da Tarefa: </label>
		<input type="text" name="title" required>
		<br>
		<label for="description">Descrição da Tarefa: </label>
		<textarea name="description" required></textarea>
		<br>
		<label for="dueDate">Data de Vencimento: </label>
		<input type="date" name="dueDate" required>
		<br>
		<button type="submit">Adicionar Tarefa</button>
		<br>
		<a href="../hub.jsp">
		<button type="button">Voltar</button>
		</a>
	</form>

</body>
</html>