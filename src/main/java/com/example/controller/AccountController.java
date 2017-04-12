package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.News;
import com.example.model.OderNews;
import com.example.model.User;
import com.example.service.OderNewsService;
import com.example.service.UserService;
import com.example.validator.UserValidator;

@Controller
public class AccountController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserValidator userValidator;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(userValidator);
	}
	
	@RequestMapping(value = "/accountmanager", method = RequestMethod.GET)
	public String chinhsuaodernew(Model model) {
		model.addAttribute("MODE", "MODE_HOME");
		model.addAttribute("account",userService.findAll());
		return "accountmanager";
	}
	
	@RequestMapping(value = "/deleteaccount-{userID}", method = RequestMethod.GET)
	public String deleteaccount(Model model,@PathVariable String userID) {
		userService.delete(userID);
		return "redirect:/accountmanager";
	}
	
	@RequestMapping(value = "/chinhsuaaccount-{userID}", method = RequestMethod.GET)
	public String chinhsuaaccount(Model model,@PathVariable String userID) {
		userService.delete(userID);
		return "redirect:/accountmanager";
	}
	
	@RequestMapping(value = "/chinhsuaaccount", method = RequestMethod.POST)
	public String doimatkhau(Model model,@ModelAttribute("user") @Validated User user,
			BindingResult result) {
		if(result.hasErrors())
		{
			model.addAttribute("MODE","MODE_EDIT");
			return "accountmanager";
		}
		userService.save(user);
		return "redirect:/accountmanager";
	}
	
	@RequestMapping(value = "/themaccount", method = RequestMethod.GET)
	public String themaccount(Model model) {
		model.addAttribute("MODE","MODE_ADD");
		model.addAttribute("user", new User());
		return "accountmanager";
	}
	@RequestMapping(value = "/themaccount", method = RequestMethod.POST)
	public String themaccount(Model model,@ModelAttribute("user") @Validated User user,
			BindingResult result) {
		if(result.hasErrors())
		{
			model.addAttribute("MODE","MODE_ADD");
			return "accountmanager"; 
		}
		userService.save(user);
		return "redirect:/accountmanager";
	}
}
