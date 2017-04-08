package com.example.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.model.OderNews;


public interface OderNewsRepository extends CrudRepository<OderNews, Integer>{
	@Query("select s from odernews s where s.type = ?1")
	public OderNews getodernews(String type);
}
