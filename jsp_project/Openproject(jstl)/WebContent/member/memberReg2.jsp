
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="member.dao.MemberDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.Member"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	int result = 0;

	// DAO 객체의 insert 메소드로 member참조변수 전달, Connection 객체의 참조변수 전달
	Connection conn = ConnectionProvider.getConnection();
	
	// MemberDao dao = new MemberDao();
	MemberDao dao = MemberDao.getInstance();
	
	if (conn != null) {
		
		// 폼의 입력한 사용자 입력 데이터의 한글 처리
		// request.setCharacterEncoding("utf-8");
		
	
		String userId = null;
		String pw = null;
		String userName = null;
		String userPhoto = null;
		
		//  경로는 /upload/member
		String dir = request.getSession().getServletContext().getRealPath("/upload/member");

		// fileUpload 라이브러리를 이용해서 사진은 파일이름으로 데이터베이스에 저장 
		if(ServletFileUpload.isMultipartContent(request)){
			
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> itr = items.iterator();
			
			while(itr.hasNext()){
				
				FileItem item = itr.next();
				// type = file 여부확인 -> 각각 필드의 값을 축출
				if(item.isFormField()){	// 일반 필드
					
					String fName = item.getFieldName();
					
				if(fName.equals("userId")){
					userId = item.getString("utf-8");
						
						}
				if(fName.equals("pw")){
					pw = item.getString("utf-8");
						
						}
				if(fName.equals("userName")){
					userName = item.getString("utf-8");
						
						}
					} else { // file 필드
						if(!item.getName().equals("userPhoto") && !item.getName().isEmpty() && item.getSize()>0){
							
							
							// 경로 저장하는 file 객체를 생성
							File saveFilePath = new File(dir);
							
							// 폴더가 존재하는지 여부
							if(!saveFilePath.exists() || !saveFilePath.isDirectory()){
								saveFilePath.mkdir();
							}
							
							// a 사용자가 photo.jpg / b 사용자가 photo.jpg -> 같은 이름 파일 덮어쓰는 것을 막는다.
							// 자바 가상머신이 가지고 있는 특정 시점을 기준으로하는 nanoTime
							// mini.jpg .을 기준으로 잘라서 처리 -> {"mini","jpg")
							// 새로운 파일 이름 : 중복하는 파일의 이름이 있으면 덮어쓴다.
							System.out.println(item.getName());
							String newFileName = System.nanoTime()+""; //+"."+item.getName().split(".");
							
							// 파일 저장
							item.write(new File(saveFilePath, newFileName));
							// DB에 저장할 파일 이름
							userPhoto = newFileName;
						}
					}
			}
			
			
			
			
			
			Member member = new Member();
			member.setUserId(userId);
			member.setPassword(pw);
			member.setUserName(userName);
			member.setUserPhoto(userPhoto);
			
			System.out.println(member);
			
			
			try{
			// DB에 데이터 저장
			result = dao.insertMember(conn, member);
			// SQLException -> DB에 저장이 안되어있음 
			} catch(Exception e){
				System.out.println("예외!!!!");
				File delFile = new File(dir, userPhoto);
				System.out.println(delFile.exists());
				if(delFile.exists()){
					// 파일을 삭제
					delFile.delete();
				}
			}
		}
		
}
	request.setAttribute("result", result);
%>

<jsp:forward page="memberRegView.jsp"/>


