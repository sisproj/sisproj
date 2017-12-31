package com.siszo.sisproj.confirm.common;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.siszo.sisproj.confirm.comment.model.CommentVO;
import com.siszo.sisproj.confirm.confirmline.model.ConfirmLineVO;
import com.siszo.sisproj.confirm.docform.model.DocumentFormVO;
import com.siszo.sisproj.confirm.file.model.ConfirmFileVO;
import com.siszo.sisproj.confirm.model.DocumentVO;
import com.siszo.sisproj.employee.model.EmployeeVO;


public class ConfirmGetXls extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//엑셀파일에 들어갈 문서
		DocumentVO dVo = (DocumentVO) model.get("dVo");
		
		//해당문서 양식
		DocumentFormVO dfVo = (DocumentFormVO) model.get("dfVo");
		
		//해당문서 기안자
		EmployeeVO writerEmpVo = (EmployeeVO) model.get("writerEmpVo");
		
		//해당문서 결재라인 
		List<ConfirmLineVO> clVoList = (List<ConfirmLineVO>) model.get("clVoList");
		
		//해당문서 연계문서
		DocumentVO linkDoc = (DocumentVO) model.get("linkDoc");
		
		//해당문서 첨부파일
		List<ConfirmFileVO> fileList = (List<ConfirmFileVO>) model.get("fileList");

		//해당문서 의견
		List<CommentVO> commVoList = (List<CommentVO>) model.get("commVoList");
		
		//날짜형식
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		String exceln = dVo.getFormName()+"_"+dVo.getCfTitle();
		String excelName = URLEncoder.encode(exceln,"UTF-8");
		
		HSSFSheet worksheet = null;
		HSSFRow row = null;
		
		worksheet = workbook.createSheet(dVo.getFormName());
		
		worksheet.setDefaultColumnWidth((short) 9.38);

		Font bold = workbook.createFont();
		bold.setBoldweight(Font.BOLDWEIGHT_BOLD);
		
		Font hFont = workbook.createFont();
		hFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		hFont.setFontHeightInPoints((short) 20);
		
		CellStyle headStyle = workbook.createCellStyle();
		headStyle.setAlignment((short) 2);
		headStyle.setFont(hFont);
		
		//1행
		row = worksheet.createRow(0);
		row.setHeightInPoints(31.5f);
		
		worksheet.addMergedRegion(new CellRangeAddress(0,0,0,7));
		
		Cell hCell = row.createCell(0);
		hCell.setCellValue(dVo.getFormName());
		hCell.setCellStyle(headStyle);

		//2행부터 row 높이
		
		//2행
		row = worksheet.createRow(1);
		row.setHeightInPoints(17.25f);
		
		//3행
		row = worksheet.createRow(2);
		row.setHeightInPoints(17.25f);
		
		
		Cell cell30 = row.createCell(0);
		cell30.setCellValue("기안자");
		CellStyle cell30s = workbook.createCellStyle();
		cell30s.setAlignment((short) 2);
		cell30.setCellStyle(cell30s);

		worksheet.addMergedRegion(new CellRangeAddress(2,2,1,2));
		Cell cell31 = row.createCell(1);
		cell31.setCellValue(writerEmpVo.getEmpName()+"("+writerEmpVo.getPosName()+")");

		int clcnt = clVoList.size();
		int clcnt1row = 0;
		if(clcnt>4) {
			clcnt1row = 4;
		} else {
			clcnt1row = clcnt;
		}
		for(int i=0; i<clcnt1row; i++) {
			Cell cs = row.createCell(i+4);
			cs.setCellValue("결재");
			CellStyle csst = workbook.createCellStyle();
			csst.setAlignment((short) 2);
			csst.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
			csst.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
			csst.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
			cs.setCellStyle(csst);
		}
		
		//4행
		row = worksheet.createRow(3);
		row.setHeightInPoints(17.25f);
		for(int i=0; i<clcnt1row; i++) {
			Cell cs = row.createCell(i+4);
			cs.setCellValue(clVoList.get(i).getEmpName());
			CellStyle csst = workbook.createCellStyle();
			csst.setAlignment((short) 2);
			csst.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
			csst.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
			cs.setCellStyle(csst);
		}
		
		//5행
		row = worksheet.createRow(4);
		row.setHeightInPoints(17.25f);
		
		
		Cell cell50 = row.createCell(0);
		cell50.setCellValue("문서 번호");
		CellStyle cell50s = workbook.createCellStyle();
		cell50s.setAlignment((short) 2);
		cell50s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell50s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell50s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell50s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell50s.setFont(bold);
		cell50.setCellStyle(cell50s);
		
		worksheet.addMergedRegion(new CellRangeAddress(4,4,1,2));
		Cell cell51 = row.createCell(1);
		Cell cell52 = row.createCell(2);
		cell51.setCellValue(dVo.getCfNo());
		CellStyle cell51s = workbook.createCellStyle();
		cell51s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell51s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell51s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell51s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell51.setCellStyle(cell51s);
		cell52.setCellStyle(cell51s);
		
		for(int i=0; i<clcnt1row; i++) {
			Cell cs = row.createCell(i+4);
			cs.setCellValue(sdf.format(clVoList.get(i).getLineRegdate()));
			CellStyle csst = workbook.createCellStyle();
			csst.setAlignment((short) 2);
			csst.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
			csst.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
			csst.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
			cs.setCellStyle(csst);
		}
		
		//6행
		row = worksheet.createRow(5);
		row.setHeightInPoints(17.25f);
		Cell cell60 = row.createCell(0);
		cell60.setCellValue("기안 일자");
		CellStyle cell60s = workbook.createCellStyle();
		cell60s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell60s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell60s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell60s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell60s.setAlignment((short) 2);
		cell60s.setFont(bold);
		cell60.setCellStyle(cell60s);

		worksheet.addMergedRegion(new CellRangeAddress(5,5,1,2));
		Cell cell61 = row.createCell(1);
		Cell cell62 = row.createCell(2);
		cell61.setCellValue(sdf.format(dVo.getCfRegdate()));
		CellStyle cell61s = workbook.createCellStyle();
		cell61s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell61s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell61s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell61s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell61.setCellStyle(cell61s);
		cell62.setCellStyle(cell61s);
		
		if(clVoList.size()>4) {
			for(int i=4; i<clcnt; i++) {
				Cell cs = row.createCell(i);
				cs.setCellValue("결재");
				CellStyle csst = workbook.createCellStyle();
				csst.setAlignment((short) 2);
				csst.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
				csst.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
				csst.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
				cs.setCellStyle(csst);
			}
		}
		
		//7행
		row = worksheet.createRow(6);
		row.setHeightInPoints(17.25f);
		Cell cell70 = row.createCell(0);
		cell70.setCellValue("보존 년한");
		CellStyle cell70s = workbook.createCellStyle();
		cell70s.setAlignment((short) 2);
		cell70s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell70s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell70s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell70s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell70s.setFont(bold);
		cell70.setCellStyle(cell70s);
		
		worksheet.addMergedRegion(new CellRangeAddress(6,6,1,2));
		Cell cell71 = row.createCell(1);
		Cell cell72 = row.createCell(2);
		cell71.setCellValue(dfVo.getFormLife());
		CellStyle cell71s = workbook.createCellStyle();
		cell71s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell71s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell71s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell71s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell71.setCellStyle(cell71s);
		cell72.setCellStyle(cell71s);

		if(clVoList.size()>4) {
			for(int i=4; i<clcnt; i++) {
				Cell cs = row.createCell(i);
				cs.setCellValue(clVoList.get(i).getEmpName());
				CellStyle csst = workbook.createCellStyle();
				csst.setAlignment((short) 2);
				csst.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
				csst.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
				cs.setCellStyle(csst);
			}
		}
		
		//8행
		row = worksheet.createRow(7);
		row.setHeightInPoints(17.25f);
		Cell cell80 = row.createCell(0);
		cell80.setCellValue("보안 수준");
		CellStyle cell80s = workbook.createCellStyle();
		cell80s.setAlignment((short) 2);
		cell80s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell80s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell80s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell80s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell80s.setFont(bold);
		cell80.setCellStyle(cell80s);
		

		worksheet.addMergedRegion(new CellRangeAddress(7,7,1,2));
		Cell cell81 = row.createCell(1);
		Cell cell82 = row.createCell(2);
		cell81.setCellValue(dfVo.getFormSecu());
		CellStyle cell81s = workbook.createCellStyle();
		cell81s.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell81s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell81s.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell81s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cell81.setCellStyle(cell81s);
		cell82.setCellStyle(cell81s);
		

		if(clVoList.size()>4) {
			for(int i=4; i<clcnt; i++) {
				Cell cs = row.createCell(i);
				cs.setCellValue(sdf.format(clVoList.get(i).getLineRegdate()));
				CellStyle csst = workbook.createCellStyle();
				csst.setAlignment((short) 2);
				csst.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
				csst.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
				csst.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
				cs.setCellStyle(csst);
			}
		}
		
		//9행
		row = worksheet.createRow(8);
		row.setHeightInPoints(17.25f);
		
		CellStyle lineB = workbook.createCellStyle();
		lineB.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		
		for(int i=0; i<8; i++) {
			Cell celll = row.createCell(i);
			celll.setCellStyle(lineB);
		}
		
		//10행
		row = worksheet.createRow(9);
		row.setHeightInPoints(17.25f);
		worksheet.addMergedRegion(new CellRangeAddress(9,9,1,7));
		Cell cell100 = row.createCell(0);
		cell100.setCellValue("연계문서");
		CellStyle cell100s = workbook.createCellStyle();
		cell100s.setAlignment((short) 2);
		cell100s.setFont(bold);
		cell100.setCellStyle(cell100s);
		if(linkDoc != null) {
			row.createCell(1).setCellValue("("+linkDoc.getCfNo()+") "+linkDoc.getCfTitle());			
		}
		
		//11행
		row = worksheet.createRow(10);
		row.setHeightInPoints(17.25f);
		worksheet.addMergedRegion(new CellRangeAddress(10,10,1,7));
		Cell cell110 = row.createCell(0);
		cell110.setCellValue("제목");
		CellStyle cell110s = workbook.createCellStyle();
		cell110s.setAlignment((short) 2);
		cell110s.setFont(bold);
		cell110.setCellStyle(cell110s);
		row.createCell(1).setCellValue(dVo.getCfTitle());
		
		//12행
		row = worksheet.createRow(11);
		row.setHeightInPoints(17.25f);	
		
		//13행 ~ 30행
		row = worksheet.createRow(12);
		row.setHeightInPoints(17.25f);
		Cell cell130 = row.createCell(0);
		cell130.setCellValue("내용");
		CellStyle cell130s = workbook.createCellStyle();
		cell130s.setAlignment((short) 2);
		cell130s.setFont(bold);
		cell130.setCellStyle(cell130s);
		row.createCell(1).setCellValue(dVo.getCfTitle());

		CellStyle cs = workbook.createCellStyle();
		cs.setWrapText(true);
		cs.setVerticalAlignment((short) 0);
		Cell cell = row.createCell(1);
		cell.setCellStyle(cs);
		
		String cont = dVo.getCfContent().replaceAll("</p>", "\n");
		cont = cont.replaceAll("<[^>]*>", "");
		cont = cont.replace("&nbsp;", " ");
		
		cell.setCellValue(cont);
		
		for(int i=13; i<=29; i++) {
			row = worksheet.createRow(i);
			row.setHeightInPoints(17.25f);
		}
		worksheet.addMergedRegion(new CellRangeAddress(12,29,1,7));		
		
		//31행
		row = worksheet.createRow(30);
		row.setHeightInPoints(17.25f);

		CellStyle lineT = workbook.createCellStyle();
		lineT.setBorderTop(HSSFCellStyle.BORDER_THIN);
		
		for(int i=0; i<8; i++) {
			Cell celll = row.createCell(i);
			celll.setCellStyle(lineT);
		}
		
		//32행 ~ 36행
		if(fileList!=null && !fileList.isEmpty()) {
			for(int i=1; i<=fileList.size(); i++) {
				row = worksheet.createRow(i+31);
				row.setHeightInPoints(17.25f);	
				Cell css = row.createCell(0);
				css.setCellValue("첨부파일"+i);
				CellStyle csst = workbook.createCellStyle();
				csst.setAlignment((short) 2);
				csst.setFont(bold);
				css.setCellStyle(csst);
				row.createCell(1).setCellValue(dVo.getCfTitle());
				worksheet.addMergedRegion(new CellRangeAddress(i+31,i+31,1,7));	
				row.createCell(1).setCellValue(fileList.get(i-1).getFileOriName());
			}
		}
		
		if(commVoList!=null && !commVoList.isEmpty()) {
			//37행
			row = worksheet.createRow(36);
			row.setHeightInPoints(17.25f);
			Cell cell370 = row.createCell(0);
			cell370.setCellValue("의견");
			CellStyle cell370s = workbook.createCellStyle();
			cell370s.setAlignment((short) 2);
			cell370s.setFont(bold);
			cell370.setCellStyle(cell370s);
			worksheet.addMergedRegion(new CellRangeAddress(36,36,2,7));
			row.createCell(1).setCellValue(commVoList.get(0).getEmpName());
			row.createCell(2).setCellValue(commVoList.get(0).getCommContent());
			//38행 부터
			for(int i=1; i<commVoList.size(); i++) {
				row = worksheet.createRow(i+36);
				row.setHeightInPoints(17.25f);	
				worksheet.addMergedRegion(new CellRangeAddress(i+36,i+36,2,7));
				row.createCell(1).setCellValue(commVoList.get(i).getEmpName());
				row.createCell(2).setCellValue(commVoList.get(i).getCommContent());
			}
		}
		
		response.setContentType("Application/Msexcel"); 
		response.setHeader("Content-Disposition", "ATTachment; Filename="+excelName+"-excel.xls");
	}
	

}
