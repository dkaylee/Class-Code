package com.aia.op.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.op.member.dao.MemberDao;

@Service
public class MemberIdCheckService {
	
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String checkId(String id) {
		
		dao = template.getMapper(MemberDao.class);
		
		// id 개수는 유니크하기 때문에 0 or 1 나옴
		return dao.selectMemberByIdCount(id)>0 ? "N":"Y";
	}
	
}
