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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.znsd.tubaba.entity.Address;
import com.znsd.tubaba.entity.Attractions;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicimage;
import com.znsd.tubaba.entity.Scenicstatus;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.TicketsType;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.service.AddressService;
import com.znsd.tubaba.service.AttractionsService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.ScenicwayService;
import com.znsd.tubaba.service.TitleService;
import com.znsd.tubaba.service.admin.ScenicimageService;
import com.znsd.tubaba.service.admin.ScenicstatusService;
import com.znsd.tubaba.service.admin.TicketsTypeService;
import com.znsd.tubaba.utils.FileUtil;
import com.znsd.tubaba.utils.IsInteger;
import com.znsd.tubaba.utils.PinYinUtil;


/**
 * 屈贤柳
 * @author Administrator
 * @Time  2018年11月1日19:24:15
 */
@Controller
public class JumpController {
	
	/**
	 * 景点功能service
	 */
	@Autowired
	protected ScenicService scenicService;
	
	
	/**
	 * 路线功能service
	 * */
	@Autowired
	ScenicwayService scewayService;
	
	/**
	 * 主题分类service
	 */
	@Autowired
	public TitleService titleService;
	
	/**
	 * 地址service
	 */
	@Autowired
	public AddressService addresService;
	/**
	 * 景点状态service
	 */
	@Autowired
	public ScenicstatusService statusService;
	/**
	 * 景点图片service
	 */
	@Autowired
	ScenicimageService sceniamgeService;
	
	
	public ScenicimageService imageService;
	/**
	 * 景点门票类型service
	 */
	@Autowired
	public TicketsTypeService ticketsTypeService;
	
	/**
	 * 景点分类serviec
	 */
	@Autowired
	public AttractionsService attractuibsServuce;
	
	//景点图片管理页面跳转
	@RequestMapping("scenicimage-list")
	public String  getScenPict(Map<String, Object> map) {
		List<Scenic> scenlist=scenicService.queryByScenic();
		map.put("scenlist", scenlist);
		map.put("count", scenlist.size());
		return "admin/scenicimage-list";
	}
	
	//路线图片管理页面跳转
	@RequestMapping("scenwayimage-list")
	public String  getScenwayPict(Map<String, Object> map) {
		List<Scenicway> scenway=scewayService.queryByScenwayImage();
		map.put("scenway", scenway);
		return "admin/scenwayimage-list";
	}
	
	//我的首页
	@RequestMapping("picture-list")
	public String getpicture() {
		return "admin/picture-list";
	}
	
	//亲子游页面跳转
	@RequestMapping("product-brand")
	public String getBrand(){
		return "admin/product-brand";
	}
	
	//定制游页面跳转
	@RequestMapping("custom")
	public String getcustom() {
		return "admin/custom";
	}
	
	//周边游页面跳转
	@RequestMapping("swim-around")
	public String getSwim() {
		return "admin/swim-around";
	}
	
	//国内游页面跳转
	@RequestMapping("domestic-travel")
	public String getDomestic() {
		return "admin/domestic-travel";
	}
	
	/**
	 * @Author 黄振伟
	 * @param  跳转景点门票页面
	 * @return 跳转到admin/attractions-tickets景点首页
	 * @Time 2018年11月2日07:53:29
	 */
	@RequestMapping("attractions-tickets")
	public String gettick(Map<String, Object> map) {
		return "admin/attractions-tickets";
	}
	
	
	/**
	 * 回復景點
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("restore_del")
	public boolean restore_del(@RequestParam("id") Integer id) {
		int delScenicAll = scenicService.delScenicAll(id);
		
		if(delScenicAll>0)
			return true;
		
		return false;
	}
	
	/**
	 * @Author 黄振伟
	 * @param rows 当前页数
	 * @param size 每页多少条数据
	 * @return 返回分页后的景点信息
	 * @Time 2018年11月2日15:51:33
	 */
	@ResponseBody
	@RequestMapping("ticketsPage")
	public Map<String, Object> ticketsPage(HttpServletRequest request,
			@RequestParam("page") Integer pageindex,
			@RequestParam("limit") Integer pagesize){
		Map<String, Object> map = new HashMap<>();
		Page<Scenic> page = PageHelper.startPage(pageindex, pagesize);
		List<Scenic> scenicList = scenicService.queryScenicAll();

		map.put("code", 200);//数据状态200正常，其他错误
		map.put("msg", "");//文本消息
		map.put("count", page.getTotal());//数据总数
		map.put("data", scenicList);//数据
		return map;
	}
	
