package com.siszo.sisproj.resource.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siszo.sisproj.reservation.model.ReservationVO;

@Service
public class ResourceServiceImpl implements ResourceService{
	@Autowired
	private ResourceDAO resourceDao;

	@Override
	public int insertResource(ResourceVO resVo) {
		return resourceDao.insertResource(resVo);
	}

	@Override
	public List<ResourceVO> selectResourceAll(ResourceSearchVO searchVo) {
		return resourceDao.selectResourceAll(searchVo);
	}

	@Override
	public int selectTotalRecord() {
		return resourceDao.selectTotalRecord();
	}

	@Override
	@Transactional
	public int deleteResourceMulti(List<ResourceVO> list) {
		int cnt=0;
		try {
			for (ResourceVO vo : list) {
				int resNo=vo.getResNo();
				if(resNo!=0) {
					cnt=resourceDao.deleteResource(resNo);
				}
			}
		}catch (RuntimeException e) {
			cnt=0;
			e.printStackTrace();
		}
		
		return cnt;
	}
}
