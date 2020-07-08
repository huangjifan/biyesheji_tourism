package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Travel;
import com.znsd.tubaba.entity.TravelCommon;
import com.znsd.tubaba.entity.TravelLike;
import com.znsd.tubaba.mapper.MySpaceTripMapper;
import com.znsd.tubaba.service.MySpaceTripService;
@Service
public class MySpaceTripServiceImpl implements MySpaceTripService {
	@Autowired
	MySpaceTripMapper mySpaceTripMapper;
	//查询游记
	@Override
	public List<Travel> myTrip(int userid,int pageNum,int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return mySpaceTripMapper.myTrip(userid);
	}
	//增加游记
	@Override
	public int addWrite(Travel travel) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.addWrite(travel);
	}
	@Override
	public List<TravelCommon> selectCommonCount(int userid) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.selectCommonCount(userid);
	}
	@Override
	public List<TravelLike> selectLikeCount(int userid) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.selectLikeCount(userid);
	}
	@Override
	public int delTravel(int id) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.delTravel(id);
	}
	@Override
	public int delCommonById(int id) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.delCommonById(id);
	}
	@Override
	public int delLikeById(int id) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.delLikeById(id);
	}
	@Override
	public Travel selectTravelById(int id) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.selectTravelById(id);
	}
	@Override
	public int alterTravel(Travel travel) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.alterTravel(travel);
	}
	@Override
	public List<Indent> notWriteTravel(int id,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return mySpaceTripMapper.notWriteTravel(id);
	}
	@Override
	public int addWriteAndIndent(Travel travel) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.addWriteAndIndent(travel);
	}
	@Override
	public void travelViews(int id) {
		// TODO Auto-generated method stub
		mySpaceTripMapper.travelViews(id);
	}
	@Override
	public List<TravelLike> existZan(int userid, int tid) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.existZan(userid, tid);
	}
	@Override
	public void addzan(int userid, int tid) {
		// TODO Auto-generated method stub
		mySpaceTripMapper.addzan(userid, tid);
	}
	@Override
	public Travel newTravel() {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.newTravel();
	}
	@Override
	public Travel isCoverImg(int tid) {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.isCoverImg(tid);
	}
	@Override
	public void addCoverImg(String cover, int tid) {
		// TODO Auto-generated method stub
		mySpaceTripMapper.addCoverImg(cover, tid);
	}
	
	/**
	 * 按照景点id查询指定的游记
	 * */
	@Override
	public List<Travel> querybyIndentAll(Integer scenId,Integer pageIndex){
		PageHelper.startPage(pageIndex, 3);
		return mySpaceTripMapper.querybyIndentAll(scenId);
	}
	
	/**
	 * 查询景点相关游记的数量
	 * */
	@Override
	public int querybyIndentAllCount(int id) {
		return mySpaceTripMapper.querybyIndentAllCount(id);
	}
	@Override
	public List<Travel> travelAll(int pageNum,int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		return mySpaceTripMapper.travelAll();
	}
	@Override
	public List<Travel> travelRecommend() {
		// TODO Auto-generated method stub
		return mySpaceTripMapper.travelRecommend();
	}
}
