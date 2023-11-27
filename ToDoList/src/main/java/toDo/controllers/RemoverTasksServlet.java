package toDo.controllers;

import java.io.IOException;
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
 * Servlet implementation class RemoverTasksServlet
 */
@WebServlet("/removeTasks")
public class RemoverTasksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoverTasksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String taskIdParam = request.getParameter("taskId");

         if (taskIdParam != null && !taskIdParam.isEmpty()) {
             int taskId = Integer.parseInt(taskIdParam);

             TaskRepository rep = new TaskRepository();

             Task task = new Task();
             task.setTaskId(taskId);
             
             rep.removeTask(task);
             
             List<Task> listaAtualizada = rep.listar(task.getTaskId());

             request.setAttribute("lista", listaAtualizada);
             
             response.sendRedirect("form/listTask.jsp");
         } else {
             System.out.println("Parâmetro taskId ausente ou vazio.");
             response.sendRedirect("form/listTask.jsp");
             
         }
	}

}
