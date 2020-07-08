package com.znsd.tubaba.service.admin;

import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicstatus;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.TicketsType;


/**
 * 
 * @author 黄振伟
 * 
 * @Describe 景点门票类型Service接口
 *
 * @Time 2018年11月6日16:50:26
 * 
 */
public interface TicketsTypeService {
	
	/**
	 * 增加景点图片
	 * @return 返回增加数据的主键
	 */
	public Integer addTicketsType(TicketsType ticketsType);
	
	/**
	 * 增加景点
	 * @param scenic
	 * @param status
	 * @param ticketsType
	 * @param ticketsType2
	 * @param uploadFile
	 */
	public void addScenicAll(Scenic scenic,Scenicstatus status
			,TicketsType ticketsType,TicketsType ticketsType2
			,List<String> uploadFile);
	
	/**
	 * 根据景点id查询门票类型
	 * @param id 景点id
	 * @return
	 */
	public List<TicketsType> queryTicketsById(Integer id);
	
	/**
	 * 根据门票类型修改门票价格
	 * @param price 门票价格
	 * @param type 门票的类型
	 * @return
	 */
	public Integer updateTickets(String price,Integer id);
	/**
	 * 根据景点id和门票类型查询
	 * @param id 景点id
	 * @param type 景点门票类型
	 * @return
	 */
	public TicketsType queryTicketsprice(Integer id,String type);
	
	/**
	 * 修改景点信息
	 * @param scenic
	 * @param ticketsType
	 * @param ticketsType2
	 * @param time
	 * @param adultprice
	 * @param childprice
	 * @param upload
	 */
	public void updateScenics(Scenic scenic,TicketsType ticketsType
			,TicketsType ticketsType2,Date time,String adultprice
			,String childprice,String[] upload);
	
	/**
	 * 景点路线增加
	 * @param way 路线对象
	 * @param uploadNames 包含图片路径的一个数组
	 * @param titleSelect 主题id
	 * @param endpath 终点id
	 * @param startpath 起点id
	 * @param attractions 分类id
	 */
	public void addScenicwayAll(Scenicway way,String[] uploadNames
			, Integer titleSelect, String endpath
			, String startpath, Integer attractions,Integer[] scnicId);
	
	/**
	 * 景点路线修改
	 * @param way 景点路线对象
	 * @param titleId 主题Id	
	 * @param uploadNmaes 图片路径
	 * @param scnicId	景点Id
	 */
	public void updateScenicsway(Scenicway way,String uploadNmaes
			,Integer[] scnicId);
}
