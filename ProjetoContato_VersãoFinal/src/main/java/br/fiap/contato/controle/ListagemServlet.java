package br.fiap.contato.controle;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ListagemServlet
 */
@WebServlet("/listagem")
public class ListagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util util = new Util();
		ContatoDAO dao = new ContatoDAO();
		Contato contato;		
		
		String senha = util.criptografar(request.getParameter("senha"));
		String email = request.getParameter("email");
		
		contato = dao.pesquisar(email, senha);
		
		if(contato != null) {			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/form/formListagem.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
