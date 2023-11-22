package toDo.controllers;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toDo.repository.TaskRepository;
import toDo.task.Task;
import toDo.user.User;

/**
 * Servlet implementation class TaskController
 */
@WebServlet("/addTask")
public class TaskController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public TaskController() {
        super();
        
    }
		

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TaskRepository rep = new TaskRepository();
		Task task = new Task();
		
		task.setTitle(request.getParameter("title"));
		task.setDescription(request.getParameter("description"));
		task.setDueDate(Date.valueOf(request.getParameter("dueDate")));
		
		User loggedUser = null;

		Object userIdObj = request.getSession().getAttribute("userId");
		if (userIdObj != null && userIdObj instanceof Integer) {
		    loggedUser = new User();
		    loggedUser.setId((Integer) userIdObj);
		}	
		
		if (loggedUser != null) {
			task.setUser_id(loggedUser);
	        rep.addTask(task);
	        response.sendRedirect("./hub.jsp");
	    } else {
	        request.setAttribute("erroAddTask", "Usuário não encontrado");
	        request.getRequestDispatcher("form/addTask.jsp").forward(request, response);
	    }

}}

