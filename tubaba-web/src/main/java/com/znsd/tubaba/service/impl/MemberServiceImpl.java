package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Member;
import com.znsd.tubaba.mapper.MemberMapper;
import com.znsd.tubaba.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public List<Member> findByAll() {
		return memberMapper.findByAll();
	}

}
