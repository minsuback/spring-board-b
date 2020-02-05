package com.goodibooks.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.MemberVO;

@Mapper
public interface MemberMapper {

	void insertMember(MemberVO member);

	MemberVO selectMemberByIdAndPasswd(MemberVO member);

	void selectMemberByPasswd(MemberVO member);

	void updateMember(MemberVO member);
	
	MemberVO selectMemberById(String id);

	void deleteMember(MemberVO member);


}
