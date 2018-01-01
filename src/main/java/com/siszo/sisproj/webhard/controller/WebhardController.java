package com.siszo.sisproj.webhard.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.webhard.model.WebhardService;
import com.siszo.sisproj.webhard.model.WebhardVO;

@Controller
@RequestMapping("/webhard")
public class WebhardController {
	private static final Logger logger = LoggerFactory.getLogger(WebhardController.class);
	
	@Autowired
	private FileUploadUtil fileUtil;
	@Autowired
	private WebhardService wService;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		logger.info("웹하드 메인 화면 보여주기");
		
		List<WebhardVO> list = wService.selectWebhard();
		logger.info("업로드된 파일 조회 결과 list.size()={}",list.size());
		
		model.addAttribute("list",list);
		
		return "webhard/main";
	}
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public int upFile(HttpServletRequest request, HttpSession session) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("ajax방식 - 웹하드 파일 업로드");
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList = null;
		String fileName="", fileOriName="";
		long fileSize=0;
		List<WebhardVO> uploadFileList = new ArrayList<WebhardVO>();
		boolean fileResult = true;
		int result = 0;
		try {
			fileList = fileUtil.fileupload(request, FileUploadUtil.WEBHARD);
			//파일 업로드 성공시
			if(fileList!=null && !fileList.isEmpty()) {
				logger.info("파일 개수 fileList.size()={}",fileList.size());
				for(Map<String, Object> map : fileList) {
					fileOriName = (String) map.get("originalFileName");
					fileName = (String) map.get("fileName");
					fileSize = (Long) map.get("fileSize");
					
					WebhardVO wVo = new WebhardVO();
					wVo.setFileName(fileName);
					wVo.setFileOriName(fileOriName);
					wVo.setFileSize(fileSize);
					wVo.setEmpNo(empVo.getEmpNo());
					
					uploadFileList.add(wVo);
				}
				
				result = wService.insertWebhard(uploadFileList);
				logger.info("웹하드 파일 업로드 결과 result={}", result);
			}
		} catch (IllegalStateException e) {
			fileResult=false;
			e.printStackTrace();
		} catch (IOException e) {
			fileResult=false;
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/deleteItem.do")
	@ResponseBody
	public int deleteItem(@RequestParam int fileNo, HttpSession session) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("파일 삭제 처리, 파라미터 fileNo={}",fileNo);
		int cnt=0;
		WebhardVO wvo = wService.selectWebhardByFileNo(fileNo);
		if(wvo.getEmpNo() == empVo.getEmpNo() || empVo.getEmpLev() == "관리자") {
			cnt = wService.deleteWebhard(fileNo);			
		}
		
		return cnt;
	}
	
	@RequestMapping("/fileInfo.do")
	@ResponseBody
	public WebhardVO fileInfo(@RequestParam int fileNo) {
		logger.info("파일 상세정보 처리, fileNo={}",fileNo);
		
		WebhardVO wvo = wService.selectWebhardByFileNo(fileNo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		wvo.setRegdate(sdf.format(wvo.getFileRegdate()));
		
		return wvo;
	}
}
