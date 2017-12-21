package com.siszo.sisproj.confirm.file.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ConfirmFileServiceImpl implements ConfirmFileService {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmFileServiceImpl.class);
	
	@Autowired
	private ConfirmFileDAO cfDao;

	@Override
	@Transactional
	public int multiInsertCfFile(List<ConfirmFileVO> list) {
		logger.info("첨부파일들 등록처리, 파라미터 list.size()={}",list.size());
		int res = 0;
		try {
			for(ConfirmFileVO vo : list) {
				int cnt = cfDao.insertConfirmFile(vo);
				logger.info("첨부파일 처리 결과, cnt={}", cnt);
				if(cnt>0) {
					res++;
				}
			}			
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	
}
