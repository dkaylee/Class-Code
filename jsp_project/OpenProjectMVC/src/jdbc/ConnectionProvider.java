package jdbc;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionProvider {
	
	public static Connection getConnection() throws SQLException {
		
		Connection conn=null;
		
		// 2. DB 연결 : Connection 객체를 얻기
	 	String jdbcUrl = "jdbc:mysql://openproject.ckcre4g1zwg7.ap-northeast-2.rds.amazonaws.com:3306/open?serverTimeZone=UTC";
		String user = "aia";
		String password = "1234";
		

		conn = DriverManager.getConnection(jdbcUrl, user, password);
		
		return conn;
	}
}
