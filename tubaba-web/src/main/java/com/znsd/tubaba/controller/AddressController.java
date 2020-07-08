package com.znsd.tubaba.controller;

import java.util.Arrays;
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
import com.znsd.tubaba.entity.Address;
import com.znsd.tubaba.service.AddressService;

/**
 * @author 尹加豪
 *
 * @时间 2018年10月31日 下午8:11:44
 * 
 * @描述: 地址功能controller类
 */
@Controller
public class AddressController {
	
	/**
	 * 地址功能service
	 */
	@Autowired
	AddressService addressService;
	
	/**
	 * 通过产品分类id查询旅游景点的热门出发城市
	 * @author 尹加豪
	 * @param attractionsId 产品分类id
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 返回装载产品分类id查询旅游景点的热门出发城市信息的list的map,无数据返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/address/findScenicwayHotCityByAttractionsId")
	public Map<String,Object> findScenicwayHotCityByAttractionsId(@RequestParam("attractionsId") Integer attractionsId,@RequestParam(value="rows",required=false)Integer rows,@RequestParam(value="size",required=false) Integer size){
		System.out.println("通过产品分类id查询旅游景点的热门出发城市");
		Integer pageNum = rows!=null?rows:1;
        Integer pageSize = size!=null?size:10;
        System.out.println("当前页:"+pageNum);
		System.out.println("每页记录数:"+pageSize);
		
		Page<Address> page = PageHelper.startPage(pageNum, pageSize);
		List<Address> list = addressService.findScenicwayHotCityByAttractionsId(attractionsId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("total", page.getTotal());
		map.put("data", list);
		System.out.println("通过产品分类id查询旅游景点的热门出发城市的结果是:"+map);
		return map;
	}
	/**
	 * 查询指定省份下的所有城市
	 * @param provs 指定的省份数组
	 * @return 返回装载指定省份下的所有城市的map
	 */
	@ResponseBody
	@GetMapping("/address/queryProvincesSubCity")
	public Map<String,Object> queryProvincesSubCity(@RequestParam("provs[]") Integer[] provs){
		System.out.println("查询指定省份下的所有城市 省份有:"+Arrays.toString(provs));
		
		Map<String,Object> map = new HashMap<>();
		List<Address> list = addressService.queryProvincesSubCity(provs);
		map.put("list", list);
		
		System.out.println("搜索的结果是:"+map);
		return map;
	}
	
	@ResponseBody
	@GetMapping("/address/queryAddressAll")
	public List<Address> queryAll(){
		
		//Map<String,Object> map = new HashMap<>();
		List<Address> list = addressService.queryAddressAll();
		/*map.put("list", list);*/		
		System.out.println("搜索的结果是:"+list);
		return list;
	}
}
