package com.example.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;


@Component
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public void validate(Object target, Errors errors) {
		try{
		MultipartFile file = (MultipartFile) target;
		if(file.getSize() > 999999)
			errors.rejectValue("file", "BiggerSize.file.file");
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

}
