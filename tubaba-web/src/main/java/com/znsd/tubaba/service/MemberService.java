package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Member;

public interface MemberService {
	//查询所有会员
	public List<Member> findByAll();
}
