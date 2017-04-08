package com.example.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.dao.NewsRepository;
import com.example.model.News;

@Service
@Transactional
public class NewsService {
	private final NewsRepository newsRepository;
	
	public NewsService(NewsRepository newsRepository){
		this.newsRepository = newsRepository;
	}
	
	public List<News> findAll(){
		List<News> news = new ArrayList<>();
		for(News newx : newsRepository.findAll()){
			news.add(newx);
		}
		return news;
	}
	
	public News findNews(int id){
		return newsRepository.findOne(id);
	}
	
	public void saveNews(News news){
		newsRepository.save(news);
	}
	public void deleteNews(int id){
		newsRepository.delete(id);
	}
	
	public void updateNews(int id){
		newsRepository.delete(id);
	}
	
	public int getIDnext(){
		return newsRepository.getIDnext() + 1;
	}
	
	public List<News> getNews(){
		List<News> news = new ArrayList<>();
		for(News newx : newsRepository.getNew()){
			news.add(newx);
		}
		System.out.println(news);
		return news;
	}
}