	/**
	 * 跳转到景点门票删除信息页面
	 * @return
	 */
	@RequestMapping("attractions-tickets-del")
	public String  attractions_tickets_del(){
		return "admin/attractions-tickets-del";
	}
	
	/**
	 * 查询所有删除状态的景点信息
	 * @param pageindex
	 * @param pagesize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getDeltickets")
	public Map<String,Object> getDeltickets(@RequestParam("page") Integer pageindex,
			@RequestParam("limit") Integer pagesize){
		
		Map<String, Object> map = new HashMap<>();
		Page<Scenic> page = PageHelper.startPage(pageindex, pagesize);
		List<Scenic> scenicList = scenicService.queryScenicAllDel();

		map.put("code", 200);//数据状态200正常，其他错误
		map.put("msg", "");//文本消息
		map.put("count", page.getTotal());//数据总数
		map.put("data", scenicList);//数据
		return map;
	}
	
	
	/**
	 * @author 黄振伟
	 * @param 删除景点信息
	 * @return 删除成功返回true,失败false
	 */
	@ResponseBody
	@RequestMapping("attractions_del")
	public boolean Attractions_tickets_del(@RequestParam("id") Integer id){
		System.out.println(id);
		int res = scenicService.delScenic(id);
		if (res>0) {
			return true;
		}
		return false;
	}
	
