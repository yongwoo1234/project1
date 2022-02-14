package com.sboot.toworld.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class TogetherVO {
	private int serial;
	private String title;
	private String id;
	private Date ddate;
	private int viewcnt;
	private int commentcnt;
	private String context;
    private String fileName;
    private String fileUrl;
    
    
    public TogetherVO() {}
    
    public TogetherVO(String title, String id, Date ddate, String fileName, String fileUrl, int viewcnt, int commentcnt, String context) {
		super();
		this.title = title;
		this.id = id;
		this.ddate = ddate;
		this.viewcnt = viewcnt;
		this.commentcnt = commentcnt;
		this.context = context;
		this.fileName = fileName;
		this.fileUrl = fileUrl;
	}
}



