package com.sboot.toworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sboot.toworld.vo.ReviewReplyVO;

@Mapper
public interface ReviewReplyDAO {
	 
	 public int insertComment(int serial, int rp_no, String id, String rvwcomment, String datetime, String fileName);
	 public List<ReviewReplyVO> getComment(int serial);
	 public int deleteComment(int rp_no);
	 public int updateComment(String rvwcomment, int rp_no);
	 public String replyUserIdCheck(int rp_no);
}
