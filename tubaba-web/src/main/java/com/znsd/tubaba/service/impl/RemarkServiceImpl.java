package com.znsd.tubaba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Remark;
import com.znsd.tubaba.mapper.IndentMapper;
import com.znsd.tubaba.mapper.RemarkMapper;
import com.znsd.tubaba.service.RemarkService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月8日 下午4:13:34
 * 
 * @描述: 评论功能service实现类
 */
@Service
public class RemarkServiceImpl implements RemarkService {
	/**
	 * 评论功能mapper
	 */
	@Autowired
	RemarkMapper remarkMapper;
	/**
	 * 订单功能service
	 */
	@Autowired
	IndentMapper indentService;
	@Override
	public List<Remark> queryRemarkByScenicwayIdOrScenicId(Integer scenicwayId, Integer scenicId) {
		List<Remark> list = remarkMapper.queryRemarkByScenicwayIdOrScenicId(scenicwayId, scenicId);
		return list;
	}
	
	/**
	 * 增加评论
	 * 返回主键id
	 * 
	 * */
	@Override
	public int addRemark(Remark remark) {
		remarkMapper.addRemark(remark);
		return remark.getId();
	}
	
	/**
	 * 增加评论
	 * 返回主键id
	 * 
	 * */
	@Override
	public int addRemark2(Remark remark) {
		remarkMapper.addRemark2(remark);
		return remark.getId();
	}
	
	/**
	 * 通过用户id和订单id查询评论信息
	 * userid 用户id
	 * indent 订单id
	 * */
	@Override
	public int queryById(Integer userId,Integer indentId){
		return remarkMapper.queryById(userId, indentId);
	}

	@Override
	public List<Remark> queryScenicId(int scenicId,Integer pageIndex) {
		PageHelper.startPage(pageIndex,3);
		return remarkMapper.queryScenicId(scenicId);
	}
	
	/**
	 * 查询回复的评论
	 * remid 回复评论id
	 * **/
	@Override
	public List<Remark> queryRemId(int remid){
		return remarkMapper.queryRemId(remid);
	}

	@Override
	public List<Remark> queryScenicIdessence(int scenicId,Integer pageIndex) {
		PageHelper.startPage(pageIndex,3);
		return remarkMapper.queryScenicIdessence(scenicId);
	}

	@Override
	public List<Remark> queryRemarkImg(int scenicId,Integer pageIndex) {
		PageHelper.startPage(pageIndex,3);
		return remarkMapper.queryRemarkImg(scenicId);
	}

	@Override
	public int addCommit(Remark remark) {
		return remarkMapper.addCommit(remark);
	}
	
	/**
	 * 查询点评数量
	 * */
	@Override
	public int queryRmarkCont(int id) {
		return remarkMapper.queryRmarkCont(id);
	}
	
	/**
	 * <!-- 连表查询  查询指定景点的评论 -->
	 * scenicId 景点id
	 * 查询加精的评论数量
	 * */
	@Override
	public int queryScenicIdessenceCount(int id) {
		return  remarkMapper.queryScenicIdessenceCount(id);
	}
	
	/**
	 * <!-- 连表查询  查询指定景点的评论 -->
	 * scenicId 景点id
	 * 查询有图的评论数量
	 * */
	@Override
	public int queryRemarkImgCount(int id) {
		return remarkMapper.queryRemarkImgCount(id);
	}

	@Transactional
	@Override
	public boolean sumbitRemark(Remark remark, Indent indent) {
		remark.setIndent(indent);
		boolean flag = this.addRemark2(remark) > 0;
		flag = indentService.updateIndentstatus(6, indent.getId(), null) > 0;
		return flag;
	}

}
