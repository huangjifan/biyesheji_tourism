package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.service.AttractionsService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.ScenicwayService;
import com.znsd.tubaba.service.TitleService;
import com.znsd.tubaba.utils.AddressUtils;

@Controller
public class ScenicwayController {

	@Autowired
	private ScenicwayService scenicwayService;
	
	@Autowired
	private ScenicService scenicService;
	
	@Autowired
	private TitleService titleService;
	
	@Autowired
	private AttractionsService attractionsService;
	/**
	 * 进入到旅游路线产品展示页面
	 * @author 尹加豪
	 * @param id 旅游路线编号
	 * @return 旅游路线产品展示页面
	 */
	@GetMapping("/scenicway/tourRouteProductShow/{id}")
	public String enterIntoTourRouteProductShow(@PathVariable("id") Integer id) {
		return "view/product/tourRouteProductShow";
	}
	/**
	 * @author 杨云鹏
	 * @param key:搜索内容
	 *        fromName:出发城市名称 scope：搜索范围, xxx:代表搜索之后跳转的页面
	 */
	@GetMapping("/search")
	public String automaticSearch(@RequestParam("key") String key, @RequestParam(value="fromPath",required=false) String fromPath,
			@RequestParam(value="scope",required=false) int scope, Map<String, Object> map,@RequestParam(value="pageNum",required=false)Integer pageNum) {
		pageNum=pageNum==null||pageNum<1?1:pageNum;
		String attr=attractionsService.getById(scope).getAtrtitle();
		Scenic s=null;
		Page<Scenic> page1=null;
		List<Scenic> scenicList1=null;
		Page<Scenic> page=null;
		List<Scenicway> scenicwayList=null;
		Page<Scenicway> page2=null;
		List<Scenicway> scenicwayList2=null;
		Page<Scenicway> page3=null;
		List<Scenicway> scenicwayList3=null;
		Page<Scenicway> page4=null;
		List<Scenicway> scenicwayList4=null;                       
			s=new Scenic();
			s.setScenicname(key);
			s.setTitle(new Title());
			page1 = PageHelper.startPage(pageNum, 1);
			scenicList1 = scenicService.queryByScenicWithNameOrCity(s);
			//全部
			page = PageHelper.startPage(pageNum, 1);
			scenicwayList = scenicwayService.findByScenicsAndStartpath(key, fromPath, null);
			//跟团游
			page2 = PageHelper.startPage(pageNum, 1);
			scenicwayList2 = scenicwayService.findByScenicsAndStartpath(key, fromPath, 101);
			//自由行
			page3 = PageHelper.startPage(pageNum, 1);
			scenicwayList3 = scenicwayService.findByScenicsAndStartpath(key, fromPath, 102);
			//当地游
			page4= PageHelper.startPage(pageNum, 1);
			scenicwayList4 = scenicwayService.findByScenicsAndStartpath(key, null, 103);
		//跟团游
		map.put("GROUP", page2.getTotal());
		//门票
		map.put("TICKET", page1.getTotal());
		//自由行
		map.put("FREETOUR", page3.getTotal());
		//当地游
		map.put("LOCAL", page4.getTotal());
		//全部
		map.put("ALL", page.getTotal());
		System.out.println("\n*********"+scenicwayList+"\n");
		if(attr.equals("跟团游")){
			map.put("data", scenicwayList2);
			map.put("city", scenicwayList2);
			map.put("title", titleService.queryByScenicByName(key, fromPath, scope));
			map.put("scenic", scenicService.queryByScenicAndName(s));
			map.put("pageNum",page2.getPageNum());
			map.put("pageCount",page2.getPages());
		}
		else if(attr.equals("自由行")){
			map.put("data", scenicwayList3);
			map.put("city", scenicwayList2);
			map.put("title", titleService.queryByScenicByName(key, fromPath, scope));
			map.put("scenic", scenicService.queryByScenicAndName(s));
			map.put("pageNum",page3.getPageNum());
			map.put("pageCount",page3.getPages());
		}
		else if(attr.equals("当地游")){
			map.put("data", scenicwayList4);
			map.put("title", titleService.queryByScenicByName(key, fromPath, scope));
			map.put("scenic", scenicService.queryByScenicAndName(s));
			map.put("pageNum",page4.getPageNum());
			map.put("pageCount",page4.getPages());
		}else if(attr.equals("景点门票")){
			//map.put("data", scenicList1);
			map.put("title", titleService.queryByScenicAndName(s));
			map.put("pageNum",page1.getPageNum());
			map.put("pageCount",page1.getPages());
			map.put("sign", "");
		}else{
			map.put("data", scenicwayList);
			map.put("city", scenicwayList);
			map.put("title", titleService.queryByScenicByName(key, fromPath, null));
			map.put("scenic", scenicService.queryByScenicAndName(s));
			map.put("pageNum",page.getPageNum());
			map.put("pageCount",page.getPages());
		}
		map.put("scope",attr);
		if(fromPath==null||fromPath==""){
			fromPath=AddressUtils.getIpByCity();
		}
		map.put("path", fromPath);
		map.put("key", key);
		return "view/queryWayList";
	}
	@ResponseBody
	@PostMapping("/searchAjax")
	public Map<String,Object> searchAjax(@RequestParam("key") String key, @RequestParam(value="fromPath",required=false) String fromPath,
			@RequestParam(value="scope",required=false) Integer scope,@RequestParam(value="pageNum",required=false)Integer pageNum,
			@RequestParam(value="day",required=false) Integer day,
			@RequestParam(value="startpath",required=false) String startpath,
			@RequestParam(value="scenic",required=false) String scenic,
			@RequestParam(value="title",required=false) String title,
			@RequestParam(value="price",required=false) Double price,
			@RequestParam(value="praise",required=false) Integer praise,
			@RequestParam(value="footprice",required=false) Double footprice,
			@RequestParam(value="topprice",required=false) Double topprice,
			@RequestParam(value="activity",required=false) Integer activity,
			@RequestParam(value="order",required=false) Integer order) {
		Map<String,Object> paramMap=new HashMap<String, Object>(0);
		Map<String,Object> resultMap=new HashMap<String, Object>(0);
		paramMap.put("day", day);
		paramMap.put("startpath", startpath);
		paramMap.put("scenic", scenic);
		paramMap.put("title", title);
		paramMap.put("price", price);
		paramMap.put("praise", praise);
		paramMap.put("footprice", footprice);
		paramMap.put("topprice", topprice);
		paramMap.put("activity", activity);
		pageNum=pageNum==null||pageNum<1?1:pageNum;
		String attr=attractionsService.getById(scope).getAtrtitle();
		Scenic s=null;
		Page<Scenic> page1=null;
		List<Scenic> scenicList1=null;
		Page<Scenic> page=null;
		List<Scenicway> scenicwayList=null;
		Page<Scenicway> page2=null;
		List<Scenicway> scenicwayList2=null;
		Page<Scenicway> page3=null;
		List<Scenicway> scenicwayList3=null;
		Page<Scenicway> page4=null;
		List<Scenicway> scenicwayList4=null;
			s=new Scenic();
			s.setScenicname(key);
			s.setTitle(new Title(title));
			page1 = PageHelper.startPage(pageNum, 1);
			scenicList1 = scenicService.queryByScenicWithNameOrCity(s);
			//全部
			page = PageHelper.startPage(pageNum, 1);
			scenicwayList = scenicwayService.queryScenicwayMoreWhere(key, fromPath, null,paramMap);
			//跟团游
			page2 = PageHelper.startPage(pageNum, 1);
			scenicwayList2 = scenicwayService.queryScenicwayMoreWhere(key, fromPath, 101,paramMap);
			//自由行
			page3 = PageHelper.startPage(pageNum, 1);
			scenicwayList3 = scenicwayService.queryScenicwayMoreWhere(key, fromPath, 102,paramMap);
			//当地游
			page4= PageHelper.startPage(pageNum, 1);
			scenicwayList4 = scenicwayService.queryScenicwayMoreWhere(key, null, 103,paramMap);
		//跟团游
		resultMap.put("GROUP", page2.getTotal());
		//门票
		resultMap.put("TICKET", page1.getTotal());
		//自由行
		resultMap.put("FREETOUR", page3.getTotal());
		//当地游
		resultMap.put("LOCAL", page4.getTotal());
		//全部
		resultMap.put("ALL", page.getTotal());
		
		if(attr.equals("跟团游")){
			resultMap.put("jinlai", "scenicwayList2");
			resultMap.put("data", scenicwayList2);
			resultMap.put("city", scenicwayList2);
			resultMap.put("title", titleService.queryByScenicByName(key, fromPath, scope));
			resultMap.put("scenic", scenicService.queryByScenicAndName(s));
			resultMap.put("pageNum",page2.getPageNum());
			resultMap.put("pageCount",page2.getPages());
		}
		else if(attr.equals("自由行")){
			resultMap.put("data", scenicwayList3);
			resultMap.put("city", scenicwayList2);
			resultMap.put("title", titleService.queryByScenicByName(key, fromPath, scope));
			resultMap.put("scenic", scenicService.queryByScenicAndName(s));
			resultMap.put("pageNum",page3.getPageNum());
			resultMap.put("pageCount",page3.getPages());
		}
		else if(attr.equals("当地游")){
			resultMap.put("data", scenicwayList4);
			resultMap.put("title", titleService.queryByScenicByName(key, fromPath, scope));
			resultMap.put("scenic", scenicService.queryByScenicAndName(s));
			resultMap.put("pageNum",page4.getPageNum());
			resultMap.put("pageCount",page4.getPages());
		}else if(attr.equals("景点门票")){
			//resultMap.put("data", scenicList1);
			resultMap.put("title", titleService.queryByScenicAndName(s));
			resultMap.put("pageNum",page1.getPageNum());
			resultMap.put("pageCount",page1.getPages());
			resultMap.put("sign", "");
		}else{
			resultMap.put("data", scenicwayList);
			resultMap.put("city", scenicwayList);
			resultMap.put("title", titleService.queryByScenicByName(key, fromPath, null));
			resultMap.put("scenic", scenicService.queryByScenicAndName(s));
			resultMap.put("pageNum",page.getPageNum());
			resultMap.put("pageCount",page.getPages());
		}
		resultMap.put("scope",attr);
		if(fromPath==null||fromPath==""){
			fromPath=AddressUtils.getIpByCity();
		}
		resultMap.put("path", fromPath);
		resultMap.put("key", key);
		return resultMap;
	}
	/**
	 * @author 杨云鹏 此方法查询活动中热门城市
	 */
	@ResponseBody
	@PostMapping("/hotCityActivity")
	public List<Scenicway> hotCityByActivity() {
		return scenicwayService.findByActivityAndCity();
	}

