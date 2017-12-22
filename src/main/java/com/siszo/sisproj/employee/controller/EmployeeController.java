package com.siszo.sisproj.employee.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.SearchVO;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeListVO;
import com.siszo.sisproj.employee.model.EmployeeService;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private FileUploadUtil fileUtil;

	@Autowired
	private DeptService deptService;

	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.GET)
	public String employeeRegister_get() {
		logger.info("사원등록 화면 보여주기");	

		return "employee/employeeRegister";
	}	
	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.POST)
	public String employeeRegister_post(@ModelAttribute EmployeeVO vo,
			@RequestParam String empHiredate1,HttpServletRequest request,Model model) {
		logger.info("사원 등록 , 파라미터 vo={}, empHiredate1={}",vo, empHiredate1);

		Timestamp hiredate =Timestamp.valueOf(empHiredate1+" 00:00:00");

		/*String email1 = vo.getEmail1();
		String email2 = vo.getEmail2();
		String email3 = vo.getEmail3();

		String tel1 = vo.getTel1();
		String tel2 = vo.getTel2();
		String tel3 = vo.getTel3();

		String jumin1 = vo.getJumin1();
		String jumin2 = vo.getJumin2();


		logger.info("사원 등록 , 파라미터 vo={}",vo);
		if(vo.getEmpEmail()!=null && !vo.getEmpEmail().isEmpty()) {
			if(email2.equals("etc") && email1!=null && !email1.isEmpty() && email3!=null && !email3.isEmpty()) {
				vo.setEmpEmail(email1+"@"+email3);
			}else if(email1!=null && !email1.isEmpty() && email2!=null && !email2.isEmpty()){
				vo.setEmpEmail(email1+"@"+email2);
			}
		}
		if(vo.getEmpTel()!=null && !vo.getEmpTel().isEmpty()) {
			if(tel1!=null && !tel1.isEmpty() && tel2!=null && !tel2.isEmpty() && tel3!=null && !tel3.isEmpty()) {
				vo.setEmpTel(tel1+"-"+tel2+"-"+tel3);
			}
		}
		if(vo.getEmpSsn()!=null && !vo.getEmpSsn().isEmpty()) {
			if(jumin1!=null && !jumin1.isEmpty() && jumin2!=null && !jumin2.isEmpty()) {
				vo.setEmpSsn(jumin1+"-"+jumin2);
			}
		}*/

		vo.setEmpHiredate(hiredate);

		List<Map<String, Object>> list=null;
		String empImg="";
		try {
			list=fileUtil.fileupload(request,FileUploadUtil.EMP_IMAGE_UPLOAD);			
			//파일 업로드 한 경우
			if(list!=null && !list.isEmpty()){
				for(Map<String, Object> map : list){
					empImg=(String)map.get("fileName");		
				}//for
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		logger.info("vo.getEmpImg={}",vo.getEmpImg());
		//db작업
		vo.setEmpImg(empImg);

		int cnt=employeeService.insertEmployee(vo);

		String msg="",url="/employee/employeeRegister.do";
		if(cnt>0){
			msg="사원 등록 완료!";
			url="/home.do";
		}else {
			msg="사원 등록 실패!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/employeeDetail.do")
	public String employeeDetail(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원상세보기 화면 보여주기,파라미터 empNo={}",empNo);

		EmployeeVO vo = employeeService.selectEmployeeByNo(empNo);

		List<DeptVO> list = deptService.selectDeptName();

		logger.info("사원 상세 화면 보여주기 결과 vo={}",vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);

		return "employee/employeeDetail";
	}
	@RequestMapping(value="/employeeEdit.do",method=RequestMethod.GET)
	public String employeeEdit_get(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원수정 화면 보여주기, 파라미터 값 empNo={}",empNo);			
		EmployeeVO vo =  employeeService.selectEmployeeByNo(empNo);

		List<DeptVO> list= deptService.selectDeptName();
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);

		logger.info("회원 수정 화면 결과값  vo={}",vo);	

		return "employee/employeeEdit";
	}

	@RequestMapping(value="/employeeDetailSearch.do",method=RequestMethod.GET)
	public String employeeDetailSerach_get(Model model) {
		logger.info("사원 상세검색 화면 보여주기");

		List<DeptVO> list = deptService.selectDeptName();
		logger.info("사원 부서이름 구하기 list.size()={}",list.size());

		model.addAttribute("list",list);

		return "employee/employeeDetailSearch";
	}

	@RequestMapping(value="/employeeEdit.do",method=RequestMethod.POST)
	public String employeeEdit_post(@ModelAttribute EmployeeVO vo
			,@RequestParam String empHiredate1,@RequestParam String oldFileName 
			,HttpServletRequest request,Model model) {
		logger.info("사원 수정 된 파라미터 vo={},empHiredate1={}",vo,empHiredate1);
		logger.info("사원 수정 된 파라미터 oldFileName={}",oldFileName);

		Timestamp hiredate =Timestamp.valueOf(empHiredate1+" 00:00:00");

		vo.setEmpHiredate(hiredate);

		List<Map<String, Object>> list=null;
		String empImg="";
		if(vo.getEmpImg()!=null && !vo.getEmpImg().isEmpty()) {
			try {
				list=fileUtil.fileupload(request,FileUploadUtil.EMP_IMAGE_UPLOAD);			
				if(list!=null && !list.isEmpty()){
					for(Map<String, Object> map : list){
						empImg=(String)map.get("fileName");	

						vo.setEmpImg(empImg);
					}
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}		
			logger.info("vo.getEmpImg={}",vo.getEmpImg());
		}	
		//db작업

		int cnt= employeeService.editEmployee(vo);
		logger.info("수정 결과 cnt={}",cnt);
		String msg="",url="";

		if(cnt>0) {
			msg="사원 수정 성공!";
			url="/employee/employeeDetail.do?empNo="+vo.getEmpNo();

			if(empImg!=null && !empImg.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String path=fileUtil.getUploadPath(request, FileUploadUtil.EMP_IMAGE_UPLOAD);
					File delFile = new File(path, oldFileName);
					if(delFile.exists()) {
						boolean bool=delFile.delete();
						logger.info("기존 파일 삭제여부 bool={}", bool);
					}
				}
			}
		}else {
			msg="사원 수정 실패!";
			url="/employee/employeeEdit.do?empNo="+vo.getEmpNo();
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/employeeOut.do")
	public String employeeOut(@ModelAttribute EmployeeListVO vo,Model model) {
		logger.info("퇴사시킬 사원 ,파라미터 vo={}",vo);
		
		List<EmployeeVO> list = vo.getEmpItems();
		for(EmployeeVO emVo : list) {
			emVo.getEmpNo();
			logger.info("사원 번호  emVo.getEmpNo={}",emVo.getEmpNo());
		}
		int cnt=employeeService.employeeOut(list);
		logger.info("선택한 사원 퇴사 결과, cnt={}",cnt);		

		String msg="",url="/employee/employeeList.do";

		if(cnt>0) {
			msg="사원 퇴사 완료";
		}else {
			msg="사원 퇴사 실패";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	//완료

	@RequestMapping("/employeeList.do")
	public String employeeList(@ModelAttribute SearchVO seVo,Model model) {
		logger.info("사원 리스트 화면 보여주기 seVo={}",seVo );	
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(seVo.getCurrentPage());
		logger.info("페이징처리 값 확인 Utility.BLOCK_SIZE={}"
				+ ",Utility.RECORD_COUNT_PER_PAGE={} ",Utility.BLOCK_SIZE,Utility.RECORD_COUNT_PER_PAGE);
		logger.info("페이징처리 값 확인 seVo.getCurrentPage()={}",seVo.getCurrentPage());
		
		//SearchVo에 값 셋팅
		seVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		seVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값 : {}", seVo);

		List<EmployeeVO> list =employeeService.selectAllEmployee(seVo);
		for(EmployeeVO vo : list) {
			vo.getEmpNo();
			logger.info("사원 번호  vo.getEmpNo={}",vo.getEmpNo());
		}
		logger.info("사원수 결과, list.size()={}", list.size());

		int totalRecord = employeeService.selectTotalRecordCount(seVo);
		logger.info("사원 전체 인원 조회 결과, totalRecord={}", totalRecord);			

		pagingInfo.setTotalRecord(totalRecord);		
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "employee/employeeList";
	}

	@RequestMapping(value="/employeeDetailSearch.do",method=RequestMethod.POST)
	public void employeeDetailSerach_post(@RequestParam String empName,
			@RequestParam String posName,Model model) {
		logger.info("사원 상세 검색 결과 보여주기 empName={},posName={}",empName,posName);
	}

}
