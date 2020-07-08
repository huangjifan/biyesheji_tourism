package com.znsd.tubaba.mapper;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.PlayMan;

public interface LinkManMapper {
	//通过联系人id查找联系人
	public LinkMan findByLinkManId(@Param("id") Integer id);
	
	//通过联系人id查找游玩人
	public Set<PlayMan> findPlayManByLinkManId(@Param("linkmanid") Integer linkmanid);
	
	/**
	 * 增加联系人
	 * @param linkMan 联系人信息
	 * @return 返回新增联系人的主键编号
	 */
	public Integer addLinkMan(LinkMan linkMan);
	public LinkMan findByLinkManName(String realName);
}
