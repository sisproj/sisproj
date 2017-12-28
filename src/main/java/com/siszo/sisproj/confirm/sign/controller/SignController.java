package com.siszo.sisproj.confirm.sign.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.confirm.sign.model.SignService;
import com.siszo.sisproj.confirm.sign.model.SignVO;
import com.siszo.sisproj.employee.model.EmployeeVO;


@Controller
@RequestMapping("/confirm")
public class SignController {
	public static final Logger logger = LoggerFactory.getLogger(SignController.class);

	@Autowired
	private SignService sService;
	@Autowired
	private FileUploadUtil fileuploatUtil;
	
	@RequestMapping("/updateSign.do")
	public String insertSignImg(@RequestParam String oldfilename,HttpSession session, HttpServletRequest request, Model model) {
		logger.info("결재 서명 등록 처리, 파라미터, oldfilename={}", oldfilename);
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		
		//결재서명 이미지 업로드 처리
		String signName="";
		String signOriName="";
		long signSize=0;
		SignVO sVo = new SignVO();
		sVo.setEmpNo(empVo.getEmpNo());
		try {
			List<Map<String, Object>> list = fileuploatUtil.fileupload(request, FileUploadUtil.USER_SIGN);
			for(Map<String, Object> map: list) {
				signName=(String) map.get("fileName");
				signOriName = (String) map.get("originalFileName");
				signSize = (Long) map.get("fileSize");
				System.out.println(signName+", "+signOriName+","+signSize);
				
				sVo.setSignName(signName);
				sVo.setSignOriName(signOriName);
				sVo.setSignSize(signSize);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("이미지 업로드 처리 후 sVo={}",sVo);		

		String msg="", url="/confirm/setting.do";
		//기존 파일 있다면 update 후 파일 삭제, 기존 등록된 파일이 없다면 insert
		if(oldfilename!=null && !oldfilename.isEmpty()) {
			int cnt = sService.updateSignImg(sVo);
			if(cnt>0) {
				msg="결재 서명이 수정되었습니다.";
			} else {
				msg="결재 서명 수정 실패";
			}
			
			String path = fileuploatUtil.getUploadPath(request, FileUploadUtil.USER_SIGN);
			File oldfile = new File(path, oldfilename);
			if(oldfile.exists()) {
				boolean bool = oldfile.delete();
				logger.info("파일 삭제 여부 : bool={}",bool);
			}
		} else {
			int cnt = sService.insertSignImg(sVo);
			if(cnt>0) {
				msg="결재 서명이 새로 등록되었습니다.";
			} else {
				msg="결재 서명 등록 실패";
			}			
		}		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
}
