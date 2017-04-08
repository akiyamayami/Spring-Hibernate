package com.example.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.dao.OderNewsRepository;
import com.example.model.News;
import com.example.model.OderNews;

@Service
@Transactional
public class OderNewsService {
	private final OderNewsRepository oderNewsRepository;
	
	public OderNewsService(OderNewsRepository oderNewsRepository){
		this.oderNewsRepository = oderNewsRepository;
	}
	
	public OderNews findOne(int id){
		return oderNewsRepository.findOne(id);
	}
	
	public List<OderNews> findAll(){
		List<OderNews> OderNews = new ArrayList<>();
		for(OderNews OderNewx : oderNewsRepository.findAll()){
			OderNews.add(OderNewx);
		}
		return OderNews;
	}
	public OderNews save(OderNews odernews){
		return oderNewsRepository.save(odernews);
	}
	
	public OderNews getodernews(String type){
		return oderNewsRepository.getodernews(type);
	}
}
