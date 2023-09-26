package br.fiap.contato.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.fiap.contato.conexao.Conexao;

public class DAO {
	protected Connection connection;
	protected PreparedStatement ps;
	protected ResultSet rs;
	protected String sql;
	protected Conexao conexao;
}
