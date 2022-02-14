package com.sboot.toworld.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ReviewReplyVO {
	
	private String rvwid;
	private String rvwcomment;
	private String datetime;
	private int serial;
	private int rp_no;
	private String fileName;
	
	public ReviewReplyVO() {}

	public ReviewReplyVO(String rvwid, String rvwcomment, String datetime, int serial, int rp_no, String fileName) {
		super();
		this.rvwid = rvwid;
		this.rvwcomment = rvwcomment;
		this.datetime = datetime;
		this.serial = serial;
		this.rp_no = rp_no;
		this.fileName = fileName;
	}
}
