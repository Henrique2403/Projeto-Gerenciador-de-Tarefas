package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexao.Conexao;
import models.Tarefa;

public class TarefaService {
	
	private Connection connection;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	private Conexao conexao;
	
	public TarefaService(){
		this.conexao = new Conexao();
	}
	
	//método para adicionar alguma tarefa
	
	public void adicionar(Tarefa tarefa) {
		
		sql = "inser into tarefa values(tarefa_sequence.nextval, ?, ?, ?, ?, ?, ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setLong(1, tarefa.getId());
			ps.setString(2, tarefa.getTitle());
			ps.setString(3, tarefa.getDescricao());
			ps.setBoolean(4, tarefa.isStatus());
			ps.setDate(5, Date.valueOf(tarefa.getCreated_at()));
			ps.setDate(6, Date.valueOf(tarefa.getDueDate()));
			ps.setString(7, tarefa.getCategoria());
			ps.execute();
			
		} catch ( SQLException e) {
			System.out.println("Erro ao adicionar uma tarefa\n" + e);
		}
	}
	
	public List<Tarefa> listar(){
		
	}
	
	public void atualizar(Tarefa tarefa) {
		sql = "update tarefa set title = ?, descricao = ?, dueDate = ?, categoria = ? where task_id = ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setString(1, tarefa.getTitle());
			ps.setString(2, tarefa.getDescricao());
			ps.setDate(3, Date.valueOf(tarefa.getDueDate()));
			ps.setString(4, tarefa.getCategoria());
			ps.execute();
			ps.close();
			connection.close();
			
		} catch (SQLException e) {
			System.out.println("Erro ao atualizar tarefa\n" + e);
		}
	}
	
	public void remover(Long id) {
		sql = "delete from tarefa where task_id = ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setLong(1, id);
			ps.execute();
			ps.close();
			
		} catch (SQLException e) {
			System.out.println("Erro ao remover tarefa\n" + e);
		}
	}
	
	

}
