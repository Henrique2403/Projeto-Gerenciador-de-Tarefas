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
import toDo.user.User;

/**
 * Servlet implementation class ListTasksServlet
 */
@WebServlet("/listTasks")
public class ListTasksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTasksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Object userIdObj = request.getSession().getAttribute("userId");
        
        if (userIdObj != null && userIdObj instanceof Integer) {
            int userId = (Integer) userIdObj;
            TaskRepository rep = new TaskRepository();
            List<Task> lista = rep.listar(userId);
            request.setAttribute("lista", lista);
        	}
        }
    }
