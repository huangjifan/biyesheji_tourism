package com.znsd.tubaba.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.mapper.ScenicMapper;
import com.znsd.tubaba.service.ScenicService;


/**
 * @author 尹加豪
 *
 * @时间 2018年10月30日 下午9:53:19
 * 
 * @描述: 景点功能service实现类
 */
@Service
public class ScenicServiceImpl implements ScenicService {
	/**
	 * 景点功能mapper
	 */
	@Autowired
	ScenicMapper  scenicMapper;
	
	@Override
	public List<Scenic> queryHotBotScenic() {
		List<Scenic> list = scenicMapper.queryHotBotScenic();
		return list;
	}
	
	@Override
	public List<Scenic> queryScenicBySearchScenicname(String scenicname) {
		List<Scenic> list = scenicMapper.queryScenicBySearchScenicname(scenicname);
		return list;
	}

	@Override
	public List<Scenic> queryScenicBySearchScenicnamePinYin(String scenicname_pinyin) {
		List<Scenic> list = scenicMapper.queryScenicBySearchScenicnamePinYin(scenicname_pinyin);
		return list;
	}

	@Override
	public List<Scenic> queryScenicBySearchScenicnameOrScenicnamePinYin(String scenicname, String scenicname_pinyin) {
		List<Scenic> list = scenicMapper.queryScenicBySearchScenicnameOrScenicnamePinYin(scenicname,scenicname_pinyin);
		return list;
	}
	
	@Override
	public List<Scenic> queryScenicAll() {
		List<Scenic> list = scenicMapper.queryScenicAll();
		return list;
	}

	@Override
	public Scenic queryScenic(Integer id) {
		return scenicMapper.queryScenic(id);
	}
	
	public int delScenic(int  id) {
		int delScenic = scenicMapper.delScenic(id);
		return delScenic;
	}
	
	@Override
	public Scenic queryScenicById(Integer id) {
		return scenicMapper.queryScenicById(id);
	}
	
	@Override
	public Scenic queryOne(Integer id) {
		return scenicMapper.queryOne(id);
	}

	@Override
	public Integer addScenic(Scenic scenic) {
		scenicMapper.addScenic(scenic);
		return scenic.getId();
	}
	
	/**
	 * 查询所有的景点信息
	 * 链接这图片表
	 * */
	@Override
	public List<Scenic> queryByScenic(){
		return scenicMapper.queryByScenic();
	}

	@Override
	public Integer updateScenic(Scenic scenic) {
		return scenicMapper.updateScenic(scenic);
	}
	
	@Override
	public List<Scenic> queryByScenicWithAddress(String scope) {
		return scenicMapper.queryByScenicWithAddress(scope);
	}

	@Override
	public List<Scenic> qeuryByScenicWithAddressAndIndentdetails(String attr, String scope) {
		return scenicMapper.qeuryByScenicWithAddressAndIndentdetails(attr, scope);
	}


	@Override
	public List<Scenic> queryByScenicWithActivity(String activityName) {
		return scenicMapper.queryByScenicWithActivity(activityName);
	}

	@Override
	public List<Scenic> queryByScenicWithThemeWithAddress(String title, String scope) {
		return scenicMapper.queryByScenicWithThemeWithAddress(title, scope);
	}

	@Override
	public List<Scenic> qeuryByScenicWithIndentdetails(String frompath) {
		return scenicMapper.qeuryByScenicWithIndentdetails(frompath);
	}

	@Override
	public List<Scenic> queryByScenicWithNameOrCity(Scenic scenic) {
		return scenicMapper.queryByScenicWithNameOrCity(scenic);
	}

	@Override
	public List<Scenic> queryByScenicAndName(Scenic scenic) {
		return scenicMapper.queryByScenicAndName(scenic);	
	}
	
	/**
	 * 查询省和市
	 * scenicId 景点id
	 * */
	@Override
	public Scenic queryAddress(Integer scenicId) {
		return scenicMapper.queryAddress(scenicId);
	}
	
	/**
	 * 查询相关的景点
	 * */
	@Override
	public List<Scenic> queryCorrelation(Map<String,Object> map){
		return scenicMapper.queryCorrelation(map);
	}
	
	/**
	 *  查询好评 率以及相关信息
	 * */
	@Override
	public List<Scenic> queryPraise(Map<String,Object> map){
		return scenicMapper.queryPraise(map);
	}
	
	/**
	 * 查询相关的景点信息
	 * */
	public List<Scenic> queryCorrScenic(Map<String,Object> map){
		return scenicMapper.queryCorrScenic(map);
	}

	@Override
	public List<Scenic> queryScenicByCity(String city) {
		return scenicMapper.queryScenicByCity(city);
	}
	
	/**
	 * 查询景点的好评率
	 * id 景点id
	 * */
	@Override
	public Map<String,Object> queryPraiseScenic(int id){
		return scenicMapper.queryPraiseScenic(id);
	}

	@Override
	public Scenic queryScenicByContent(String content) {
		return scenicMapper.queryScenicByContent(content);
	}

	@Override
	public List<Scenic> queryScenicAllDel() {
		return scenicMapper.queryScenicAllDel();
	}

	@Override
	public int delScenicAll(int id) {
		return scenicMapper.delScenicAll(id);
	}
	
}
