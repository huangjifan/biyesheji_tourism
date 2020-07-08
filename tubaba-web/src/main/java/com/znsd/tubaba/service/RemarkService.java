package com.znsd.tubaba.service;

import java.util.List;

import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Remark;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午4:12:38
 * 
 * @描述: 评论功能service接口
 */
public interface RemarkService {
	/**
	 * 通过旅游路线编号或景点编号查询评论信息
	 * @param scenicwayId 旅游路线编号
	 * @param scenicId 景点编号
	 * @return 返回装载通过旅游路线编号或景点编号查询评论信息的list，无数据时返回空的list
	 */
	List<Remark> queryRemarkByScenicwayIdOrScenicId(Integer scenicwayId,Integer scenicId);
	
	/**
	 * 增加评论
	 * 返回主键id
	 * */
	public int addRemark(Remark remark);
	
	/**
	 * 增加评论
	 * 返回主键id
	 * */
	public int addRemark2(Remark remark);
	
	/**
	 * 通过用户id和订单id查询评论信息
	 * userid 用户id
	 * indent 订单id
	 * */
	public int queryById(Integer userId,Integer indentId);
	
	/**
	 * <!-- 连表查询  查询指定景点的评论 -->
	 * scenicId 景点id
	 * */
	public List<Remark> queryScenicId(int scenicId,Integer pageIndex);
	
	
	/**
	 * 查询回复的评论
	 * remid 回复评论id
	 * **/
	public List<Remark> queryRemId(int remid);
	
	
	/**
	 * <!-- 连表查询  查询指定景点的评论 -->
	 * scenicId 景点id
	 * 查询加精的评论
	 * */
	public List<Remark> queryScenicIdessence(int scenicId,Integer pageIndex);
	
	/**
	 * <!-- 连表查询  查询指定景点的评论 -->
	 * scenicId 景点id
	 * 查询有图的评论
	 * */
	public List<Remark> queryRemarkImg(int scenicId,Integer pageIndex);
	
	/*
	 * 评论的回复
	 * */
	public int addCommit(Remark remark);
	
	/**
	 * 查询点评数量
	 * */
	public int queryRmarkCont(int id);
	
	
	/**
	 * <!-- 连表查询  查询指定景点的评论 -->
	 * scenicId 景点id
	 * 查询加精的评论数量
	 * */
	public int queryScenicIdessenceCount(int id);
	
	/**
	 * <!-- 连表查询  查询指定景点的评论 -->
	 * scenicId 景点id
	 * 查询有图的评论数量
	 * */
	public int queryRemarkImgCount(int id);
	
	/**
	 * 发表评论
	 */
	public boolean sumbitRemark(Remark remark,Indent indent);
}
