package toDo.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import toDo.connection.Conexao;

public class Repository {
	protected PreparedStatement ps;
	protected ResultSet rs;
	protected String sql;
	protected Conexao conexao;
	
	public Repository() {
		this.conexao = new Conexao();
	}

}
