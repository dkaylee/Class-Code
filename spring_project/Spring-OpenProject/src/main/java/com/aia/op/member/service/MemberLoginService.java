package com.aia.op.member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.op.member.dao.MemberDao;
import com.aia.op.member.domain.Member;

@Service
public class MemberLoginService {
	
	private MemberDao dao;

	@Autowired
	private SqlSessionTemplate template;
	
	// 21.02.25 추가
	@Autowired
	private RedisService redisService;

	public boolean login(
			HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("userid");
		String pw = request.getParameter("pw");
		String chk = request.getParameter("chk");

		dao = template.getMapper(MemberDao.class);

		boolean loginCheck = false;

		// 1. Dao -> id, pw 데이터로 검색 => 존재하면 로그인 처리

		Member member = dao.selectLogin(id, pw);

		System.out.println(member);

		if(member != null) {
			
			if(member.getVerify()=='N') {
				// 현재 세션의 속성에 LoginInfo 인스턴스를 저장
				request.getSession().setAttribute("loginInfo",member.toLoginInfo());
				
				// 21.02.25 추가
				// 현재있는 세션아이디를 redis에 저장
				redisService.setUserInformation(member.toLoginInfo(), request.getSession());
				
				loginCheck = true;
				// 2. uid 쿠키 처리
				if(chk != null && chk.contentEquals("on")) {
					Cookie c = new Cookie("uid", id);
					c.setMaxAge(60*60*24*365);
					response.addCookie(c);
				} else {
					// 쿠키 소멸
					Cookie c = new Cookie("uid", id);
					c.setMaxAge(0);
					response.addCookie(c);
				}
				
			} else {
				loginCheck = true;
				request.setAttribute("msg", "미인증 이메일입니다. 인증 후 로그인 해주세요.");
			}
				
				
		}

		return loginCheck;
	}

}