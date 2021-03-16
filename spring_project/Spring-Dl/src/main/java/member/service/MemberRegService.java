package member.service;

import member.dao.Dao;
import member.dao.MemberDao;

public class MemberRegService implements MemberService {

	// Dao dao = new MemberDao(); // 의존성이 높은 코드 다형성
	
	private Dao dao; // 주입 받아야 하는 참조 변수
	
	// 생성자를 통해 Dao 타입의 인스턴스를 주입 받는다.
	public MemberRegService(Dao dao) {
		this.dao = dao;
	}
	
	public Object process() {
		System.out.println("MemberRegService 실행");
		
		dao.insert();
		
		return null;
	}

		
}
