package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import conexao.Conexao;
import models.Categoria;

public class CategoriaServices {
	
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	private Conexao conexao;
	
	public void adicionar(Categoria categoria) {
		sql = "insert into categoria values(categoria_sequences.nextval, ?, ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setInt(1, categoria.getCategory_id());
			ps.setString(2, categoria.getNome());
			ps.execute();
			ps.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao inserir categoria\n" + e);
		}
	}
	
	public List<Categoria> listar(){
		List<Categoria> lista = new ArrayList<Categoria>();
		sql = "select * from categoria order by categoria = ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				lista.add(new Categoria(rs.getInt("category_id"), rs.getString("nome")));
			}
			rs.close();
			ps.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao listar categorias\n" + e);
		}
		
		return lista;
	}
	
	public void remover(Long id) {
		sql = "delete from categoria where id = ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setLong(1, id);
			ps.execute();
			ps.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao remover categoria\n" + e);
		}
	}
	
	public void atualizar(Categoria categoria) {
		sql = "update categoria set nome = ? where category_id = ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setLong(1, categoria.getCategory_id());
			ps.execute();
			ps.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao atualizar categoria\n" + e);
		}
	}

}
