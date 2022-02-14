package com.sboot.toworld.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberVO {
	
	private String username;
	private String password;
	private String name;
	private String bithdate;
	private String tel;
	private String role;
	private int enabled;
	
	
}