	/**
	 * @author 杨云鹏 此方法查询热门城市
	 */
	@ResponseBody
	@PostMapping("/hotCity")
	public List<Scenicway> hotCity() {
		return scenicwayService.findByCity();
	}
	/**
	 * @author 杨云鹏 此方法查询热门路线
	 */
	@ResponseBody
	@PostMapping("/hotScenicway")
	public List<Scenicway> hotScenicway() {
		return scenicwayService.findByScenicwayDesc();
	}

	/**
	 * 活动专区
	 * @author 杨云鹏
	 * @param activityName:活动名称
	 *       frompath：目的地
	 * 所有参数为空时查询的是活动中热门路线
	 */
	@ResponseBody
	@PostMapping("/activity")
	public List<Scenicway> activityArea(@RequestParam(value="activityName",required=false) String activityName,
			@RequestParam(value = "frompath", required = false) String frompath) {
		return scenicwayService.findByActivityAndFrompathDesc(activityName, frompath);
	}
	
	/**
	 * @author 杨云鹏
	 * @param attractions:分类名称
	 *            此方法根据分类查询热门城市
	 */
	@ResponseBody
	@PostMapping("/city")
	public List<Scenicway> AttractionsAreByCity(@RequestParam("attractions") String attractions) {
		return scenicwayService.findByIndentdetailsGroupByPath(attractions);
	}

