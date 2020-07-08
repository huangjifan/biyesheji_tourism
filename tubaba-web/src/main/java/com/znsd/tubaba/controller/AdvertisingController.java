package com.znsd.tubaba.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Advertising;
import com.znsd.tubaba.entity.AdvertisingClassify;
import com.znsd.tubaba.entity.HotelScenic;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.service.AdvertisingService;
import com.znsd.tubaba.service.HotelScenicService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.ScenicwayService;
import com.znsd.tubaba.service.AdvertisingClassifyService;
import com.znsd.tubaba.utils.UploadAction;

@Controller
public class AdvertisingController {
	
	@Autowired
	AdvertisingClassifyService adverService;
	/**
	 * 广告功能service
	 */
	@Autowired
	AdvertisingService advertisingService;
	
	//景点+酒店service
	@Autowired
	HotelScenicService hotelService;
	
	//景点service
	@Autowired
	ScenicService scenService;
	
	//路线
	@Autowired
	ScenicwayService scewayService;
	
	/**
	 * qxl
	 * 广告分类页面的跳转
	 * */
	@RequestMapping("Classification-advertising")
	public String getAdver(Map<String, Object> object) {
		List<AdvertisingClassify> adverlist=adverService.queryAll();
		object.put("advelist", adverlist);
		object.put("count", adverlist.size());
		return "admin/Classification-advertising";
	}
	
	
	/**
	 * qxl
	 * 广告分类增加跳转
	 * */
	@RequestMapping("adver-add")
	public String getAddadver(Map<String, Object> object) {
		List<AdvertisingClassify> adverlist=adverService.queryAll();
		object.put("advelist", adverlist);
		return "admin/adver-add";
	}
	
	/**
	 * qxl\
	 * 判断广告分类是否存在
	 * */
	@ResponseBody
	@RequestMapping("chekadver")
	public boolean  getChekadver(String name) {
		if(adverService.queryOneader(name)>0) {
			return false;
		}
		return true;
	}
	
	/**
	 * 广告分类增加
	 * */
	@ResponseBody
	@RequestMapping("addadver")
	public boolean addAdver(Integer upid,String name) {
		if(upid==null) {
			upid=0;
		}
		AdvertisingClassify adverclas=new AdvertisingClassify();
		adverclas.setName(name);
		adverclas.setUpid(upid);
		if(adverService.addAdver(adverclas)>0) {
			return true;
		}
		return false;
	}
	
	/**
	 * 广告分类删除判断
	 * advercasId 广告分类编号
	 * */
	@ResponseBody
	@RequestMapping(value="deletadvercheck",method=RequestMethod.POST)
	public boolean deleteAdvercheck(Integer adverclasId) {
		System.out.println("------------"+adverclasId);
		if(adverService.queryatredId(adverclasId)>0) {
			return false;
		}
		return true;
	}
	
	/**
	 * 广告分类删除（修改状态）
	 * advercasId 广告分类编号
	 * */
	@ResponseBody
	@RequestMapping(value="deletadver",method=RequestMethod.POST)
	public boolean deleteadver(Integer adverclasId) {
		System.out.println(adverclasId);
		if(adverService.deletAdver(1,adverclasId)>0) {
			return true;
		}
		return false;
	}
	
	
	/**
	 * 修改广告分类页面跳转
	 * */
	@RequestMapping("adver-edit")
	public String getEditjsp(@RequestParam("editId") Integer editId,Map<String, Object> object) {
		AdvertisingClassify advder=adverService.queryOneId(editId);
		List<AdvertisingClassify> adverlist=adverService.queryAll();
		object.put("advelist", adverlist);
		object.put("advder", advder);
		return "admin/adver-edit";
	}
	
	/**
	 * 广告分类信息修改
	 * */
	@ResponseBody
	@RequestMapping(value="editadver")
	public boolean editAdver(Integer upid,String name,Integer id) {
		AdvertisingClassify adverclas=new AdvertisingClassify();
		adverclas.setId(id);
		adverclas.setName(name);
		adverclas.setUpid(upid);
		if(adverService.updateAdver(adverclas)>0) {
			return true;
		}
		return false;
	}
	
	
	/**
	 * 广告分类模糊查询
	 * */
	/*@RequestMapping(value="queryName",method=RequestMethod.POST)*/
	
	
	/**
	 * qxl
	 * 广告增加页面的跳转
	 * */
	@RequestMapping("advertising")
	public String getAdvertising(Map<String,Object> map) {
		List<AdvertisingClassify> adverlist=adverService.queryAll();
		List<HotelScenic> holist=hotelService.queryAll();
		List<Scenic> scenlist=scenService.queryScenicAll();
		List<Scenicway> scewaylist=scewayService.queryAll();
		map.put("holist", holist);
		map.put("scenlist", scenlist);
		map.put("scewaylist", scewaylist);
		map.put("adverlist", adverlist);
		return "admin/advertising";
	}
	
