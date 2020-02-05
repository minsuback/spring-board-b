package com.goodibooks.service;

import com.goodibooks.vo.MemberVO;

public interface MemberService {

	void registerMember(MemberVO member);

	MemberVO findMemberByIdAndPasswd(MemberVO member);

	void updateMember(MemberVO member);
	
	MemberVO findMemberById(String id);

	void deleteMember(MemberVO member);

}
