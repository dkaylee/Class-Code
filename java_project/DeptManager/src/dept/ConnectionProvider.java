package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
		String user = "bit";
		String password = "bit";
		
		try {
			conn = DriverManager.getConnection(jdbcUrl, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
