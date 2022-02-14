package com.sboot.toworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sboot.toworld.vo.Criteria;
import com.sboot.toworld.vo.SearchCriteria;
import com.sboot.toworld.vo.TogetherVO;

@Mapper
public interface TogetherDAO {
	
	public List<TogetherVO> getTogether();

	public int insertTogether(String title, String id, String ddate, String fileName, String fileUrl, int viewcnt, int commentcnt, String context);

	public TogetherVO whoTogether(int serial);

	public int updateTogether(int serial, String title, String context);

	public int deleteTogether(int serial);

	public boolean plusCnt(int serial);

	public void increaseReply(int serial);
	
	public void decreaseReply(int serial);
	
	
	//페이징/////////////////////////////
	
	public int count(SearchCriteria scri);
	
	// 게시물 목록 + 페이징
	//public List<TogetherVO> listPage(Criteria cri);
	
	public List<TogetherVO> listPage(SearchCriteria scri);
	
	
	;
}
