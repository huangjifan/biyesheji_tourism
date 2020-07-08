package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.HotelScenic;
import com.znsd.tubaba.service.HotelScenicService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月2日 下午3:47:45
 * 
 * @描述: 酒店+景点功能controller类
 */
@Controller
public class HotelScenicController {
	
	/**
	 * 酒店+景点功能service
	 */
	@Autowired
	HotelScenicService hotelScenicService;
	
	/**
	 * 查询热搜酒店+景点信息
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 返回装载查询热搜景点信息的map
	 */
	@ResponseBody
	@GetMapping("/hotelScenic/queryHotBotHotelScenic")
	public Map<String,Object> queryHotBotHotelScenic(@RequestParam("rows")Integer rows,@RequestParam("size") Integer size){
		System.out.println("当前页:"+rows);
		System.out.println("每页记录数:"+size);
		
		Integer pageNum = rows!=null?rows:1;
        Integer pageSize = size!=null?size:10;
		Page<HotelScenic> page = PageHelper.startPage(pageNum, pageSize);
		List<HotelScenic> list = hotelScenicService.queryHotBotHotelScenic();
		
		Map<String,Object> map = new HashMap<>();
		map.put("total", page.getTotal());
		map.put("data", list);
		System.out.println("查询热搜酒店+景点信息的结果是:"+map);
		return map;
	}
	/**
	 * 搜索框输入数据后自动搜索
	 * @param searchVal 要搜索的值
	 * @param cid 城市编号
	 * @param scope 搜索的范围
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 如果要搜索的值是以字母开头则返回装载按景点名称的拼音模糊查询酒店+景点信息的map
	 * 			,不然就返回装载按景点名称模糊查询酒店+景点信息的map
	 */
	@ResponseBody
	@GetMapping("/hotelScenic/searchBoxSelfMotion")
	public Map<String,Object> searchBoxSelfMotion(@RequestParam("searchVal") String searchVal,@RequestParam("cid") String cid,@RequestParam("scope") int scope,@RequestParam(value = "rows",required = false)Integer rows,@RequestParam(value = "size",required = false) Integer size) {
		Integer pageNum = rows!=null?rows:1;
		Integer pageSize = size!=null?size:10;
		System.out.println("要搜索的值是:"+searchVal);
		System.out.println("目的地城市编号是:"+cid);
		System.out.println("要搜索的范围是:"+scope);
		System.out.println("当前页:"+pageNum);
		System.out.println("每页记录数:"+pageSize);

		Page<HotelScenic> page = PageHelper.startPage(pageNum, pageSize);
		List<HotelScenic> list = null;
		char c = Character.toLowerCase(searchVal.charAt(0));
		//字母开头
		if (c >= 'a' && c <= 'z'){
			System.out.println("按景点名称的拼音模糊查询酒店+景点信息");
			//按景点名称的拼音模糊查询酒店+景点信息
			list= hotelScenicService.queryHotelScenicBySearchScenicnamePinYin(searchVal);
        }
		else {
        	System.out.println("按景点名称模糊查询酒店+景点信息");
        	//按景点名称模糊查询酒店+景点信息
        	list= hotelScenicService.queryHotelScenicBySearchScenicname(searchVal);
        }
		Map<String,Object> map = new HashMap<>();
		map.put("total", page.getTotal());
		map.put("data", list);
		
		System.out.println("搜索框输入数据后自动搜索的结果是:"+map);
		return map;
	}
}
