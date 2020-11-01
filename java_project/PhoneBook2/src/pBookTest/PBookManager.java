package pBookTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;

import pBookTest.Util;

public class PBookManager implements Util{
	

	// 사용 할 수 인스턴스 생성하기 
	List<PBookInfor> pBook;
	
	private PBookManager(int num) {
		pBook = new ArrayList<PBookInfor>();
		// 파일에서 인스턴스 로드
		load();
	}
	
	// 내부에 인스턴스 생성하기
	private static PBookManager manager = new PBookManager(100);
	
	// 외부에서 참조 변수 받기
	public static PBookManager getInstance() {
		return manager;
	}
	
	// 전화번호 저장 메서드
	public void addInfor(PBookInfor infor) {
		// List에 정보 저장
		pBook.add(infor);
	}
	
	
	// 전화번호 배열에 저장
	public void insertInfor() {
		
		int choice = 0;
		
	
		while(true) {
			System.out.println("입력할 정보를 선택해주세요");
			System.out.println(Menu.UNIV+"대학친구");
			System.out.println(Menu.COM+"회사동료");
			System.out.println(Menu.CAFE+"동아리");
			
			try {
			
				choice = SC.nextInt();
			
			if(!(choice > 0 && choice < 4)) {
				
				BadInputException e = new BadInputException(String.valueOf(choice));
				throw e;
			}
			} catch (InputMismatchException | BadInputException e) {
				System.out.println("잘 못 입력했습니다. 다시 선택바랍니다.");
				SC.nextLine();
				continue;
			}
			break;
			
			}
		
		SC.nextLine();
		
		System.out.println("정보를 입력해 주세요");
		System.out.println("이름 : ");
		String name = SC.nextLine();
		System.out.println("전화번호 : ");
		String phoneNum = SC.nextLine();
		System.out.println("주소 : ");
		String addr = SC.nextLine();
		System.out.println("이메일 : ");
		String email = SC.nextLine();
		
		switch(choice) {
		
		// 학교친구정보 받
		case Menu.UNIV :
			System.out.println("전공 : ");
			String major = SC.nextLine();
			System.out.println("학년 : ");
			int grade = SC.nextInt();
			
			addInfor (new UnivInfor(name, phoneNum, addr, email, major, grade));
			
			break;
			
			
		// 회사친구정보 얻기
		case Menu.COM :
			System.out.println("회사이름: ");
			String company = SC.nextLine();
			
			addInfor(new CmpInfor(name, phoneNum, addr, email, company));
			
			break;
		
		// 동호회정보 얻기
		case Menu.CAFE :
			System.out.println("카페이름: ");
			String cafeName = SC.nextLine();
			System.out.println("닉네임: ");
			String nickName = SC.nextLine();
			
			addInfor(new CafeInfor(name, phoneNum, addr, email, cafeName, nickName));
			
			break;
			
		}
		
		System.out.println("입력하신 정보가 저장되었습니다. 저장수 ( "+ pBook.size() +" )");
		
		}
	
	
	// 리스트 인덱스 찾기 
	private int searchIndex(String name) {
		int index = -1; // 정보가 없을 때
		for(int i=0; i<pBook.size(); i++) {
			
			//이름으로 비교
			if(pBook.get(i).getName().equals(name)) {
				index = i;
			}
		}
		return index;
	}
	
	// 이름으로 전화번호 찾기
	public void searchInfor() {
		
		if(pBook.size()==0) {
			System.out.println("입력된 정보가 없습니다.");
			return;
		}
		SC.nextLine();
		System.out.println("검색할 이름을 입력하세요.");
		String name = SC.nextLine();
		
		int index = searchIndex(name);
		
		if(index < 0) {
			System.out.println("검색한 이름 "+name+"의 정보가 없습니다.\n메뉴로 돌아갑니다.");
		}else {
			System.out.println("*********검색결과*********");
			pBook.get(index).showInfor();
		}
		
	}
	
	
	// 이름으로 전화번호 정보 삭제
	public void deleteInfor() {
		if(pBook.size()==0) {
			System.out.println("삭제할 정보가 없습니다.");
		}
		SC.nextLine();
		
		System.out.println("삭제할 정보의 이름을 입력하세요");
		String name = SC.nextLine();
		
		int index = searchIndex(name);
		
		if(index == 0) {
			System.out.println("검색한 이름 "+name+"의 정보가 없습니다.\n메뉴로 돌아갑니다.");
		}else {
			pBook.remove(index);
			System.out.println("*********삭제완료*********");
		}	
	}
	
	// 전체정보출력
	public void showAllInfor() {
		
		if(pBook.size() == 0) {
			System.out.println("입력된 정보가 없습니다.");
			return;
		}
		System.out.println("*********전체정보출력*********");
		for(int i=0; i < pBook.size(); i++)	{
			pBook.get(i).showInfor();
			System.out.println("***************************");
		}
		
	}
	
	public void save() {
		if(pBook.size() == 0) {
			System.out.println("저장된 데이터가 없어 저장이 불가능합니다.");
			return;
		}
	
	// 인스턴스를 저장할 수 있는 인스턴스들을 저장
	try {
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("phonebook.ser"));

	out.writeObject(pBook);
	out.close();
	System.out.println("저장완료!phonebook.ser)");	
	} catch (IOException e) {
		System.out.println("저장하는 과정에 오류가 발생했습니다.("+e.getMessage()+") \n다시 시도해주세요");
	}
	
	}
	
	// 저장된 파일 데이터를 로드
	void load() {
		
		// 파일의 존재여부 확인
		File file = new File("phonebook.ser");
		if(!file.exists()) {
			System.out.println("파일이 존재하지 않습니다. 파일저장 후 로드됩니다.");
		return;
		}
		
		// 파일에 있는 데이터를 pBook 메모리에 저장
		// 데이터를 읽을 수 있는 스트림 생성
		try {
			ObjectInputStream in = new ObjectInputStream(new FileInputStream("phonebook.ser"));
			
			pBook = (List <PBookInfor>) in.readObject();
			System.out.println("데이터 로드 완료...");
		} catch (IOException e) {
			
		} catch (ClassNotFoundException e) {
			System.out.println("데이터를 로드하는 과정에 오류가 발생했습니다.");
			e.printStackTrace();
		}
	}
	
}
