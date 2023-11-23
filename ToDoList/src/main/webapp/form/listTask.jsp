<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listar Tarefas</title>

    <link rel="stylesheet" href="../css/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

</head>
<body>
    <div class="circle"></div>
	<div class="tabela">
<jsp:include page="../listTasks"></jsp:include>
    <h2>Listar Tarefas</h2>
    <c:if test="${not empty lista}">
    <table>
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
    </div>
</body>
</html>
