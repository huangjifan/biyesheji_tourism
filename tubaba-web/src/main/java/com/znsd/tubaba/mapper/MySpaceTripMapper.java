package com.znsd.tubaba.mapper;

import java.util.List;

import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Travel;
import com.znsd.tubaba.entity.TravelCommon;
import com.znsd.tubaba.entity.TravelLike;

public interface MySpaceTripMapper {
	//查询游记
	public List<Travel> myTrip(int userid);
	//增加游记
	public int addWrite(Travel travel);
	//查询游记评论
	public List<TravelCommon> selectCommonCount(int travelid);
	//查询游记点赞
	public List<TravelLike> selectLikeCount(int travelid);
	//删除游记
	public int delTravel(int id);
	//根据游记id删除评论
	public int delCommonById(int id);
	//根据游记id删除点赞
	public int delLikeById(int id);
	//根据游记id查询游记
	public Travel selectTravelById(int id);
	//修改游记
	public int alterTravel(Travel travel);
	//查询未写游记的订单
	public List<Indent> notWriteTravel(int id);
	//增加有归属订单的游记
	public int addWriteAndIndent(Travel travel);
	//增加游记浏览数量
	public void travelViews(int id);
	//查询用户是否点赞
	public List<TravelLike> existZan(int userid,int tid);
	//用户点赞
	public void addzan(int userid,int tid);
	//查询最新的游记
	public Travel newTravel();
	//查询游记是否有封面
	public Travel isCoverImg(int tid);
	//增加封面
	public void addCoverImg(String cover,int tid);
	
	/**
	 * 按照景点id查询指定的游记
	 * */
	public List<Travel> querybyIndentAll(Integer scenId);
	
	/**
	 * 查询景点相关游记的数量
	 * */
	public int querybyIndentAllCount(int id);
	//旅游攻略游记
	public List<Travel> travelAll();
	//游记推荐
	public List<Travel> travelRecommend();
}
