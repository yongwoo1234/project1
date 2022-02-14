package com.sboot.toworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sboot.toworld.vo.ReviewVO;

@Mapper
public interface ReviewDAO {

	   public List<ReviewVO> getReview(String country);
	   public ReviewVO getReview2(String FileName);
	   public int insertReview(int serial, String country, String id, String title, String contents, String formeddate,
			String fileName, String fileUrl, int viewcnt);
	   public List<ReviewVO> getReviewDetail(String fileName);
	   public int updateReview(String title, String contents, String fileName);
	   public int deleteReview(String fileName);
	   public int plusCount(String fileName);
	   
//	   public List<ReviewVO> listPage(Criteria cri);
//	   public int listCount();
	   
}
