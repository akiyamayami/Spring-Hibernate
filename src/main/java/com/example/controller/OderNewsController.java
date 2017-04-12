package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.OderNews;
import com.example.service.OderNewsService;
import com.example.validator.OderNewsValidator;

@Controller
public class OderNewsController {

	
	@Autowired
	private OderNewsService oderNewsService;
	
	@Autowired
	private OderNewsValidator odernewsValidator;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(odernewsValidator);
	}
	
	@GetMapping("/odernews")
	public String odernews(HttpServletRequest request){
		request.setAttribute("MODE", "MODE_HOME");
		List<OderNews> odernews = oderNewsService.findAll();
		request.setAttribute("odernews", odernews);
		return "odernews";
	}
	
	@RequestMapping(value = "/chinhsuaodernew-{odernewsID}", method = RequestMethod.GET)
	public String chinhsuaodernew(@PathVariable int odernewsID, Model model) {
			model.addAttribute("MODE","MODE_EDIT");
			OderNews odernews = oderNewsService.findOne(odernewsID);
			model.addAttribute("odernews",odernews);
		return "odernews";
	}
	
	@RequestMapping(value = "/chinhsuaodernew", method = RequestMethod.POST)
	public String chinhsuaodernewpost(@ModelAttribute("odernews") @Validated OderNews odernews,
			BindingResult result, Model model,HttpServletRequest request) {
		if(result.hasErrors())
		{
			model.addAttribute("MODE","MODE_EDIT");
			return "odernews";
		}
		oderNewsService.save(odernews);
		return "redirect:/odernews";
	}
}
