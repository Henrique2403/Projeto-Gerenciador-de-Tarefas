package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Categoria;
import models.Tarefa;
import services.TarefaService;
import util.Util;

/**
 * Servlet implementation class AdiçãoServlet
 */
@WebServlet("/adicionar")
public class AdiçãoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util util = new Util();
		TarefaService service = new TarefaService();
		Tarefa tarefa = new Tarefa(0, null, null, false, null, null, null);
		Categoria categoria = null;
		
		LocalDate created_at = util.formatarData(request.getParameter("created_at"));
		LocalDate dueDate = util.formatarData(request.getParameter("dueDate"));
		
		tarefa.setTitle(request.getParameter("title"));
		tarefa.setDescricao(request.getParameter("descricao"));
		tarefa.setStatus(Boolean.parseBoolean(request.getParameter("status")));
		tarefa.setCreated_at(created_at);
		tarefa.setDueDate(dueDate);
		
		service.adicionar(tarefa);
		response.sendRedirect("adicionarTarefa.jsp");
	}

}
