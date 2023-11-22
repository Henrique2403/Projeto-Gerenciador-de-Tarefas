package toDo.controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toDo.repository.TaskRepository;
import toDo.task.Task;

/**
 * Servlet implementation class TaskEditor
 */
@WebServlet("/taskEditor")
public class TaskEditor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskEditor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String taskIdParam = request.getParameter("taskId");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dueDateStr = request.getParameter("dueDate");
            boolean completed = request.getParameter("completed") != null;

            if (taskIdParam != null && !taskIdParam.isEmpty()) {
                int taskId = Integer.parseInt(taskIdParam);

                TaskRepository rep = new TaskRepository();

                Task task = new Task();
                task.setTaskId(taskId);
                task.setTitle(title);
                task.setDescription(description);
                task.setDueDate(Date.valueOf(dueDateStr));
                task.setCompleted(completed);

                rep.editTask(task);

                // Atualiza a lista após a edição
                List<Task> listaAtualizada = rep.listar(task.getTaskId());

                request.setAttribute("lista", listaAtualizada);

                // Redireciona para a página de listagem
                RequestDispatcher dispatcher = request.getRequestDispatcher("form/listTask.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("Parâmetro taskId ausente ou vazio.");
                response.sendRedirect("form/listTask.jsp");
            }

        } catch (NumberFormatException e) {
            System.out.println("Erro ao converter taskId para inteiro: " + e.getMessage());
            // Redireciona para a página de listagem em caso de erro
            response.sendRedirect("form/listTask.jsp");
        }
    }

}
