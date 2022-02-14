package com.sboot.toworld.dao;



import org.apache.ibatis.annotations.Mapper;

import com.sboot.toworld.vo.MemberVO;


@Mapper
public interface MemberDAO {
	
	public int insertMember(String username, String password, String name, String birthdate, String tel, int enabled);
//	public MemberVO loginMember(String id, String pw);
	public MemberVO getMember(String username);
	
	//아이디 검색
	public String checkId(String username);
	   
}
