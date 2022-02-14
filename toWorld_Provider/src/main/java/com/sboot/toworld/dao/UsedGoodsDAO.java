package com.sboot.toworld.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sboot.toworld.vo.SearchCriteria;
import com.sboot.toworld.vo.TogetherVO;
import com.sboot.toworld.vo.UsedGoodsVO;

@Mapper
public interface UsedGoodsDAO {
	
	public List<UsedGoodsVO> getUsedGoods();

	public int insertUsedGoods(String title, String id, String goodsName, Date ddate, String fileName, String fileUrl, int viewcnt, int price, String context, int many);

	public UsedGoodsVO detailUsedGoods(int serial);

	public int updateUsedGoods(int serial, String title, int price, String context);

	public int deleteUsedGoods(int serial);

	public boolean plusCnt(int serial);
	
	//페이징/////////////////////////////
	
	public int count(SearchCriteria scri);
				
		
	public List<TogetherVO> listPage(SearchCriteria scri);

	public int soldOut(int serial);



}
