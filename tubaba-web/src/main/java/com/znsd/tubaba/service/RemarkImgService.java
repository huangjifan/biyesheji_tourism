package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Scenicimage;

public interface RemarkImgService {
	/**
	 * 增加评论图片
	 * path 图片路径  
	 * remarkId 评论表id
	 * 返回被影响的行数
	 * */
	public int addRemarkImg(String uploadPath,Integer id);
	
	/**
	 * 据评论id查询图片
	 * */
	public List<Scenicimage> queryByMarkId(Integer markId);
}