	/**
	 * 跳转到增加景点页面
	 * @return 返回景点增加页面路径
	 */
	@RequestMapping("attractions_tickets_add")
	public String attractions_tickets_add(){
		return "admin/attractions_tickets_add";
	}
		
	
	
	
	/**
	 * @author 黄振伟
	 * @param scenic 景点对象
	 * @param adultprice 	成人价格
	 * @param childprice	儿童价格
	 * @param file			图片
	 * @param commentdatemin 上传时间
	 * @param commentdatemax 维护时间
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="attractions_add")
	public String attractions_tickets_add(Scenic scenic,@RequestParam("cover") MultipartFile[] file2
			,@RequestParam("file") MultipartFile[] file,HttpServletRequest request
			,Integer titleSelect,String commentdatemin,String commentdatemax
			,Integer adultprice,Integer childprice) throws Exception{
		System.out.println("----------添加景点-----------");
		//根据省份Id获取省份名称赋值到景点类Province
		scenic.setProvince(addresService.queryAddressById(scenic.getProvince()));
		//根据城市Id获取城市名称赋值到景点City
		scenic.setCity(addresService.queryAddressById(scenic.getCity()));
		//根据主题id获取主题类赋值到景点类Title
		scenic.setTitle(titleService.queryTitleById(titleSelect));
		//转换景点名称为拼音赋值加入到景点类中Scenicname_pinyin
		scenic.setScenicname_pinyin(PinYinUtil.getPingYin(scenic.getScenicname()));			
		//获取封面图片的路径
		List<String> upload = FileUtil.uploadFile(file2, request);
		for (String up : upload) {
			//把获取的路径赋值到景点类中的coverimage中
			scenic.setCoverImage(up);
		}
		System.out.println(scenic);

		//景点状态
		Scenicstatus status = new Scenicstatus();
		//上架时间
		status.setPuttime( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(commentdatemin));
		//维护时间
		status.setServiceingtime( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(commentdatemax));
		System.out.println(status);
		
		//门票类型
		TicketsType ticketsType = new TicketsType();
		ticketsType.setType("adultprice");
		ticketsType.setPrice((double)adultprice);
		TicketsType ticketsType2 = new TicketsType();
		ticketsType2.setType("childprice");
		ticketsType2.setPrice((double)childprice);


		//获取图片名称
		List<String> uploadFile = FileUtil.uploadFile(file, request);
		ticketsTypeService.addScenicAll(scenic, status, ticketsType, ticketsType2, uploadFile);

		return  "admin/comment";
	}
	
	
	@ResponseBody
	@RequestMapping("tickets")
	public boolean getAdmin() {
		return true;
	}
	
	//跳转到编辑景点页面
	@RequestMapping(value="attractions_tickets_aedit")
	public String attractions_tickets_eidt(@RequestParam("id")Integer id,
			Map<String,Object> map,HttpServletRequest request){
		//景点门票
		Scenic scenic = scenicService.queryScenic(id);
		scenic.setId(id);
		//景点门票类型
		List<TicketsType> ticketsList = ticketsTypeService.queryTicketsById(id);
		//景点状态
		Scenicstatus status = statusService.queryStatusById(id);
		//景点图片
		List<Scenicimage> imgList = sceniamgeService.queryScenicimageByScenicId(id);
		//维护时间
		String set = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(status.getServiceingtime());
		System.out.println(scenic);
		map.put("Serviceingtime", set);
		map.put("imgList",imgList);
		map.put("ticketsList",ticketsList);
		map.put("scenic", scenic);
		System.out.println("-------------景点修改-----------");
		
		return "admin/attractions_tickets_edit";
	}
	
	//修改景点信息
	@ResponseBody
	@RequestMapping(value="attractions_edit")
	public String attractions_edit(HttpServletRequest request,
			Scenic scenic,@RequestParam("uploadPath") String uplodPath
			,String adultprice,Integer titleSelect
			,String childprice) throws ParseException{
		//根据主题id获取主题类赋值到景点类Title
		scenic.setTitle(titleService.queryTitleById(titleSelect));
		
		if(IsInteger.isInteger(scenic.getProvince())){
			//根据省份Id获取省份名称赋值到景点类Province
			scenic.setProvince(addresService.queryAddressById(scenic.getProvince()));
		}
		if(IsInteger.isInteger(scenic.getCity())){
			//根据城市Id获取城市名称赋值到景点City
			scenic.setCity(addresService.queryAddressById(scenic.getCity()));
		}
		System.out.println(".........."+uplodPath);
		String[] uplodNames = uplodPath.split(",");
		
		scenic.setScenicname_pinyin(PinYinUtil.getPingYin(scenic.getScenicname()));
		System.out.println(scenic);
		TicketsType adult = ticketsTypeService.queryTicketsprice(scenic.getId(), "adultprice");
		TicketsType child = ticketsTypeService.queryTicketsprice(scenic.getId(), "childprice");
		ticketsTypeService.updateScenics(scenic, adult, child, new Date(), adultprice, childprice,uplodNames);
		return "true";
	}
	
	/**
	 * @Author 黄振伟
	 * @param 从数据库查询主题表所有数据
	 * @return 返回一个转载了主题信息的List的Map集合,自动转为json格式
	 * @Time 2018年11月2日07:50:22
	 */
	@ResponseBody
	@RequestMapping("queryTitleAll")
	public List<Title> queryTitleAll(Map<String, Object> map){
		List<Title> titlelist = titleService.queryTitleAll();
		return titlelist;
	}
	
	/**
	 * @Author 黄振伟
	 * @param 从数据库查询所有省的数据
	 * @return 返回一个装载了省份的list,自动转为json格式
	 * @Time 2018年11月2日10:17:40
	 */
	@ResponseBody
	@RequestMapping("queryProvinceAll")
	public List<Address> queryProvinceAll(){
		List<Address> addresslist = addresService.queryProvincesSubCity(0);
		return addresslist;
	}
	
	/**
	 * @author 黄振伟
	 * @param  查询所有的城市
	 * @return 返回一个装载了所有城市的list并且转为json格式
	 */
	@ResponseBody
	@RequestMapping("queryCityAlll")
	public List<Address> queryCityAlll(){
		List<Address> cityList = addresService.queryCityAll();
		return cityList;
	}
	
	/**
	 * @Author 黄振伟
	 * @param  查询指定省下面的所有城市
	 * @return 返回一个装载了所有城市数据的list,自动转为json格式
	 * @Time 2018年11月2日10:17:40
	 */
	@ResponseBody
	@RequestMapping("queryCitiAll")
	public List<Address> queryCitiAll(@RequestParam("upid") int upid){
		List<Address> addresslist = addresService.queryProvincesSubCity(upid);
		return addresslist;
	}
	
