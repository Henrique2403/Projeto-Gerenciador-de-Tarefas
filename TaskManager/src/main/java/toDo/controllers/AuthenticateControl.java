package toDo.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toDo.connection.Conexao;
import toDo.user.User;

/**
 * Servlet implementation class AuthenticateControl
 */
@WebServlet("/authControl")
public class AuthenticateControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected PreparedStatement ps;
	protected ResultSet rs;
	protected String sql;
	protected Conexao conexao;
	
	public AuthenticateControl(){
		this.conexao = new Conexao();		
	}
       
    
    public User AuthenticateUser(String username, String password) {
        String sql = "select * from usuario where username = ? and user_password = ?";
        try (Connection connection = conexao.conectar()) {
        	ps = connection.prepareStatement(sql);
            ps.setString(1,  username);
            ps.setString(2,  password);

            try (ResultSet rS = ps.executeQuery()) {
                if(rS.next()){
                	User user = new User();
                    user.setId(rS.getInt("id_usuario"));
                    user.setNome(rS.getString("username"));
                    user.setPassword(rS.getString("user_password"));

                    return user;
                }// Se houver uma correspondência, a autenticação é bem-sucedida.
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Em caso de erro ou autenticação malsucedida.
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    User authenticateUser = AuthenticateUser(username, password);
	    	
	    if (authenticateUser != null) {
	    	HttpSession session = request.getSession();
	        session.setAttribute("userId", authenticateUser.getId());
	        response.sendRedirect("hub.jsp");
	    } else {
	        request.setAttribute("erroLogin", "Nome ou senha incorretos");
	        request.getRequestDispatcher("/index.jsp").forward(request, response);
	    }
	}

}
