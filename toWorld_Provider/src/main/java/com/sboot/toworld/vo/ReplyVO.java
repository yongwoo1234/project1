package com.sboot.toworld.vo;

import lombok.Data;

@Data
public class ReplyVO {
	
	public ReplyVO(int serial, String content, String id) {
		super();
		this.serial = serial;
		this.content = content;
		this.id = id;
	}
	private int serial;
	private String content;
	private String id;
}
