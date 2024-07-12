package cn.utp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon {
	private static Connection connection = null;
	
	public static Connection getConneciton() throws SQLException, ClassNotFoundException {
		if(connection==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pnf_db","root","13Julio04.");
			System.out.print("conectado");
		}
		return connection;
	}
}
