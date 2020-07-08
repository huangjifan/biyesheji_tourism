package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.PlayMan;
import com.znsd.tubaba.mapper.PlayManMapper;
import com.znsd.tubaba.service.PlayManService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午10:29:35
 *
 * @描述: 游玩人功能service实现了
 */
@Service
public class PlayManServiceImpl implements PlayManService{
	/**
	 * 游玩人功能mapper
	 */
	@Autowired
	PlayManMapper playManMapper;
	
	@Override
	public Integer addPlayMan(PlayMan playMan) {
		playManMapper.addPlayMan(playMan);
		Integer id = playMan.getId();
		return id;
	}

	@Override
	public Integer batchAddPlayMan(List<PlayMan> playMans) {
		Integer rows = playManMapper.batchAddPlayMan(playMans);
		return rows;
	}
}
