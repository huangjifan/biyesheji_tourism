package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Coustomize;

public interface CoustomizeService {
	/**
	 *私人定制的操作 
	 * 
	 */
	public List<Coustomize> queryAll();
	
	public Coustomize queryOneId(Integer id);
	
	public List<Coustomize> queryOneName(String username);
	

	public Integer addCoustomize(Coustomize coustomize);
	
	public void delCustomize(Coustomize coustomize);
}
