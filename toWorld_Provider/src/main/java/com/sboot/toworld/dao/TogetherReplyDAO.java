package com.sboot.toworld.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.sboot.toworld.vo.TogetherReplyVO;
import com.sboot.toworld.vo.TogetherVO;

@Mapper
public interface TogetherReplyDAO {

	
	public List<TogetherReplyVO> readReply(int serial);

	public void insertReply(int serial, String content, String id);

	public void deleteReply(int rno, String id);

	public void updateReply(int rno, String content, String id);
	
	public String replyUserIdCheck(int rno); 

	public List<TogetherReplyVO> selectReply(int rno);
	
}
