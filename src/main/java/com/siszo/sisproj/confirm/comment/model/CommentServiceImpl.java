package com.siszo.sisproj.confirm.comment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commDao;
	
	@Override
	public List<CommentVO> selectCommByCfNo(String cfNo) {
		return commDao.selectCommByCfNo(cfNo);
	}

	@Override
	public int selectCommCNTByCfNo(String cfNo) {
		return commDao.selectCommCNTByCfNo(cfNo);
	}
	
}
