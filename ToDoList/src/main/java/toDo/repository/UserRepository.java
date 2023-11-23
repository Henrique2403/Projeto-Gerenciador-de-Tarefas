package toDo.repository;

import java.sql.Connection;
import java.sql.SQLException;

import toDo.user.User;

public class UserRepository extends Repository {
	
	public void registerUser(User user) {
        try(Connection connection = conexao.conectar()){
            sql = "insert into usuario (id_usuario, username, user_password, email) values(seq_usuario.nextval, ?, ?, ?)";
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getNome());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.execute();
			ps.close();
			connection.close();
        } catch (SQLException e) {
        	System.out.println("Erro ao registrar usuário\n" + e);
        }
    }
	
	public User searchUser(int userId) {
		User user = null;
		try(Connection connection = conexao.conectar()) {
			sql = "select * from usuario where id_usuario=?";
			ps = connection.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id_usuario"));
				user.setNome(rs.getString("usernome"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("user_password"));
			}
			ps.close();
			connection.close();
			
		} catch (SQLException e) {
			System.out.println("Erro ao procurar usuário existente\n" + e);
		}
		return user;
	}


}
