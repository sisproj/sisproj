package com.siszo.sisproj.confirm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConfirmFileServiceImpl implements DocumentService {
	
	@Autowired
	private ConfirmFileDAO cfDao;
}
