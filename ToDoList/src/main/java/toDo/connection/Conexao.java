package toDo.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	private final String url = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL";
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String user = "rm94751";
	private final String password = "240304";
	private Connection conexao;
	
	public Connection conectar() {
		try {
			Class.forName(driver);
			conexao = DriverManager.getConnection(url, user, password);			
		}
		catch(ClassNotFoundException e) {
			System.out.println("Erro ao carregar o driver");
		}
		catch(SQLException e) {
			System.out.println("Erro ao estabelecer conexão com o banco de dados");
		}
		
		return conexao;
	}

}
