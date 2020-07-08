package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.PlayMan;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午10:29:02
 *
 * @描述: 游玩人功能service接口
 */
public interface PlayManService {
	
	/**
	 * 增加游玩人
	 * @param playMan 游玩人信息
	 * @return 返回新增游玩人的主键编号
	 */
	public Integer addPlayMan(PlayMan playMan);
	/**
	 * 批量增加游玩人
	 * @param playMans 游玩人信息list
	 * @return 返回增加的记录数
	 */
	public Integer batchAddPlayMan(List<PlayMan> playMans);
}
