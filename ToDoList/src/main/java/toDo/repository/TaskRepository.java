package toDo.repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import toDo.task.Task;
import toDo.user.User;

public class TaskRepository extends Repository{
	
	public void addTask(Task task) {
		try(Connection connection = conexao.conectar()) {
			int userId = task.getUser_id().getId();
				sql = "insert into tasks(task_id, title, task_description, due_date,"
						+ "completed, user_id) values(task_id_sequence.nextval,?,?,?,?,?)";
				ps = connection.prepareStatement(sql);
				ps.setString(1, task.getTitle());
				ps.setString(2, task.getDescription());
				ps.setDate(3, task.getDueDate());
				ps.setBoolean(4, task.getCompleted());
				ps.setInt(5, userId);
				ps.execute();
				ps.close();
				connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao adicionar nova tarefa\n" + e);
		}
		
	}
	
	
	
	public void editTask(Task task) {
	        sql = "UPDATE tasks SET title = ?, task_description = ?, due_date = ?, completed = ? WHERE task_id = ?";
	        try (Connection connection = conexao.conectar()) {
	        	ps = connection.prepareStatement(sql);
	            ps.setString(1, task.getTitle());
	            ps.setString(2, task.getDescription());
	            ps.setDate(3, task.getDueDate());
	            ps.setBoolean(4, task.getCompleted());
	            ps.setInt(5, task.getTaskId());

	            int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	                System.out.println("Tarefa editada com sucesso!");
	            } else {
	                System.out.println("Nenhuma tarefa encontrada para edição com ID: " + task.getTaskId());
	            }
	    } catch (SQLException e) {
	        System.out.println("Erro ao editar tarefa\n" + e); // Isso imprimirá o rastreamento completo da pilha
	    }
	}
	
	public List<Task> listar(int userId) {
        List<Task> lista = new ArrayList<>();

        sql = "SELECT task_id, title, task_description, due_date, completed FROM tasks WHERE user_id = ? ORDER BY task_id";

        try (Connection connection = conexao.conectar()) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Task task = new Task();
                User user = new User();
                user.setId(userId);
                task.setUser_id(user);
                task.setTaskId(rs.getInt("task_id"));
                task.setTitle(rs.getString("title"));
                task.setDescription(rs.getString("task_description"));
                task.setDueDate(rs.getDate("due_date"));
                task.setCompleted(rs.getBoolean("completed"));
                task.setCompletedString(task.getCompleted() ? "Sim" : "Não");

                lista.add(task);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar tarefas\n" + e);
        }


        return lista;
    }
}



