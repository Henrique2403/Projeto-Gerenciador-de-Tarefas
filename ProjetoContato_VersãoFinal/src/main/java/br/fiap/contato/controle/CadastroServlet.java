package br.fiap.contato.controle;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
 * Servlet implementation class CadastroServlet
 */
@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Util util = new Util();
		ContatoDAO dao = new ContatoDAO();
		Contato contato = new Contato();
		
		String senha = util.criptografar(request.getParameter("senha"));
		LocalDate data = util.formatarData(request.getParameter("data"));
		
		contato.setNome(request.getParameter("nome"));
		contato.setEmail(request.getParameter("email"));
		contato.setSenha(senha);
		contato.setTelefone(request.getParameter("fone"));
		contato.setDataNascimento(data);
		
		dao.inserir(contato);	
		
		// redireciona para index.jsp
		//RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		//dispatcher.forward(request, response);
		response.sendRedirect("index.jsp");
		
	}
}
