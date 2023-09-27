package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import conexao.Conexao;
import models.Categoria;
import models.Tarefa;

public class TarefaService {
	
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	private Conexao conexao;
	
	public TarefaService(){
		this.conexao = new Conexao();
	}
	
	
	public void adicionar(Tarefa tarefa) {
		
		sql = "inser into tarefa values(tarefa_sequence.nextval, ?, ?, ?, ?, ?, ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setInt(1, tarefa.getId());
			ps.setString(2, tarefa.getTitle());
			ps.setString(3, tarefa.getDescricao());
			ps.setBoolean(4, tarefa.isStatus());
			ps.setDate(5, Date.valueOf(tarefa.getCreated_at()));
			ps.setDate(6, Date.valueOf(tarefa.getDueDate()));
			ps.setInt(7, tarefa.getCategoria().getCategory_id());
			ps.execute();
			ps.close();
			connection.close();
		} catch ( SQLException e) {
			System.out.println("Erro ao adicionar uma tarefa\n" + e);
		}
	}
	
	public List<Tarefa> listar(){
		List<Tarefa> lista = new ArrayList<Tarefa>();
		sql = "select t.task_id as task_id, t.title as title, t.description as descricao, "
	            + "t.status as status, t.created_at as created_at, "
	            + "t.due_date as dueDate, t.category_id as category_id from tarefa t "
	            + "join categoria c "
	            + "on t.category_id = c.category_id";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("task_id");
				String title = rs.getString("title");
				String descricao = rs.getString("descricao");
				boolean status = rs.getBoolean("status");
				LocalDate created_at = rs.getDate("created_at").toLocalDate();
				LocalDate dueDate = rs.getDate("dueDate").toLocalDate();
				int category_id = rs.getInt("category_id");
				String name = rs.getString("name");
				Categoria categoria = new Categoria(category_id,name);
				Tarefa tarefa = new Tarefa(id, title, descricao,status,created_at, dueDate,categoria);
				lista.add(tarefa);
			}
			
		} catch (SQLException e) {
			System.out.println("Erro ao listar tarefas\n" + e);
		}
		return lista;
	}
	
	public void atualizar(Tarefa tarefa) {
		sql = "update tarefa set title = ?, descricao = ?, dueDate = ?, where task_id = ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setString(1, tarefa.getTitle());
			ps.setString(2, tarefa.getDescricao());
			ps.setDate(3, Date.valueOf(tarefa.getDueDate()));
			ps.execute();
			ps.close();
			connection.close();
			
		} catch (SQLException e) {
			System.out.println("Erro ao atualizar tarefa\n" + e);
		}
	}
	
	public void remover(int id) {
		sql = "delete from tarefa where task_id = ?";
		
		try (Connection connection = conexao.conectar()){
			ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ps.execute();
			ps.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao remover tarefa\n" + e);
		}
	}
	
	

}
