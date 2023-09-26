package br.fiap.contato.controle;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.fiap.contato.dao.ContatoDAO;
import br.fiap.contato.modelo.Contato;
import br.fiap.contato.util.Util;

/**
 * Servlet implementation class AlterarServlet
 */
@WebServlet("/alterar")
public class AlterarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Util util = new Util();
		ContatoDAO dao = new ContatoDAO();
		Contato contato = new Contato();
				
		LocalDate data = util.formatarData(request.getParameter("data"));
		
		contato.setId(Integer.parseInt(request.getParameter("id")));
		contato.setNome(request.getParameter("nome"));
		contato.setEmail(request.getParameter("email"));
		contato.setTelefone(request.getParameter("fone"));
		contato.setDataNascimento(data);
		
		dao.alterar(contato);
		
		// redireciona para index.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("form/formListagem.jsp");
		dispatcher.forward(request, response);
		
	}

}