	/**
	 * @author 杨云鹏
	 * @param attractions:分类名称
	 *            此方法根据分类查询热门线路
	 */
	@ResponseBody
	@PostMapping("/scenicway")
	public List<Scenicway> AttractionsAreByScenicway(@RequestParam("attractions") String attractions) {
		return scenicwayService.findByIndentdetails(attractions);
	}

	/**
	 * @author 杨云鹏
	 * @param attractions:分类名称
	 *            此方法根据分类查询热门主题
	 */
	@ResponseBody
	@PostMapping("/title")
	public List<Scenicway> AttractionsAreByTitle(@RequestParam(value="attractions",required=false) String attractions) {
		return titleService.findByTitle(attractions);
	}
	
	/**
	 * @author 杨云鹏
	 * @param title:主题名称
	 *            此方法根据主题查热门路线
	 */
	@ResponseBody
	@PostMapping("/title/scenicway")
	public List<Scenicway> queryTitleByScenicway(@RequestParam("title") String title) {
		return scenicwayService.queryTitleByScenicway(title);
	}

	
	/**
	 * 通过产品分类id和出发城市查询旅游景点信息并使用好评率排序
	 * @author 尹加豪
	 * @param attractionsId 产品分类id
	 * @param startpath 出发城市
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 返回装载产品分类id和出发城市查询旅游景点信息并使用好评率排序的list的map,无数据返回空的list的map
	 */
	@ResponseBody
	@GetMapping("/scenicway/fwayByAttractionsIdAndStartpathOrderByFeedback")
	public Map<String,Object> findScenicwayByAttractionsIdAndStartpathOrderByFeedback(@RequestParam("attractionsId") Integer attractionsId,@RequestParam("startpath") String startpath,@RequestParam(value="rows",required=false)Integer rows,@RequestParam(value="size",required=false) Integer size) {
		System.out.println("产品分类id和出发城市查询旅游景点信息并使用好评率排序");
		System.out.println("出发城市:"+startpath);
		Integer pageNum = rows!=null?rows:1;
        Integer pageSize = size!=null?size:10;
        System.out.println("当前页:"+pageNum);
		System.out.println("每页记录数:"+pageSize);
		
		Page<Scenic> page = PageHelper.startPage(pageNum, pageSize);
		List<Scenicway> list = scenicwayService.findScenicwayByAttractionsIdAndStartpathOrderByFeedback(attractionsId,startpath);
		
		Map<String,Object> map = new HashMap<>();
		map.put("total", page.getTotal());
		map.put("data", list);
		System.out.println("通过产品分类id查询旅游景点信息并使用好评率排序的结果是:"+map);
		return map;
	}
	/**
	 * 通过旅游路线编号查询旅游路线信息
	 * @author 尹加豪
	 * @param scenicwayId 旅游路线编号
	 * @return 返回装载通过旅游路线编号查询旅游路线信息的map
	 */
	@ResponseBody
	@GetMapping("/scenicway/queryById")
	public Map<String,Object> queryById(@RequestParam("scenicwayId") Integer scenicwayId){
		System.out.println("通过旅游路线编号查询旅游路线信息 路线编号:"+scenicwayId);
		Scenicway scenicway = scenicwayService.queryById(scenicwayId);
		Map<String,Object> map = new HashMap<>();
		map.put("scenicway", scenicway);
		System.out.println("返回装载通过旅游路线编号查询旅游路线信息的map的结果是:"+map);
		return map;
	}
	
}
