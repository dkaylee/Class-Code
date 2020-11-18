package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCOraclePreparedStatementTest {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);

		Connection conn = null;

		try {
			// 1. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Oracle Driver Load !!!");
			
			// 2. DB 연결	 localhost == 127.0.0.1
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String password = "tiger";
			
			conn = DriverManager.getConnection(jdbcUrl, user, password);
			System.out.println("데이터베이스에 접속했습니다.");
			
			// 3. Statement 인스턴스 생성
			// Statement stmt = conn.createStatement();
			
			System.out.println("부서이름을 입력해주세요.");
			String userDname = sc.nextLine();
			System.out.println("부서의 위치를 입력해주세요.");
			String userLoc = sc.nextLine();
			
//			// PreparedStatement 인스턴스 생성 : sql 먼저 등록하고 사용한다.
//			String sqlInsert = "insert into dept values (SEQ_DEPT_deptno.nextval,?,?)";
			
			PreparedStatement pstmt = null;
			
//			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
//			pstmt.setNString(1, userDname);
//			pstmt.setNString(2, userLoc);
//			
//			int resultCnt = pstmt.executeUpdate();
//			if(resultCnt>0) {
//				System.out.println("데이터가 정상적으로 입력되었습니다.");
//			} else {
//				System.out.println("데이터 입력이 되지 않았습니다.");
//			}
//			
			System.out.println("검색하고자 하는 부서의 이름을 입력해주세요.");
			String searchDname = sc.nextLine();
			
			
			// 부서 정보 리스트 
			// String sqlSelect = "select * from dept order by loc";
			String sqlSelect = "select * from dept where dname=? order by loc";
			
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setNString(1, searchDname);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				System.out.println("검색의 결과가 없습니다.");
			} else {
				do {
					System.out.print(rs.getInt(1)+"\t");
					System.out.print(rs.getNString(2)+"\t");
					System.out.print(rs.getNString(3)+"\n");
				}while(rs.next());
			}
			
			
			rs.close();
			pstmt.close();
			conn.close();
			
			
	} catch (ClassNotFoundException e) {
		System.out.println("Driver 로드실패");
		
	} catch (SQLException e) {
		e.printStackTrace();
		
	}
	

	}

}
