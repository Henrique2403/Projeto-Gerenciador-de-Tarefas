package br.fiap.contato.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.fiap.contato.conexao.Conexao;
import br.fiap.contato.modelo.Contato;

public class ContatoDAO extends DAO {
	
	public ContatoDAO() {
		this.conexao = new Conexao();
	}
	
	// método para inserir um contato na tabela
	public void inserir(Contato contato) {
		
		sql = "insert into java_contato values(contato_sequence.nextval, ?, ?, ?, ?, ?)";
		
		try(Connection connection = conexao.conectar()) {
			ps = connection.prepareStatement(sql);			
			ps.setString(1, contato.getNome());
			ps.setString(2, contato.getEmail());
			ps.setString(3, contato.getSenha());
			ps.setString(4, contato.getTelefone());
			ps.setDate(5, Date.valueOf(contato.getDataNascimento()));
			ps.execute();
		} catch (SQLException e) {
			System.out.println("erro ao inserir contato\n " + e);
		}
	}

	// método para pesquisar um contato pelo email
	public Contato pesquisar(String email, String senha) {
		Contato contato = null;
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "select * from java_contato where email = ? and senha = ?";
		
		try (Connection connection = conexao.conectar()) {
			ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, senha);
			rs = ps.executeQuery();
			if(rs.next()) {
				contato = new Contato();
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(email);
				contato.setSenha(senha);
				contato.setTelefone(rs.getString("telefone"));
				contato.setDataNascimento(rs.getDate("dataNascimento").toLocalDate());
			}			
			ps.close();			
		}
		catch(SQLException e) {
			System.out.println("Erro ao inserir na base de dados\n" + e);
		}
		return contato;
	}
	
	// método para pesquisar um contato pelo id
	public Contato pesquisarId(Integer id) {
		Contato contato = null;
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "select * from java_contato where id = ?";
		
		try (Connection connection = conexao.conectar()) {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				contato = new Contato();
				contato.setId(id);
				contato.setNome(rs.getString("nome"));				
				contato.setEmail(rs.getString("email"));
				contato.setSenha(rs.getString("senha"));
				contato.setTelefone(rs.getString("telefone"));				
				contato.setDataNascimento(rs.getDate("dataNascimento").toLocalDate());
			}			
			ps.close();			
		}
		catch(SQLException e) {
			System.out.println("Erro ao pesquisar contato pelo id\n" + e);
		}
		return contato;
	}
	
	// método para retornar uma lista de contatos
	public List<Contato> listar() {
		List<Contato> lista = new ArrayList<Contato>();
		Contato contato;
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "select * from java_contato";
		
		try (Connection connection = conexao.conectar()) {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				contato = new Contato();
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setSenha(rs.getString("senha"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setDataNascimento(rs.getDate("dataNascimento").toLocalDate());
				lista.add(contato);
			}			
			ps.close();			
		}
		catch(SQLException e) {
			System.out.println("Erro ao inserir na base de dados\n" + e);
		}
		
		return lista;
	}

	// método para alterar os dados de um contato
	public void alterar(Contato contato) {
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "update java_contato set nome = ?, email = ?, telefone = ?, dataNascimento = ? where id = ?";
		
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, contato.getNome());
			ps.setString(2, contato.getEmail());
			ps.setString(3, contato.getTelefone());
			ps.setDate(4, Date.valueOf(contato.getDataNascimento()));
			ps.setInt(5, contato.getId());
			ps.execute();		
			ps.close();			
		}
		catch(SQLException e) {
			System.out.println("Erro ao alterar dados do contato na base de dados\n" + e);
		}		
	}
}
