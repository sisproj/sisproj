package com.siszo.sisproj.news.model;

import java.util.List;


public class NewsListVO {
	//관리자페이지 상품일괄 처리시 사용
		//Command객체로 List받기
		
		private List<NewsVO> newsItem;

		public List<NewsVO> getNewsItem() {
			return newsItem;
		}

		public void setNewsItem(List<NewsVO> newsItem) {
			this.newsItem = newsItem;
		}

		@Override
		public String toString() {
			return "NewsListVO [newsItem=" + newsItem + "]";
		}
		
}
