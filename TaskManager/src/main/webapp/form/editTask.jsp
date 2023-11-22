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
    <h1>Editar Tarefas</h1>
        <c:set var="taskId" value="${param.taskId}"></c:set>
    <form action="../taskEditor" method="post">
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
        <button type="submit">Salvar Alterações</button>
        <br>
        <a href="listTask.jsp">
            <button type="button">Voltar</button>
        </a>
    </form>
</body>

</html>