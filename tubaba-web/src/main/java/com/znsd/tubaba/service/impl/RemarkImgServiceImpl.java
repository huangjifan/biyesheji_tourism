package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Scenicimage;
import com.znsd.tubaba.mapper.RemarkImgMapper;
import com.znsd.tubaba.service.RemarkImgService;

@Service
public class RemarkImgServiceImpl implements RemarkImgService {
	
	@Autowired
	RemarkImgMapper reimgMapper;
	
	/**
	 * 增加评论图片
	 * path 图片路径  
	 * remarkId 评论表id
	 * 返回被影响的行数
	 * */
	@Override
	public int addRemarkImg(String uploadPath,Integer id) {
		return reimgMapper.addRemarkImg(uploadPath,id);
	}
	
	/**
	 * 据评论id查询图片
	 * */
	@Override
	public List<Scenicimage> queryByMarkId(Integer markId){
		return reimgMapper.queryByMarkId(markId);
	}
}
