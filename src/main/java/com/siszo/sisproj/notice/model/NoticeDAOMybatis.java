package com.siszo.sisproj.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.siszo.sisproj.common.SearchVO;

@Repository
public class NoticeDAOMybatis extends SqlSessionDaoSupport
	implements NoticeDAO{
	
	private String namespace="config.mybatis.mapper.oracle.notice";
	
	public int insertNotice(NoticeVO vo) {
		return getSqlSession().insert(namespace+".insertNotice", vo);
	}

	@Override
	public List<NoticeVO> selectAll(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAll", searchVo);
	}

	@Override
	public int selectTotalRecordCount(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecordCount", searchVo);
	}

	@Override
	public NoticeVO selectByNo(int notiNo) {
		return getSqlSession().selectOne(namespace+".selectByNo", notiNo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return getSqlSession().update(namespace+".updateNotice", vo);
	}

	@Override
	public int deleteNotice(int notiNo) {
		return getSqlSession().delete(namespace+".deleteNotice", notiNo);
	}

	@Override
	public int updateReadCount(int notiNo) {
		return getSqlSession().update(namespace+".updateReadCount", notiNo);
	}
	
	
/*	@Override
	public int deleteNotice(NoticeVO vo) {
		return getSqlSession().delete(namespace+".deleteNotice", vo);
	}
*/	
	
}
