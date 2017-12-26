package com.siszo.sisproj.confirm.comment.model;

import java.util.List;

public interface CommentDAO {
	public List<CommentVO> selectCommByCfNo (String cfNo);
	public int selectCommCNTByCfNo(String cfNo);
	public int insertComment(CommentVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(int commNo);	
}
