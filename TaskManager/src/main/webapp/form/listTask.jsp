<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listar Tarefas</title>
</head>
<body>
<jsp:include page="../listTasks"></jsp:include>
    <h1>Listar Tarefas</h1>
    <c:if test="${not empty lista}">
    <table border="1">
        <thead>
            <tr>
                <th>Título</th>
                <th>Descrição</th>
                <th>Data de Vencimento</th>
                <th>Status</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="task" items="${lista}">
                <tr>
                    <td>${task.title}</td>
                    <td>${task.description}</td>
                    <td>${task.dueDate}</td>
                    <td>${task.completedString}</td>
                    <td>
                        <a href="editTask.jsp?taskId=${task.taskId}">Editar</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="../hub.jsp">
        <button type="button">Voltar</button>
    </a>
    </c:if>
</body>
</html>
