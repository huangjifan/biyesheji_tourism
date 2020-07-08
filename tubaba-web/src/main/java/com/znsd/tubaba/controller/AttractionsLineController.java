/**
 * 下午4:29:22TODO
 */
package com.znsd.tubaba.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicimage;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.ScenicwayDepart;
import com.znsd.tubaba.entity.ScenicwayOrscenic;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.service.AddressService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.ScenicwayDepartService;
import com.znsd.tubaba.service.ScenicwayService;
import com.znsd.tubaba.service.TitleService;
import com.znsd.tubaba.service.admin.TicketsTypeService;
import com.znsd.tubaba.utils.IsInteger;
import com.znsd.tubaba.utils.PinYinUtil;

/**
 * 后台景点路线controller
 * @author 黄振伟
 * @Time  2018年11月9日16:29:47
 */
@Controller
public class AttractionsLineController {
	
	/**
	 * 景点的Service
	 */
	@Autowired
	ScenicService scenicService;
	/**
	 * 景点路线的Service
	 */
	@Autowired
	ScenicwayService ScenicwayService;
	/**
	 * 地址service
	 */
	@Autowired
	public AddressService addresService;
	
	/**
	 * 主题分类service
	 */
	@Autowired
	public TitleService titleService;
	/**
	 * 景点门票类型
	 */
	@Autowired
	public TicketsTypeService tocletsTypeService;
	
	/**
	 * 景点出发日期
	 */
	@Autowired
	ScenicwayDepartService scenicwayDepartService;
	
	
	/*
	 * 跳转到景点路线首页
	 * */
	@RequestMapping("attractions-line")
	public String gettick() {
		return "admin/attractions-line";
	}
	/*
	 * 跳转到已删除的景点信息页面
	 * */
	@RequestMapping("attractions-del")
	public String deltick() {
		return "admin/attractions-del";
	}
	/*
	 * 景点状态改变
	 */
	@ResponseBody
	@RequestMapping("restore")
	public boolean restore(@RequestParam("id") Integer id) {
		
		int scenicwayArr = ScenicwayService.updateScenicwayArr(id);
		if (scenicwayArr>0) {
			return true;
		}
		return false;
	}
	/*
	 * 已删除的景点路线数据接口
	 */
	@ResponseBody
	@RequestMapping("delDirections")
	public Map<String, Object> delDirections(@RequestParam("page") Integer pageindex,
			@RequestParam("limit") Integer pagesize) {
		
		
		Map<String, Object> map = new HashMap<>();
		//调用分页 
		Page<Scenicway> page = PageHelper.startPage(pageindex, pagesize);
		List<Scenicway> list = ScenicwayService.queryAllDel();
		
		map.put("code", 200);//数据状态200正常，其他错误
		map.put("msg", "");//文本消息
		map.put("count", page.getTotal());//数据总数
		map.put("data", list);//数据
		return map;
	}
	/*
	 * 跳转到景点路线增加页面
	 * */
	@RequestMapping("attractions_line_add")
	public String lineAdd(){
		return "admin/attractions_line_add";
	}
	/*
	 * 跳转到景点路线增加页面
	 * */
	@RequestMapping("Test")
	public String test(){
		return "admin/Test";
	}
	
	/**
	 * 景点路线数据接口
	 * @param request
	 * @param pageindex
	 * @param pagesize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getDirections")
	public Map<String, Object> getDirections(HttpServletRequest request,
			@RequestParam("page") Integer pageindex,
			@RequestParam("limit") Integer pagesize){
		Map<String, Object> map = new HashMap<>();
		//调用分页 
		Page<Scenicway> page = PageHelper.startPage(pageindex, pagesize);
		List<Scenicway> scenicwaysList = ScenicwayService.queryAll();
		for (Scenicway scenicway : scenicwaysList) {
			System.out.println(scenicway);
		}
		map.put("code", 200);//数据状态200正常，其他错误
		map.put("msg", "");//文本消息
		map.put("count", page.getTotal());//数据总数
		map.put("data", scenicwaysList);//数据
		return map;
	}
	
	/**
	 * 根据选择的城市返回该城市下的所有景点
	 * @param city
	 */
	@ResponseBody
	@RequestMapping("queryScenicByCity")
	public List<Scenic> queryScenicByCity(@RequestParam("city") String city){
		List<Scenic> scenicList = scenicService.queryScenicByCity(city);
		return scenicList;
		
	}
	
