package com.siszo.sisproj.resource.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResourceServiceImpl implements ResourceService{

	@Autowired
	ResourceDAO resourceDao;
	
	
	
	public List<ResourceVO> resourceAllselect(){
		return resourceDao.resourceAllselect();
	}
}
