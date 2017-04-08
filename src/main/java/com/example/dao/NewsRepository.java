package com.example.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.model.News;

public interface NewsRepository extends CrudRepository<News, Integer>{
	
	@Query("select max(x.id) from news x")
    public int getIDnext();
	
	@Query("select s from news s order by date desc")
	public List<News> getNew();
}
