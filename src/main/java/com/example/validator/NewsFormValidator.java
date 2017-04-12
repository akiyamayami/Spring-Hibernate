package com.example.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.model.News;
import com.example.service.NewsService;



@Component
public class NewsFormValidator implements Validator{

	@Autowired
	NewsService newsService;

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return News.class.equals(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tieude", "NotEmpty.newsForm.tieude");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "noidung", "NotEmpty.newsForm.noidung");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "date", "NotEmpty.newsForm.date");
		
		
		
	}

}
