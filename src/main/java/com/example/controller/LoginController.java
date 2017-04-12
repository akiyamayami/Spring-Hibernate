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
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.example.validator.FileValidator;
import com.example.validator.NewsFormValidator;

import scala.annotation.meta.setter;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private NewsService newsService;
	
	
	
	@Autowired
	private NewsFormValidator newsFormValidator;
	
	@Autowired
	private FileValidator fileValidator;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(newsFormValidator);
	}
	
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
	
	@RequestMapping(value = "/chinhsuanew-{newsID}", method = RequestMethod.GET)
	public String edit(@PathVariable int newsID, Model model) {
			model.addAttribute("MODE","MODE_EDIT");
			News news = newsService.findNews(newsID);
			model.addAttribute("news",news);
		return "admin";
	}
	
	
	@GetMapping("/deletenew-{newsID}")
	public String delete(@PathVariable int newsID){
		newsService.deleteNews(newsID);
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/themnew", method = RequestMethod.GET)
	public String add( Model model) {
			model.addAttribute("MODE","MODE_ADD");
			model.addAttribute("news",new News());
		return "admin";
	}
	
	
	@RequestMapping(value = "/themnew", method = RequestMethod.POST)
	public String saveOrUpdateUser(@ModelAttribute("news") @Validated News news,
			BindingResult result, Model model,@RequestParam("file") MultipartFile file
			,@RequestParam("hinhanh") MultipartFile hinhanh,
			HttpServletRequest request) {

		fileValidator.validate(file, result);
		if(result.hasErrors()){
			model.addAttribute("MODE","MODE_ADD");
			return "admin";
		}
		int idnext = newsService.getIDnext();
		String namefile = null;
		String nameanh = null;
		String location = null;
		String name = null;
		int id = news.getId();
		System.out.println(hinhanh.getSize());
		if (!file.isEmpty()) {
		
			location = request.getServletContext().getRealPath("static") + "/File/";
			name = file.getOriginalFilename();
			if(id != 0)
				namefile = id + name.substring(name.lastIndexOf("."),name.length());
			else
				namefile = idnext + name.substring(name.lastIndexOf("."),name.length());
			uploadfile(file,location,namefile);
		}
		if (!hinhanh.isEmpty()) {
			location = request.getServletContext().getRealPath("static") + "/Image/";
			name = hinhanh.getOriginalFilename();
			if(id != 0)
				nameanh = id + name.substring(name.lastIndexOf("."),name.length());
			else
				nameanh = idnext + name.substring(name.lastIndexOf("."),name.length());
			uploadfile(file,location,nameanh);
		}
		if(namefile != null)
			news.setFile("static/File/" + namefile );
		if(nameanh != null)
			news.setHinhanh("static/Image/" + nameanh );
		newsService.saveNews(news);
		return "redirect:/admin";
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
	
	
	@GetMapping("/logout")
	public String logout(){return "redirect:/";}
	
	
	
}


