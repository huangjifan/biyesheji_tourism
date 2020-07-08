package com.znsd.tubaba.service;

import java.util.List;
import java.util.Map;

import com.znsd.tubaba.entity.Scenic;

/**
 * @author 尹加豪
 *
 * @时间 2018年10月30日 下午9:51:55
 * 
 * @描述: 景点功能service接口
 */
public interface ScenicService {
	/**
	 * 查询热搜景点信息
	 * @param 无
	 * @return 返回包含热搜景点信息的list，无数据返回空的list
	 */
	public List<Scenic> queryHotBotScenic();
	/**
	 * 按景点名称模糊查询景点信息
	 * @param scenicname 指定景点名称
	 * @return 返回装载包含指定景点名称的景点信息的list,无数据返回空的list
	 */
	public List<Scenic> queryScenicBySearchScenicname(String scenicname);
	
	/**
	 * 按景点名称的拼音模糊查询景点信息
	 * @param scenicname_pinyin 指定景点名称的拼音
	 * @return 返回装载包含指定景点名称的拼音的景点信息的list,无数据返回空的list
	 */
	public List<Scenic> queryScenicBySearchScenicnamePinYin(String scenicname_pinyin);
	/**
	 * 按景点名称或景点名称的拼音模糊查询景点信息
	 * @param scenicname 指定景点名称
	 * @param scenicname_pinyin 指定景点名称的拼音
	 * @return 返回装载包含指定景点名称或景点名称的拼音的景点信息的list,无数据返回空的list
	 */
	public List<Scenic> queryScenicBySearchScenicnameOrScenicnamePinYin(String scenicname,String scenicname_pinyin);
	
	/**
	 * 查询所有景点信息
	 * @param queryScenicAll 查询所有景点信息
	 * @return 返回包含所有景点信息的list，无数据返回空的list
	 */
	public List<Scenic> queryScenicAll();
	
	/**
	 * 单个查询景点信息，按id查询
	 * */
	public Scenic queryScenic(Integer id);
	
	
	public Scenic queryOne(Integer id);
	
	/**
	 * 删除景点（修改景点状态）
	 * @param delScenic 删除景点（修改景点状态）
	 * @return  返回所修改的主键
	 */
	public int delScenic(int id);
	
	/**
	 * 按照id查询景点信息
	 */
	public Scenic queryScenicById(Integer id);
	/**
	 * 增加景点
	 * @author 黄振伟
	 * @return 返回增加景点的主键id
	 */
	public Integer addScenic(Scenic scenic);
	/**
	 * 根据定位地址和当前季节，查询同省或同市的风景
	 * @author 杨云鹏
	 * @scope:定位的地址
	 * */
	public List<Scenic> queryByScenicWithAddress(String scope);
	
	/**
	 * 根据定位地址和订单数量，查询同省或同市的风景或城市
	 * @author 杨云鹏
	 * @scope:定位的地址
	 * @attr:查询附近城市就用city字段，查询风景就用scenicid字段
	 * */
	public List<Scenic> qeuryByScenicWithAddressAndIndentdetails(String attr,String scope);
	
	
	/**
	 * 根据名称查询活动中的所有景点
	 * @author 杨云鹏
	 * @param activityName:活动名称
	 * */
	public List<Scenic> queryByScenicWithActivity(String activityName);
	
	/**
	 * 根据主题和城市地址查询所有的景点
	 * @author 杨云鹏
	 * @title:主题
	 * */
	public List<Scenic> queryByScenicWithThemeWithAddress(String title,String scope);
	/**
	 * 热门目的地或者热门景点
	 * @author 杨云鹏
	 * */
	public List<Scenic> qeuryByScenicWithIndentdetails(String frompath);
	
	/**
	 * 查询所有的景点信息
	 * 链接这图片表
	 * */
	public List<Scenic> queryByScenic();
	
	/**
	 * 修改景点信息
	 * @param scenic 景点类
	 * @return
	 */
	public Integer updateScenic(Scenic scenic);
	
	/**
	 * 根据名称或地址或主题查询景点
	 * @param scenic 景点类
	 * @return
	 */
	public List<Scenic> queryByScenicWithNameOrCity(Scenic scenic);
	
	
	/**
	 * @author 杨云鹏
	 * 根据名称或地址或拼音查询同城市景点
	 * @param scenic 景点类
	 * @return
	 */
	public List<Scenic> queryByScenicAndName(Scenic scenic);
	
	
	
	/**
	 * 查询省和市
	 * scenicId 景点id
	 * */
	public Scenic queryAddress(Integer scenicId);
	
	
	/**
	 * 查询相关的景点
	 * */
	public List<Scenic> queryCorrelation(Map<String,Object> map);
	
	/**
	 *  查询好评 率以及相关信息
	 * */
	public List<Scenic> queryPraise(Map<String,Object> map);
	
	/**
	 * 查询相关的景点信息
	 * */
	public List<Scenic> queryCorrScenic(Map<String,Object> map);
	/**
	 * 根据城市名获取对应城市下的所有状态正常的景点
	 * @param city 城市名称
	 * @return 返回包含了景点的一个List
	 */
	public List<Scenic> queryScenicByCity(String city);
	
	/**
	 * 查询景点的好评率
	 * */
	public Map<String,Object> queryPraiseScenic(int id);
	
	/**
	 * @author 杨云鹏
	 * @Content:搜索内容
	 * */
	public Scenic queryScenicByContent(String content);
	
	/**
	 * 查询所有景点信息
	 * @param queryScenicAll 查询所有景点信息
	 * @return 返回包含所有景点信息的list，无数据返回空的list
	 */
	public List<Scenic> queryScenicAllDel();
	
	/**
	 * 恢复景点（修改景点状态）
	 * @param delScenic 删除景点（修改景点状态）
	 * @return  返回所修改的主键
	 */
	public int delScenicAll(int id);
}
