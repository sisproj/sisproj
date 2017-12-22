package com.siszo.sisproj.confirm.comment.model;

import java.util.List;

public interface CommentService {
	public List<CommentVO> selectCommByCfNo (String cfNo);
	public int selectCommCNTByCfNo(String cfNo);
}
