package com.siszo.sisproj.news.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.message.model.MessageSearchVO;
import com.siszo.sisproj.news.model.NewsComVO;
import com.siszo.sisproj.news.model.NewsDAO;
import com.siszo.sisproj.news.model.NewsLikeVO;
import com.siszo.sisproj.news.model.NewsListVO;
import com.siszo.sisproj.news.model.NewsSearchVO;
import com.siszo.sisproj.news.model.NewsService;
import com.siszo.sisproj.news.model.NewsVO;

@Controller
@RequestMapping("/news")
public class NewsController {
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);

	@Autowired
	private NewsService newsService;

	@Autowired
	private FileUploadUtil FileUtil;

	

	@RequestMapping("/dailyNews.do")
	public void DailyNewsView(Model model, @ModelAttribute NewsSearchVO newsSearchVO) {
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.NEWSRECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(newsSearchVO.getCurrentPage());

		newsSearchVO.setRecordCountPerPage(Utility.NEWSRECORD_COUNT_PER_PAGE);
		newsSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<NewsVO> mainlist = newsService.dailyNewsMainList();
		List<NewsVO> list1 = newsService.dailyNewsList(newsSearchVO);
		List<NewsVO> list = new ArrayList<NewsVO>();

		for (int i = 0; i < list1.size(); i++) {
			NewsVO vo = list1.get(i);
			String cont = vo.getNewsContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			vo.setNewsContent(cont);

			int comcount = newsService.countNewsCommand(vo.getNewsNo());
			vo.setComCount(comcount);

			list.add(vo);
			mainlist.add(vo);
		}
		int totalRecord=newsService.newstotalrecord();
		pagingInfo.setTotalRecord(totalRecord);


		logger.info("데일리뉴스화면 출력 listsize={}", list.size());
		model.addAttribute("list", list);
		model.addAttribute("mainlist", mainlist);
		model.addAttribute("pagingInfo", pagingInfo);
	}


	@RequestMapping("/bottomNews.do")
	public void bottomNews(Model model) {
		List<NewsVO> mainlist = newsService.dailyNewsMainList();
		logger.info("뉴스화면 출력 mainlistsize={}", mainlist.size());
		model.addAttribute("mainlist", mainlist);

	}

	@RequestMapping("/newsDetail.do")
	public String newsDetail(@RequestParam(defaultValue = "0") int newsNo, Model model) {
		NewsVO newsVo = newsService.newsSearchByNo(newsNo);

		List<Map<String, Object>> list = newsService.searchNewsCommand(newsNo);
		logger.info("뉴스 디테일 화면 출력,newsVo ={}", newsVo);

		model.addAttribute("newsVo", newsVo);
		model.addAttribute("list", list);

		return "news/newsDetail";
	}


	@RequestMapping("/newsDetailcnt.do")
	public String countUpdate(@RequestParam(defaultValue="0") int newsNo,
			Model model) {
		logger.info("조회수 증가, 파라미터 newsNo={}", newsNo);

		if(newsNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			return "common/message";
		}

		int cnt = newsService.readcountup(newsNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);

		return "redirect:/news/newsDetail.do?newsNo="+newsNo;
	}



	

	@RequestMapping("/newsLike.do")
	public String cntuplike(@ModelAttribute NewsVO vo, @ModelAttribute NewsLikeVO likevo, @RequestParam int newsNo,
			HttpSession session, Model model) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		vo.setEmpNo(empNo);
		likevo.setEmpNo(empNo);
		logger.info("따봉 처리 vo={}", vo);

		int result = newsService.chklike(likevo);
		String msg = "", url = "";
		if (result > 0) {

			msg = "추천은 한번만 가능합니다.";
			url = "/news/newsDetailcnt.do?newsNo=" + newsNo;

		} else {
			int likecnt = newsService.insertlike(likevo);
			int cnt = newsService.updatelikecnt(vo);
			msg = "추천 성공";
			url = "/news/newsDetailcnt.do?newsNo=" + newsNo;
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";
	}

	@RequestMapping("/topDailynews.do")
	public void newslikeRanking(Model model) {
		List<NewsVO> likelist = newsService.newslikeRanking();
		List<Map<String, Object>> comlist = newsService.newscomRanking();
		List<NewsVO> readlist = newsService.newsreadRanking();

		model.addAttribute("likelist", likelist);
		model.addAttribute("comlist", comlist);
		model.addAttribute("readlist", readlist);
	}

	@RequestMapping("/newsComDelete")
	public String deleteNewsCom(@ModelAttribute NewsComVO comVo, Model model) {

		int cnt=newsService.deleteNewsCom(comVo);
		logger.info("댓글삭제 파라미터 conVo={}",comVo);
		logger.info("댓글삭제 파라미터 cnt={}",cnt);

		String msg = "", url = "/news/newsDetailcnt.do?newsNo="+ comVo.getNewsNo();
		if (cnt > 0) {
			msg = "댓글 삭제 성공";
		} else {
			msg = "댓글 삭제 실패";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";

	}

	
	@RequestMapping("/comWrite.do")
	public String insertCom(@ModelAttribute NewsComVO vo, @RequestParam int newsNo, HttpSession session, Model model) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		vo.setEmpNo(empNo);
		logger.info("뉴스 댓글 파라미터 newsComvo={}", vo);
		int cnt = newsService.insertNewsCommand(vo);
		String msg = "", url = "";
		if (cnt > 0) {
			msg = "등록 성공";
			url = "/news/newsDetailcnt.do?newsNo=" + newsNo;
		} else {
			msg = "등록 실패";
			url = "/news/dailyNews.do";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";
	}
	
	
	
	@RequestMapping("/adm/newsWrite.do")
	public String newWrite() {
		return "news/newsWrite";			
	}
	
	@RequestMapping("/adm/newsWriteOk.do")
	public String newsInsert(@ModelAttribute NewsVO newsVo, HttpServletRequest request, Model model) {
		logger.info("뉴스 등록 처리, 파라미터 newsVo={}", newsVo);
		String msg = "", url = "";

		List<Map<String, Object>> list = null;
		String newsImage = "";
		try {
			list = FileUtil.fileupload(request, FileUploadUtil.NEWS_IMAGES);
			// 파일 업로드 한 경우
			if (list != null && !list.isEmpty()) {
				for (Map<String, Object> map : list) {
					newsImage = (String) map.get("fileName");
				} // for
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		newsVo.setNewsImage(newsImage);
		int cnt = newsService.insertNews(newsVo);

		if (cnt > 0) {
			msg = "뉴스 등록 성공";
			url = "/news/adm/newsRegdit.do";
		} else {
			msg = "뉴스 등록 실패";
			url = "/news/adm/newsWrite.do";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";

	}
	
	
	@RequestMapping(value = "/adm/newsEdit.do", method = RequestMethod.GET)
	public String newsEdit_get(@RequestParam(defaultValue = "0") int newsNo, Model model) {

		NewsVO newsVo = newsService.newsSearchByNo(newsNo);
		logger.info("뉴스 수정 화면 출력,newsVo ={}", newsVo);

		model.addAttribute("newsVo", newsVo);

		return "news/newsEdit";
	}

	@RequestMapping(value = "/adm/newsEdit.do", method = RequestMethod.POST)
	public String newsEdit_post(@ModelAttribute NewsVO newsVo, HttpServletRequest request, Model model) {
		logger.info("뉴스 수정처리 newsvo={}", newsVo);
		logger.info("뉴스 수정 이미지  getNewsImage={}", newsVo.getNewsImage());
		String msg = "", url = "/news/adm/newsRegdit.do";
		if (newsVo.getNewsImage() == null || newsVo.getNewsImage().isEmpty()) {
			List<Map<String, Object>> list = null;
			String newsImage = "";
			try {
				list = FileUtil.fileupload(request, FileUploadUtil.NEWS_IMAGES);
				// 파일 업로드 한 경우
				if (list != null && !list.isEmpty()) {
					for (Map<String, Object> map : list) {
						newsImage = (String) map.get("fileName");
					} // for
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			newsVo.setNewsImage(newsImage);
			int cnt = 0;
			cnt = newsService.newsUpdate(newsVo);

			if (cnt > 0) {
				msg = "뉴스 수정 성공";
			} else {
				msg = "뉴스 수정 실패";
			}
		} else if (newsVo.getNewsImage() != null && !newsVo.getNewsImage().isEmpty()) {
			int cnt = 0;
			logger.info("뉴스 수정처리############################3 vo={}", newsVo);
			cnt = newsService.newsUpdateImageException(newsVo);
			if (cnt > 0) {
				msg = "뉴스 수정 성공";
			} else {
				msg = "뉴스 수정 실패";
			}
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";
	}
	
	@RequestMapping("/adm/newsDelete.do")
	public String newsDelete(@RequestParam(defaultValue = "0") int newsNo, @RequestParam String newsImage,
			HttpServletRequest request, Model model) {
		logger.info("뉴스 삭제처리 newsNo={}", newsNo);
		logger.info("oldfileName####={}", newsImage);
		int cnt = newsService.newsDelete(newsNo);

		String msg = "", url = "";

		if (cnt > 0) {
			if (newsImage != null && !newsImage.isEmpty()) {
				String path = FileUtil.getUploadPath(request, FileUploadUtil.NEWS_IMAGES);
				File delFile = new File(path, newsImage);
				if (delFile.exists()) {
					boolean bool = delFile.delete();
					logger.info("뉴스 이미지 삭제여부 bool={}", bool);
				}
			}
			msg = "뉴스 삭제 성공";
			url = "/news/adm/newsRegdit.do";
		} else {
			msg = "뉴스 삭제 실패";
			url = "/news/adm/newsDetailcnt.do?newsNo="+newsNo;
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";

	}
	
	@RequestMapping("/adm/newsRegdit.do")
	public String registerView(Model model, @ModelAttribute NewsSearchVO newsSearchVO) {
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.NEWSRECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(newsSearchVO.getCurrentPage());

		newsSearchVO.setRecordCountPerPage(Utility.NEWSRECORD_COUNT_PER_PAGE);
		newsSearchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<NewsVO> list1 = newsService.newsAllselect(newsSearchVO);
		List<NewsVO> list = new ArrayList<NewsVO>();

		for (int i = 0; i < list1.size(); i++) {
			NewsVO vo = list1.get(i);
			String cont = vo.getNewsContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			vo.setNewsContent(cont);

			int comcount = newsService.countNewsCommand(vo.getNewsNo());
			vo.setComCount(comcount);

			list.add(vo);
		}
		int totalRecord=newsService.newstotalrecord();
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("데일리뉴스화면 출력 listsize={}", list.size());
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "news/newsRegdit";
	}
	
	@RequestMapping("/adm/deleteMulti.do")
	public String deleteMulti(@ModelAttribute NewsListVO newsListVo,HttpServletRequest request, Model model) {

		logger.info("일괄 삭제처리 파라미터newsListVo={}",newsListVo);

		List<NewsVO> list = newsListVo.getNewsItem();

		int cnt = newsService.deleteMulti(list);
		logger.info("선택한 항목 삭제 결과, cnt={}",cnt);

		//이미지 파일 삭제
		String msg="",url="/news/adm/newsRegdit.do";
		if(cnt>0) {
			for(int i=0;i<list.size();i++) {
				NewsVO vo=list.get(i);
/*				logger.info("i={}, newsNo={}",i,vo.getnewsNo());
				logger.info("imageURL={}",vo.getImageURL());
*/		
				int newsNo=vo.getNewsNo();
				//체크한 항목만 파일 삭제
				if(newsNo!=0) {
					String pathname=FileUtil.getUploadPath(request, FileUploadUtil.NEWS_IMAGES);
					File file = new File(pathname,vo.getNewsImage());
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("파일 삭제 여부:{}",bool);
					}
				}
				msg="삭제되었습니다.";	

			}//for
		}else {
			msg="선택한 항목 삭제 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
			
		return "common/message";

	}
	
	
	
}