package cn.utp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.utp.model.User;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet results;
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
		try {
			query = "call getCliente(?,?)";
			pst=this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			results = pst.executeQuery();
			
			if(results.next()) {
				user = new User();
				user.setId(results.getInt("id"));
				user.setNombre(results.getString("nombre"));
				user.setApellido(results.getString("apellido"));
				user.setEmail(results.getString("email"));
				user.setPassword(results.getString("contraseña"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}
}
