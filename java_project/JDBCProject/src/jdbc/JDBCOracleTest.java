package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCOracleTest {
	
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
			
			// 1. 사원의 정보를 입력하는 프로그램
			// Statement 인스턴스 생성
			Statement stmt = conn.createStatement();
			
			
			System.out.println("사원의 이름을 입력해주세요.");
			String eName = sc.nextLine();
			System.out.println("직무를 입력해주세요");
			String ejob = sc.nextLine();
			System.out.println("매니저 번호를 입력해주세요");
			String mgr = sc.nextLine();
			System.out.println("입사일을 입력해주세요");
			String hireDate = sc.nextLine();
			System.out.println("급여를 입력해주세요");
			String eSal = sc.nextLine();
			System.out.println("커미션을 입력해주세요");
			String eComm = sc.nextLine();
			System.out.println("부서번호를 입력해주세요");
			String eDeptno = sc.nextLine();
			
			// insert : 입력
			String sqlInsert = "insert into emp values (seq_emp_empno.nextval,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setNString(1, eName);
			pstmt.setNString(2, ejob);
			pstmt.setNString(3, mgr);
			pstmt.setNString(4, hireDate);
			pstmt.setNString(5, eSal);
			pstmt.setNString(6, eComm);
			pstmt.setNString(7, eDeptno);
			
			int resultCnt = pstmt.executeUpdate();
			if(resultCnt>0) {
				System.out.println("데이터가 정상적으로 입력되었습니다.");
			} else {
				System.out.println("데이터가 입력되지 않았습니다.");
			}
			
			// 2. 사원의 모든 데이터를 출력하는 프로그램
			String sqlSelect = "select * from emp order by empno";
			
			pstmt = conn.prepareStatement(sqlSelect);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {

					System.out.print(rs.getNString(1)+"\t");
					System.out.print(rs.getNString(2)+"\t");
					System.out.print(rs.getNString(3)+"\t");
					System.out.print(rs.getNString(4)+"\t");
					System.out.print(rs.getNString(5)+"\t");
					System.out.print(rs.getNString(6)+"\t");
					System.out.print(rs.getNString(7)+"\n");
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			// 3. EMP 테이블에 서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
			
			
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("Driver 로드실패");
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

	}

}
