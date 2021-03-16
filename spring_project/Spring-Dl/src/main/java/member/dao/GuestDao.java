package member.dao;

public class GuestDao implements Dao {

	@Override
	public void insert() {
		System.out.println("방명록을 저장합니다.");

	}

	@Override
	public void delete() {
		System.out.println("방명록을 지웁니다.");

	}

	@Override
	public void select() {
		System.out.println("방명록을 검색합니다.");

	}

	@Override
	public void update() {
		System.out.println("방명록을 수정합니다.");

	}

}
