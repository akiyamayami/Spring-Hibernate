package com.example.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.News;
import com.example.model.OderNews;
import com.example.service.NewsService;
import com.example.service.OderNewsService;

@Controller
public class MainController {
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private OderNewsService odernewsService;
	
	@GetMapping("/")
	public String index(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Home");
		OderNews odernews = odernewsService.getodernews("home");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	public void call(HttpServletRequest request){
		List<News> news =  newsService.getNews();
		List<News> news2 = new ArrayList<>();
		news2.add(news.get(0));
		news2.add(news.get(1));
		news2.add(news.get(2));
		request.setAttribute("news", news2);
	}
	@GetMapping("/home")
	public String Home(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Home");
		OderNews odernews = odernewsService.getodernews("home");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	@GetMapping("/about")
	public String about(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "About");
		OderNews odernews = odernewsService.getodernews("about");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	@GetMapping("/callforpapers")
	public String callforpapers(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Call For Papers");
		OderNews odernews = odernewsService.getodernews("callforpapers");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	@GetMapping("/submission")
	public String submission(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Submission");
		OderNews odernews = odernewsService.getodernews("submission");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	
	@GetMapping("/keynote")
	public String keynote(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Keynote Speakers");
		OderNews odernews = odernewsService.getodernews("keynote");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	@GetMapping("/program")
	public String program(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Program");
		OderNews odernews = odernewsService.getodernews("program");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	@GetMapping("/hotel")
	public String hotel(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Venue & Hotel");
		OderNews odernews = odernewsService.getodernews("hotel");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	@GetMapping("/contact")
	public String contact(HttpServletRequest request){
		call(request);
		request.setAttribute("title", "Contact");
		OderNews odernews = odernewsService.getodernews("contact");
		request.setAttribute("odernews", odernews);
		return "index";
	}
	
	//List news 
	@GetMapping("/listNews")
	public String listNews(HttpServletRequest request){
		call(request);
		List<News> news3 = newsService.getNews();
		request.setAttribute("MODE", "LIST");
		request.setAttribute("New", news3);
		return "index";
	}
	@GetMapping("/viewNews")
	public String viewNews(@RequestParam("id") String id, HttpServletRequest request){
		call(request);
		News news = newsService.findNews(Integer.parseInt(id));
		request.setAttribute("news3", news);
		return "index";
	}
	
	
}
