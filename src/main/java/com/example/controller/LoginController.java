package com.example.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.model.News;
import com.example.model.OderNews;
import com.example.service.NewsService;
import com.example.service.OderNewsService;
import com.example.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private OderNewsService oderNewsService;
	
	@GetMapping("/login")
	public String login(HttpServletRequest request){
		return "login";
	}
	@GetMapping("/admin")
	public String admin(HttpServletRequest request){
		request.setAttribute("MODE", "MODE_HOME");
		List<News> news = newsService.findAll();
		request.setAttribute("news", news);
		return "admin";
	}
	
	@GetMapping("/chinhsuanew")
	public String edit(HttpServletRequest request, @RequestParam("id") int id){
		request.setAttribute("MODE", "MODE_EDIT");
		News news = newsService.findNews(id);
		request.setAttribute("news", news);
		return "admin";
	}
	@GetMapping("/deletenew")
	public String delete(@RequestParam("id") int id){
		newsService.deleteNews(id);
		return "admin";
	}
	@GetMapping("/themnew")
	public String add(HttpServletRequest request){
		request.setAttribute("MODE", "MODE_ADD");
		return "admin";
	}
	@PostMapping("/themnew")
	public @ResponseBody
	void addnews(@RequestParam("id") String id, @RequestParam("tieude") String tieude, @RequestParam("noidung") String noidung,
			@RequestParam("date") String date, @RequestParam("fileanh") MultipartFile fileanh,
			@RequestParam("file") MultipartFile file,HttpServletResponse reponse, MultipartHttpServletRequest request) throws ParseException, IOException{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		News news = new News(tieude,noidung,null,null,formatter.parse(date));;
		News news2 = null;
		int idnext = newsService.getIDnext();
		System.out.println("XX +" + id + "+ XX");
		if(id != null && !id.isEmpty())
		{
			news2 = newsService.findNews(Integer.parseInt(id));
		}
		String namefile = null;
		String nameanh = null;
		String location = null;
		String name = null;
		if (!file.isEmpty()) {
			location = request.getServletContext().getRealPath("static") + "/File/";
			name = file.getOriginalFilename();
			if(id != null && !id.isEmpty())
				namefile = id + name.substring(name.lastIndexOf("."),name.length());
			else
				namefile = idnext + name.substring(name.lastIndexOf("."),name.length());
			uploadfile(file,location,namefile);
		}
		if (!fileanh.isEmpty()) {
			location = request.getServletContext().getRealPath("static") + "/Image/";
			name = fileanh.getOriginalFilename();
			if(id != null && !id.isEmpty())
				nameanh = id + name.substring(name.lastIndexOf("."),name.length());
			else
				nameanh = idnext + name.substring(name.lastIndexOf("."),name.length());
			uploadfile(file,location,nameanh);
		}
		if(id != null && !id.isEmpty())
		{
			news.setId(Integer.parseInt(id));
			if(namefile != null)
				news.setFile("static/File/" + namefile );
			else
				news.setFile(news2.getFile());
			if(nameanh != null)
				news.setHinhanh("static/Image/" + nameanh );
			else
				news.setHinhanh(news2.getHinhanh());
		}
		else
		{
			if(namefile != null)
				news.setFile("static/File/" + namefile );
			if(nameanh != null)
				news.setHinhanh("static/Image/" + nameanh );
		}
		newsService.saveNews(news);
		reponse.sendRedirect("/admin");
	}
	
	public void uploadfile(MultipartFile file, String localtion,String namefile){
		byte[] bytes;
		try {
			bytes = file.getBytes();
			File serverFile = new File(localtion + namefile);
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
          
	}
	
	@PostMapping("/login")
	public String checklogin(@RequestParam("id") String id, @RequestParam("password") String password,HttpServletRequest request){
		if(userService.checkpass(id, password))
			return "redirect:/admin";
		return "redirect:/login?error=true";
	}
	
	// Chỉnh sữa cấu hình odernews
	
	@GetMapping("/odernews")
	public String odernews(HttpServletRequest request){
		request.setAttribute("MODE", "MODE_HOME");
		List<OderNews> odernews = oderNewsService.findAll();
		request.setAttribute("odernews", odernews);
		return "odernews";
	}
	@GetMapping("/chinhsuaodernew")
	public String chinhsuaodernew(HttpServletRequest request, @RequestParam("id") String id){
		request.setAttribute("MODE", "MODE_EDIT");
		OderNews odernews = oderNewsService.findOne(Integer.parseInt(id));
		request.setAttribute("odernews", odernews);
		return "odernews";
	}
	
	@PostMapping("/chinhsuaodernew")
	public String chinhsuaodernewpost(HttpServletRequest request, @RequestParam("id") String id,
			@RequestParam("noidung") String noidung){
		OderNews odernews = oderNewsService.findOne(Integer.parseInt(id));
		odernews.setNoidung(noidung);
		oderNewsService.save(odernews);
		return "redirect:/odernews";
	};
	
	
	@GetMapping("/logout")
	public String logout(){return "redirect:/";}
	
	
	
}


