package com.siszo.sisproj.resource.model;

import java.util.List;

public interface ResourceDAO {
	public int insertResource(ResourceVO resVo);
	public List<ResourceVO> selectResourceAll(ResourceSearchVO searchVo);
	public int selectTotalRecord();
	public int deleteResource(int resNo);
}