	//添加路线
	@ResponseBody
	@RequestMapping("addLine")
	public void addLine(Scenicway scnicway,@RequestParam("uploadPath")String uploadPath,
			@RequestParam("titleSelect") Integer titleSelect,Integer attractions
			, String endpath, String startpath,@RequestParam("scenicId")Integer[] scenicId){
		System.out.println("------------ 景点路线增加 ------------");
		String[] uploadNames = uploadPath.split(",");
		tocletsTypeService.addScenicwayAll(scnicway, uploadNames, titleSelect, endpath, startpath, attractions,scenicId);
		System.out.println("增加成功");
	}
	
	/**
	 * @author 黄振伟
	 * @param 删除景点信息
	 * @return 删除成功返回true,失败false
	 */
	@ResponseBody
	@RequestMapping("delLine")
	public boolean Attractions_tickets_del(@RequestParam("id") Integer id){
		System.out.println(id);
		int status = ScenicwayService.updateScenicwayStatus(id);
		if (status>0) {
			return true;
		} 
		return false;
	}
	

	/**
	 * 跳转到景点路线修改页面
	 * @param id 传过来需要修改的路线id
	 * @return 路线修改页面的路径
	 */
	@RequestMapping("updLine")
	public String updLine(@RequestParam("id") Integer id,
			Map<String,Object> map,HttpServletRequest request){
		System.out.println("修改----------------------------");
		Scenicway scenicway = ScenicwayService.queryScenicwayById(id);
		Set<ScenicwayOrscenic> scenicwayOrscenics = scenicway.getScenicwayOrscenics();
		Set<Scenicimage> scenicimages = scenicway.getScenicimages();
		map.put("scenicway",scenicway);
		map.put("scenicimages",scenicimages);
		return "admin/attractions_line_edit";
	}
	
	//修改景点
	@RequestMapping("updateLine")
	public void updateLine(Scenicway scnicway,@RequestParam("titleSelect")Integer titleSelect
			,@RequestParam("uploadPath")String uploadPath,@RequestParam("scenicId")Integer[] scenicId){
		
		if(IsInteger.isInteger(scnicway.getEndpath())){
			scnicway.setEndpath(addresService.queryAddressById(scnicway.getEndpath()));
		}
		if(IsInteger.isInteger(scnicway.getStartpath())){
			scnicway.setStartpath(addresService.queryAddressById(scnicway.getStartpath()));
		}
		scnicway.setWay_pinyin(PinYinUtil.getPingYin(scnicway.getWay()));
		Title title = titleService.queryTitleById(titleSelect);
		scnicway.setTitle(title);
		tocletsTypeService.updateScenicsway(scnicway, uploadPath, scenicId);
		System.out.println(uploadPath);
		System.out.println(scnicway);
	}
	
	//添加路线出发时间
	@RequestMapping("addTime")
	public String addTime(@RequestParam("id") Integer id,
			Map<String,Object> map) throws ParseException{
		System.out.println("时间............... "+id);
		List<ScenicwayDepart> list = scenicwayDepartService.queryScenicwayById(id);
		for (ScenicwayDepart scenicwayDepart : list) {
			String format = new SimpleDateFormat("yyyy-MM-dd").format(scenicwayDepart.getDeparttime());
			System.out.println(format);
			Date parse = new SimpleDateFormat("yyyy-MM-dd").parse(format);
			scenicwayDepart.setDeparttime(parse);
			System.out.println(scenicwayDepart);
		}
		map.put("wayId", id);
		map.put("list", list);
		return "admin/addTime";
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	@ResponseBody
	@RequestMapping("pi_delete")
	public boolean pi_delete(@RequestParam("ids") String ids){
		System.out.println("**********************"+ids);
		String[] split = ids.split(",");
		int res = -1 ;
		for (int i = 0; i < split.length; i++) {
			int parseInt = Integer.parseInt(split[i]);
			 res = ScenicwayService.updateScenicwayStatus(parseInt);
		}
		if(res>0){
			return true;
		}
		return false;
	}
	
	//添加景点路线出发时间
		@ResponseBody
		@RequestMapping("addIdent")
		public boolean addIdent(@RequestParam("id")Integer id,@RequestParam("dates")String[] dates,@RequestParam("numbers")Double[] numbers) {
			List<ScenicwayDepart> list = new ArrayList<ScenicwayDepart>();
			Scenicway scenicway = new Scenicway();
			scenicway.setId(id);
			for (int i = 0; i < dates.length; i++) {
				ScenicwayDepart scenicwayDepart = new ScenicwayDepart();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date date=null;
				try {
					date = formatter.parse(dates[i]);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				scenicwayDepart.setDeparttime(date);
				scenicwayDepart.setPrice(numbers[i]);
				scenicwayDepart.setScenicway(scenicway);
				list.add(scenicwayDepart);
			}
			Integer result = scenicwayDepartService.insertScenicwayById(list,id);
			if(result > 0) {
				return true;
			}
			return false;
		}
}
