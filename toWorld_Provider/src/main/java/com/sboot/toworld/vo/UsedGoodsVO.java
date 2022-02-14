package com.sboot.toworld.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UsedGoodsVO {
	private int serial;
	private String title;
	private String id;
	private String goodsName;
	private Date ddate;
	private int viewcnt;
	private int price;
	private String context;
    private String fileName;
    private String fileUrl;
    private int many;
    
    
    public UsedGoodsVO() {}
    
    public UsedGoodsVO(String title, String id, String goodsName, Date ddate, String fileName, String fileUrl, int viewcnt, int price, String context, int many) {
		super();
		this.title = title;
		this.id = id;
		this.goodsName = goodsName;
		this.ddate = ddate;
		this.viewcnt = viewcnt;
		this.price = price;
		this.context = context;
		this.fileName = fileName;
		this.fileUrl = fileUrl;
		this.many = many;
	}
}