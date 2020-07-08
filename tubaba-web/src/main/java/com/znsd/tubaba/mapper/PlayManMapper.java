package com.znsd.tubaba.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.PlayMan;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 上午10:26:53
 *
 * @描述: 游玩人功能mapper接口
 */
public interface PlayManMapper {
	
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
	public Integer batchAddPlayMan(@Param("playMans") List<PlayMan> playMans);
}
