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
	<div class="tabela">
<jsp:include page="./listTasks"></jsp:include>
    <h2>Listar Tarefas</h2>
    <c:if test="${not empty lista}">
    <table>
        <thead>
            <tr>
                <th>Título</th>
                <th>Descrição</th>
                <th>Data de Vencimento</th>
                <th>Status</th>
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
                        <a href="form/editTask.jsp?taskId=${task.taskId}">Editar</a>
                    </td>
                    <td>
			<a href="./removeTasks?taskId=${task.taskId}">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </c:if>
    <a href="form/addTask.jsp">
	<button type="submit">Nova Tarefa</button>
    </a>
    </div>
</body>
</html>
