package com.siszo.sisproj.news.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.util.FileUtil;
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
import com.siszo.sisproj.news.model.NewsService;
import com.siszo.sisproj.news.model.NewsVO;
import com.siszo.sisproj.schmodel.SchedulerVO;

@Controller
@RequestMapping("/news")
public class NewsController {
	private static final Logger logger =LoggerFactory.getLogger(NewsController.class);

	@Autowired
	private NewsService newsService;

	@Autowired
	private FileUploadUtil FileUtil;


	@RequestMapping("/news.do")
	public void newsView(Model model) {
		List<NewsVO> list1 = newsService.dailyNewsList();
		List<NewsVO> list = new ArrayList<NewsVO>();
		for(int i=0;i<list1.size();i++) {
			NewsVO vo = list1.get(i);
			String cont = vo.getNewsContent().replace("<br>","\r\n");
			/*			cont = vo.getNewsContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");*/
			cont = vo.getNewsContent().replaceAll("<[^>]*>", "");
			vo.setNewsContent(cont);
			list.add(vo);
		}
		logger.info("뉴스화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);
	}

	@RequestMapping("/newsWriteOk.do")
	public String newsInsert(@ModelAttribute NewsVO newsVo, HttpServletRequest request, Model model) {
		logger.info("뉴스 등록 처리, 파라미터 newsVo={}",newsVo);
		String msg="", url="";

		List<Map<String, Object>> list=null;
		String newsImage="";
		try {
			list=FileUtil.fileupload(request,FileUploadUtil.NEWS_IMAGES);			
			//파일 업로드 한 경우
			if(list!=null && !list.isEmpty()){
				for(Map<String, Object> map : list){
					newsImage=(String)map.get("fileName");		
				}//for
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		newsVo.setNewsImage(newsImage);
		int cnt = newsService.insertNews(newsVo);

		if(cnt>0)
		{
			msg="뉴스 등록 성공";
			url="/news/dailyNews.do";
		}else {
			msg="뉴스 등록 실패";
			url="/news/newsWrite.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";

	}


	@RequestMapping("/photoNews.do")
	public void photoNewsView() {

	}

	@RequestMapping("/dailyNews.do")
	public void DailyNewsView(Model model) {
		List<NewsVO> list1 = newsService.dailyNewsList();
		List<NewsVO> list = new ArrayList<NewsVO>();
		for(int i=0;i<list1.size();i++) {
			NewsVO vo = list1.get(i);
			String cont = vo.getNewsContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			vo.setNewsContent(cont);
			list.add(vo);
		}
		logger.info("데일리뉴스화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);


	}

	@RequestMapping("/newsWrite.do")
	public void newWrite() {

	}

	@RequestMapping("/bottomNews.do")
	public void bottomNews(Model model) {
		List<NewsVO> list = newsService.dailyNewsList();
		logger.info("뉴스화면 출력 listsize={}",list.size());
		model.addAttribute("list",list);

	}

	@RequestMapping("/newsDetail.do")
	public String newsDetail(@RequestParam(defaultValue="0") int newsNo, Model model) {
		NewsVO newsVo=newsService.newsSearchByNo(newsNo);
		logger.info("뉴스 디테일 화면 출력,newsVo ={}",newsVo);


		model.addAttribute("newsVo",newsVo);

		return "news/newsDetail";
	}

	@RequestMapping(value="/newsEdit.do", method=RequestMethod.GET)
	public String newsEdit_get(@RequestParam(defaultValue="0") int newsNo, Model model) {

		NewsVO newsVo=newsService.newsSearchByNo(newsNo);
		logger.info("뉴스 수정 화면 출력,newsVo ={}",newsVo);

		model.addAttribute("newsVo",newsVo);

		return "news/newsEdit";
	}

	@RequestMapping(value="/newsEdit.do", method=RequestMethod.POST)
	public String newsEdit_post(@ModelAttribute NewsVO newsVo, Model model) {
		logger.info("뉴스 수정처리 newsvo={}",newsVo);
		String msg="", url="/news/dailyNews.do";
			if(newsVo.getNewsImage()==null) {
			int cnt =0;
			cnt=newsService.newsUpdate(newsVo);
			if(cnt>0) {
				msg="뉴스 수정 성공";
			}else {
				msg="뉴스 수정 실패";
			}
		}else if(newsVo.getNewsImage()!=null) {
			int cnt =0;
			logger.info("뉴스 수정처리############################3 vo={}",newsVo);
			cnt=newsService.newsUpdateImageException(newsVo);
			if(cnt>0) {
				msg="뉴스 수정 성공";
			}else {
				msg="뉴스 수정 실패";
			}
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";
	}

	
	@RequestMapping("/newsDelete.do")
	public String newsDelete(@RequestParam (defaultValue="0") int newsNo, @RequestParam String newsImage, HttpServletRequest request ,Model model) {
		logger.info("뉴스 삭제처리 newsNo={}",newsNo);
		logger.info("oldfileName####={}",newsImage);
		int cnt = newsService.newsDelete(newsNo);
		
		String msg="", url="";

		if(cnt>0)
		{
			if(newsImage!=null && !newsImage.isEmpty()) {
				String path=FileUtil.getUploadPath(request, FileUploadUtil.NEWS_IMAGES);
				File delFile = new File(path, newsImage);
				if(delFile.exists()) {
					boolean bool=delFile.delete();
					logger.info("뉴스 이미지 삭제여부 bool={}", bool);
				}
			}
			msg="뉴스 삭제 성공";
			url="/news/dailyNews.do";
		}else {
			msg="뉴스 삭제 실패";
			url="/news/newsDetail.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";

		
		
	}
}