	/**
	 * qxl
	 * 文件的上传
	 * file 文件路径和名字
	 * */
	@ResponseBody
	@RequestMapping(value="uploadImg",method=RequestMethod.POST)
	public Map<String,Object> getImage(@RequestParam MultipartFile file,HttpServletRequest request){
        String oldName = file.getOriginalFilename();
		Map<String, Object> map=new HashMap<String ,Object>();
		UploadAction  uplod=new UploadAction();
		map.put("imageName", uplod.fileupload(oldName,file, request));
		return map;
	}
	

	/**
	 * 返回装载通过广告分类编号查询广告信息的map
	 * @param adverclasId 分类编号
	 * @param isLimit 是否分页
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 返回装载分类编号对应的广告信息的list,无数据时返回空的list
	 */
	@ResponseBody
	@GetMapping(value="/advertising/queryAdvertisingByAdverclasId",produces="application/json")
	public Map<String,Object> queryAdvertisingByAdverclasId(@RequestParam("adverclasId") Integer adverclasId,@RequestParam(value= "isLimit" ,defaultValue="false",required=false)boolean isLimit,@RequestParam(value = "rows",required = false)Integer rows,@RequestParam(value = "size",required = false) Integer size){
		System.out.println("通过广告分类编号查询广告信息 分类编号:"+adverclasId);
		Page<Scenic> page = null;
		//是否分页
		if(isLimit) {
			Integer pageNum = rows!=null?rows:1;
			Integer pageSize = size!=null?size:10;
			System.out.println("当前页:"+pageNum);
			System.out.println("每页记录数:"+pageSize);
			page = PageHelper.startPage(pageNum, pageSize);
		}
		List<Advertising> list = advertisingService.queryAdvertisingByAdverclasId(adverclasId);
		Map<String,Object> map = new HashMap<>();
		map.put("total", page != null?page.getTotal() : list.size());
		map.put("data", list);
		
		System.out.println("通过广告分类编号查询广告信息的结果是:"+map);
		return map;
	} 
	
	/**
	 * 广告管理页面跳转
	 * */
	@RequestMapping("advertising_list")
	public String getadvertising(Map<String,Object> map) {
		List<Advertising> adinglist=advertisingService.queryAll();
		map.put("adinglist", adinglist);
		map.put("count", adinglist.size());
		return "admin/advertising_list";
	}
	
	
	
	/**
	 * 广告增加
	 * index  广告顺序
	 * adver 分类编号
	 * strattime 开始时间
	 * endtime 结束时间
	 * img 广告图片路径
	 * hol 酒店加景点编号
	 * way 路线编号
	 * sce 景点编号
	 * */
	@ResponseBody
	@RequestMapping(value="advertisingAdd",method=RequestMethod.POST)
	public boolean  getAddAdvertising(int index,Integer adver,String strattime,String endtime,String img,Integer hol,Integer way,Integer sce) {
		System.out.println("酒店加景点"+hol);
		System.out.println("路线"+way);
		System.out.println("景点"+sce);
		//格式化开始时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date date=null;
	    try { 
	    	date=sdf.parse(strattime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    //格式化结束时间
	    SimpleDateFormat endsdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date enddate=null;
	    try {
	    	enddate=endsdf.parse(endtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    Advertising advertising=new Advertising();
	    AdvertisingClassify adverclas=new AdvertisingClassify();
	    adverclas.setId(adver);
	    advertising.setImg(img);
	    advertising.setAdverclasId(adverclas);
	    advertising.setIndex(index);
	    advertising.setStarttime(date);
	    advertising.setEndtime(enddate);
	    //增加获取新数据 的id
	    int mark=advertisingService.addAdvertising(advertising);
	    //往记录表增加数据
	    advertisingService.addAdverOrAdsing(adver, way, mark, sce, hol);
	    return true;
	}
	
	/**
	 * 广告的删除 
	 * */
	@ResponseBody
	@RequestMapping(value="deleteAdvertising",method=RequestMethod.POST)
	public boolean delete(Integer id) {
		int mark=advertisingService.deleteAdsing(1,id);
		if(mark>0) {
			return false;
		}
		return false;
	}
}
