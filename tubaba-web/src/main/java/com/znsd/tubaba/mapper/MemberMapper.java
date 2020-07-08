package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Member;

public interface MemberMapper {
	//查询所有会员
	public List<Member> findByAll();
}
