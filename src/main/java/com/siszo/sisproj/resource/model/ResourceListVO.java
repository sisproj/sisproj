package com.siszo.sisproj.resource.model;

import java.util.List;

public class ResourceListVO {
	private List<ResourceVO> resourceItems;

	public List<ResourceVO> getResourceItems() {
		return resourceItems;
	}

	public void setResourceItems(List<ResourceVO> resourceItems) {
		this.resourceItems = resourceItems;
	}

	@Override
	public String toString() {
		return "ResourceListVO [resourceItems=" + resourceItems + "]";
	}

	
}