	/**
	 * @author 黄振伟
	 * @param  查询所有的景点类型
	 * @return 返回一个装载了景点类型的List到前台，形成下拉菜单
	 * @time   2018年11月9日20:45:42
	 */
	@ResponseBody
	@RequestMapping("queryAttractions")
	public List<Attractions> queryAttractions(){
		List<Attractions> attrList = attractuibsServuce.queryAttr();
		return attrList;
	}
	
	@RequestMapping("travel-guides")
	public String getGuides() {
		return "admin/travel-guides";
	}
	
	/**
	 * 从图片表里查询路线详细的图片，按指定的路线id查询
	 * 返回图片的list，无数据返回空
	 * scenwayId 路线id
	 * */
	@RequestMapping("scenwayImage-show")
	public String getScenWayimageShow(@RequestParam("scenwayId")Integer scenwayId,Map<String,Object> map) {
		List<Scenicimage> imagelist=sceniamgeService.queryScenicimageByScenicwayId(scenwayId);
		map.put("imagelist", imagelist);
		map.put("count",imagelist.size());
		map.put("scenwayId", scenwayId);
		return "admin/scenwayImage-show";
	}
	
	/**
	 * 查询景点详细图片，按照指定的景点id查询
	 * 返回景点图片的list，无数据返空
	 * scenId 景点Id
	 * */
	@RequestMapping("scenImage-show")
	public String getScenImageShow(@RequestParam("scenId")Integer scenId,Map<String,Object> map) {
		List<Scenicimage> imagelist=sceniamgeService.queryScenicimageByScenicId(scenId);
		map.put("imagelist", imagelist);
		map.put("count", imagelist.size());
		return "admin/scenImage-show";
				
	}
	
	
	/**
	 * 景点的图片增加
	 * */
	@RequestMapping("scenicImage-add")
	public String getscenImageAdd(Map<String,Object> map) {
		List<Scenic> sceniclist=scenicService.queryScenicAll();
		map.put("sceniclist", sceniclist);
		return "admin/scenicImage-add";
	}
	
	/**
	 * 批量删除
	 * @return
	 */
	@ResponseBody
	@RequestMapping("piliang_delete")
	public boolean piliang_delete(@RequestParam("ids") String ids){
		System.out.println("**********************"+ids);
		String[] split = ids.split(",");
		int res = -1 ;
		for (int i = 0; i < split.length; i++) {
			int parseInt = Integer.parseInt(split[i]);
			 res = scenicService.delScenic(parseInt);
		}
		if(res>0){
			return true;
		}
		return false;
	}
	
	@RequestMapping("scenicway-add")
	public String getScenicwayImg(Map<String,Object> map) {
		map.put("scwaylist", scewayService.queryAll());
		return "admin/scenicway-add";
	}
	
	/**
	 * 
	 * 路线图片删除
	 * 
	 * **/
	@ResponseBody
	@RequestMapping("deletewayImage")
	public boolean getDeleteImage(@RequestParam("ids") String ids,
			HttpServletRequest request) {
		System.out.println("---------                   1231             --------------");
		request.getParameter("scenicWayImage");
		String[] str=ids.split(",");
		int mark=0;
		for(String strs:str) {
			Integer scenicId=Integer.parseInt(strs);
			mark=sceniamgeService.deleteScenicimageById(scenicId);
		}
		
		if(mark>0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping(value="scenicImageAdd",method=RequestMethod.POST)
	public boolean getScenicImagAdd(@RequestParam(value="uploadPath") String[] file,@RequestParam(value="scenicId",required = false) Integer scenicId,@RequestParam(value="scenicwayId",required = false) Integer scenicwayId) {
		for (String string : file) {
			System.out.println(string);
			Scenic scenic=new Scenic();
			Scenicway scenway=new Scenicway();
			scenic.setId(scenicId);
			scenway.setId(scenicwayId);
			Scenicimage scenimage=new Scenicimage();
			scenimage.setPath(string);
			scenimage.setScenic(scenic);
			scenimage.setScenicway(scenway);
			sceniamgeService.addScenicImage(scenimage);
		}
		return true;
	}
}
	
