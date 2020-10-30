package ver07;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;

import ver06.Util;

public class PhoneBookManager implements Util{
	


	// 사용할 인스턴스 수 하나 클래스 내부에 설정하기
	List<PhoneInfor> pBook;
	
	// 생성자 : 싱글톤 처리
	private PhoneBookManager(int num) {
		pBook = new ArrayList<PhoneInfor>();
		// 파일에서 인스턴스 로드
		load();
	}
	
	// 내부에서 인스턴스 생성
	private static PhoneBookManager manager = new PhoneBookManager(100);
	
	
	// 외부에서 참조변수를 받을 수 있는 메서드
		public static PhoneBookManager getInstance() {
			return manager;
		}
	
	// 배열에 전화번호 정보 저장 메서드
	private void addInfor(PhoneInfor info) {
		//pBook[cnt++] = info;
		//List에 정보 저장
		pBook.add(info);
		}
	
	
	// 전화번호 배열에 저장
	public void insertInfor() {
		
		int select = 0;
		
		// List는 저장공간이 부족하면 저장공간을 확장한다.
		while(true) {
		System.out.println("입력할 정보를 선택해주세요!");
		System.out.println(Menu.UNIV + ". 대학");
		System.out.println(Menu.COM + ". 회사");
		System.out.println(Menu.CAFE + ". 동호회");
		
		try {
			
			select = SC.nextInt();
		
		if( !(select>0 && select<4) ) {
			//System.out.println("메뉴 선택이 옳바르지 않습니다.");
			//System.out.println("초기메뉴로 이동합니다. ");
			//return;
			BadInputException e = new BadInputException(String.valueOf(select));
			throw e;
			}
		} catch (InputMismatchException | BadInputException e) {
				System.out.println("잘못된 메뉴입력입니다. 다시 선택해주세요");
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
		
		switch(select) {
		
		// 학교친구정보 받기
		case Menu.UNIV :
			System.out.println("전공 >> ");
			String major = SC.nextLine();
			System.out.println("학년 >> ");
			String grade = SC.nextLine();
			
			addInfor(new UnivPhoneInfor(name, phoneNum, addr, email, major, grade));
			
			break;
			
		// 회사정보 받기	
		case Menu.COM :
			System.out.println("회사 이름 >> ");
			String company = SC.nextLine();
			
			addInfor(new CompanyPhoneInfor(name, phoneNum, addr, email, company));
			
			break;
			
		// 동호회 정보 받기	
		case Menu.CAFE :
			System.out.println("동호회 이름 >> ");
			String cafeName = SC.nextLine();
			System.out.println("닉네임 >> ");
			String nickName = SC.nextLine();
			
			addInfor(new CafePhoneInfor(name, phoneNum, addr, email, cafeName, nickName));
			
			
			break;
		}
		
		System.out.println("입력하신 정보가 저장되었습니다. 저장수 ( "+ pBook.size() +" )");
	}
	
	// 리스트의 index 찾기
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
	
	
	
	public void searchInfor() {
		
		if(pBook.size()==0) {
			System.out.println("입력된 정보 없음");
			return;
		}
		SC.nextLine();
		System.out.println("검색할 이름 입력해주세요");
		String name = SC.nextLine();
		
		int index = searchIndex(name);
		
		if(index<0) {
			System.out.println("검색한 이름"+name+"의 정보가 없습니다.");
			System.out.println("메뉴로 돌아갑니다");
		} else {
			System.out.println("*********검색결과*********");
			pBook.get(index).showInfor();
		}
	}
		
	
	public void deleteInfor() {
		
		if(pBook.size()==0) {
			System.out.println("삭제할 정보가 없습니다.");
			return;
		}
		
		SC.nextLine();
		
		System.out.println("삭제할 이름 입력해주세요");
		String name = SC.nextLine();
		
		int index = searchIndex(name);
		
		if(index<0) {
			System.out.println("찾으시는 이름 "+name+"의 정보가 존재하지 않습니다.");
			System.out.println("메뉴로 이동합니다.");
		} else {
			// 배열의 요소를 왼쪾으로 시프트 
//			for(int i=index; i<cnt-1; i++) {
//				pBook[i]=pBook[i+1];
//			}
//			cnt--; // 저장된 개수를 감소
			// List 의 요소 삭제는 인덱스의 시프트도 이루어진다.
			pBook.remove(index);
			System.out.println("삭제완료!");
		}

	}
	
	public void showAllInfor() {
		
		if(pBook.size()==0) {
			System.out.println("입력된 정보가 없습니다.");
			return;
		}
		
		System.out.println("전체 정보를출력 합니다. ======================");
		for(int i=0; i<pBook.size() ; i++) {
			pBook.get(i).showInfor();
			System.out.println("--------------------");
		}
	}
	
	
	public void save() {
		if(pBook.size()==0) {
			System.out.println("저장된 데이터가 없어 파일의 저장이 되지 않습니다.");
			 return;
		}
		//인스턴스를 저장할 수 있는 인스턴스들을 저장
	try {
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("phonebook.ser"));
//		for(PhoneInfor pi : pBook) {
//			out.writeObject(pi);
//		}
		out.writeObject(pBook);
		out.close();
		System.out.println("저장되었습니다.(phonebook.ser)");
	} catch (IOException e) {
		System.out.println("저장하는 과정에 오류가 발생했습니다.("+e.getMessage()+") \n다시 시도해주세요");
	}
		
	}
	
	// 프로그램으로 파일의 저장 데이터를 로드
	void load() {
		// 파일이 존재여부 확인 : File
		File file = new File("phonebook.ser");
		if(!file.exists()) {
			System.out.println("저장된 파일이 존재하지 않습니다. 파일저장후 Load됩니다.");
			return;
		}
		
		// 파일에 있는 데이터를 메모리에 저장: pBook에 저장
		// 파일의 데이터를 읽을 수 있는 스트림 생성
		try {
			ObjectInputStream in = new ObjectInputStream(new FileInputStream("phonebook.ser"));
//			while(true) {
//				Object obj = in.readObject();
//				if(obj == null) {
//				break;
//					}
//				pBook.add((PhoneInfor) in.readObject());
//					}
			pBook = (List<PhoneInfor>) in.readObject();
			System.out.println("데이터 로드 완료...");
		} catch (IOException e) {
			//System.out.println("데이터를 로드하는 과정에 오류가 발생했습니다.");
		} catch (ClassNotFoundException e) {
			System.out.println("데이터를 로드하는 과정에 오류가 발생했습니다.");
			e.printStackTrace();
		}
	}
	
	
		
	}
