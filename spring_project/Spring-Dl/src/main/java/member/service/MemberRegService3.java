package member.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import member.dao.Dao;
import member.dao.MemberDao;

public class MemberRegService3 implements MemberService {

	// Dao dao = new MemberDao(); // 의존성이 높은 코드 다형성
	@Resource(name="guestDao")
	private Dao dao; // 주입 받아야 하는 참조 변수
	
	
	@Override
	public Object process() {
		System.out.println("MemberRegService 실행");
		
		dao.insert();
		
		return null;
	}

		
}
