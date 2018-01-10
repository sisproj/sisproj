package com.siszo.sisproj.resource.model;

import java.util.List;

public interface ResourceService {
	public int insertResource(ResourceVO resVo);
	public List<ResourceVO> selectResourceAll(ResourceSearchVO searchVo);
	public int selectTotalRecord();
	public int deleteResourceMulti(List<ResourceVO> list);
}
