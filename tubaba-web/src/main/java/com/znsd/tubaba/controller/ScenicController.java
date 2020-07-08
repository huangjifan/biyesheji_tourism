package com.znsd.tubaba.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.znsd.tubaba.entity.Address;
import com.znsd.tubaba.entity.Collect;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Mark;
import com.znsd.tubaba.entity.Remark;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicimage;
import com.znsd.tubaba.entity.TicketsType;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.entity.Travel;
import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.service.AddressService;
import com.znsd.tubaba.service.CollectService;
import com.znsd.tubaba.service.IndentService;
import com.znsd.tubaba.service.MySpaceTripService;
import com.znsd.tubaba.service.RemarkImgService;
import com.znsd.tubaba.service.RemarkService;
import com.znsd.tubaba.service.RemarklikeService;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.TitleService;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.service.admin.ScenicimageService;
import com.znsd.tubaba.service.admin.TicketsTypeService;
import com.znsd.tubaba.utils.AddressUtils;
/**
 * @author 尹加豪
 *
 * @时间 2018年10月30日 下午10:28:27
 * 
 * @描述: 景点功能controller类
 */
@Controller
public class ScenicController {
	
	/**
	 * 景点功能service
	 */
	@Autowired
	protected ScenicService scenicService;
	/**
	 * 地址功能service
	 */
	@Autowired
	protected AddressService addressService;
	/**
	 * 主题功能service
	 */
	@Autowired
	protected TitleService titleService;
	
	/**
	 * 用户service
	 * */
	@Autowired
	UserService userService;
	
	
	/**
	 * 游记的功能Service
	 * */
	@Autowired
	MySpaceTripService travService;
	
	@Autowired
	TicketsTypeService typeSerivce;
	
	
	/**
	 * 评论Service
	 * */
	@Autowired
	RemarkService remarkService;
	
	@Autowired
	RemarklikeService relikeService;
	
	
	@Autowired
	CollectService colService;
	
	
	/**
	 * 评论图片Service
	 * */
	@Autowired
	RemarkImgService reimgService;
	
	@Autowired
	IndentService indentService;
	
	/**
	 * 景点图片
	 * */
	@Autowired
	ScenicimageService scenImage;
	
	/**
	 * 查询热搜景点信息
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 返回装载查询热搜景点信息的map
	 */
	@ResponseBody
	@GetMapping("/scenic/queryHotBotScenic")
	public Map<String,Object> queryHotBotScenic(@RequestParam(value = "rows",required = false)Integer rows,@RequestParam(value = "size",required = false) Integer size){
		System.out.println("当前页:"+rows);
		System.out.println("每页记录数:"+size);
		
		Integer pageNum = rows!=null?rows:1;
        Integer pageSize = size!=null?size:10;
		Page<Scenic> page = PageHelper.startPage(pageNum, pageSize);
		List<Scenic> list = scenicService.queryHotBotScenic();
		
		Map<String,Object> map = new HashMap<>();
		map.put("total", page.getTotal());
		map.put("data", list);
		System.out.println("查询热搜景点信息的结果是:"+map);
		return map;
	}
	/**
	 * 搜索框输入数据后点击搜索
	 */
	@ResponseBody
	@GetMapping("/scenic/searchBoxClick")
	public Map<String,Object> searchBoxClick(@RequestParam("searchVal") String searchVal,@RequestParam("cid") String cid,@RequestParam("scope") int scope) {
		System.out.println("要搜索的值是:"+searchVal);
		System.out.println("目的地城市编号是:"+cid);
		System.out.println("要搜索的范围是:<"+scope+"> scope-查询范围()");
		
		Map<String,Object> map = new HashMap<>();
		
		System.out.println("搜索框输入数据后点击搜索的结果是:"+map);
		return map;
	}
	/**
	 * 搜索框输入数据后自动搜索,搜索 地区名称/地区名称的拼音 , 景点名称/景点名称的评语 , 主题名称 
	 * @param searchVal 要搜索的值
	 * @param rows 当前页数
	 * @param size 每页记录数
	 * @return 如果要搜索的值是以字母开头则返回装载按景点名称的拼音模糊查询景点信息的map
	 * 			,不然就返回装载按景点名称模糊查询景点信息的map
	 */
	@ResponseBody
	@GetMapping("/scenic/searchBoxSelfMotion")
	public Map<String,Object> searchBoxSelfMotion(@RequestParam("searchVal") String searchVal,@RequestParam(value = "rows",required = false)Integer rows,@RequestParam(value = "size",required = false) Integer size) {
		Integer pageNum = rows!=null?rows:1;
		Integer pageSize = size!=null?size:10;
		System.out.println("要搜索的值是:"+searchVal);
		System.out.println("当前页:"+pageNum);
		System.out.println("每页记录数:"+pageSize);

		Page<Scenic> page = PageHelper.startPage(pageNum, pageSize);
		List<Scenic> scenicList = null;
		List<Address> addressList = null;
		List<Title> titleList = null;
		char c = Character.toLowerCase(searchVal.charAt(0));
		//字母开头
		if (c >= 'a' && c <= 'z'){
			System.out.println("按景点名称的拼音模糊查询景点信息");
			scenicList = scenicService.queryScenicBySearchScenicnameOrScenicnamePinYin(null, searchVal);
			addressList = addressService.queryAddressByAreaOrArea_pinyin(null, searchVal);
        }
		else {
        	System.out.println("按景点名称模糊查询景点信息");
        	scenicList = scenicService.queryScenicBySearchScenicnameOrScenicnamePinYin(searchVal, null);
        	addressList = addressService.queryAddressByAreaOrArea_pinyin(searchVal, null);
        }
		titleList = titleService.queryTitleByType(searchVal);
		Map<String,Object> map = new HashMap<>();
		map.put("scenicTotal", page.getTotal());
		map.put("scenicList", scenicList);
		map.put("addressList", addressList);
		map.put("titleList", titleList);
		
		System.out.println("搜索框输入数据后自动搜索的结果是:"+map);
		return map;
	}	
	/**
	 * 根据定位地址和季节，查询同省或同市的风景
	 * @author 杨云鹏
	 * @scope:定位的地址
	 * */
	@ResponseBody
	@GetMapping("/hot/sale/scenic")
	public List<Scenic> inSeasonHotSale(String scope){
		return scenicService.queryByScenicWithAddress(scope);
	}
	
	/**
	 * 根据定位地址和订单数量，查询同省或同市的风景
	 * @author 杨云鹏
	 * */
	public List<Scenic> bestsellers(String scope){
		return scenicService.qeuryByScenicWithAddressAndIndentdetails("scenicid",scope);
	}
	
	/**
	 * 按景点订单数量查询热门主题
	 * @author 杨云鹏
	 * */
	@ResponseBody
	@GetMapping("/topics")
	public List<Title> selectedTopics(){
		return titleService.queryByThemeWithIndentdetails();
	}
	
	/**
	 * 根据景点订单数量查询同省的城市
	 * @author 杨云鹏
	 * */
	@ResponseBody
	@PostMapping("/nearbyCity")
	public List<Scenic> nearbyCity(String scope){
		return scenicService.qeuryByScenicWithAddressAndIndentdetails("city",scope);
	}
	
	/**
	 *根据主题和城市地址查询所有的景点
	 * @author 杨云鹏
	 * @theme:主题名称
	 * @scope:城市地址   
	 * 两个都不是必须的参数
	 * */
	@ResponseBody
	@PostMapping("/findScenic")
	public List<Scenic> scenicAndTheme(String theme,String scope){
		return scenicService.queryByScenicWithThemeWithAddress(theme, scope);
	}
	
	/**
	 *热门目的地（热搜目的地）
	 * @author 杨云鹏
	 * */
	@ResponseBody
	@PostMapping("/hot/path/scenic")
	public List<Scenic> hotPath(@RequestParam(value="frompath",required=false)String frompath){
		return scenicService.qeuryByScenicWithIndentdetails(frompath);
	}
	
	/**
	 *根据活动名查询景点
	 * @author 杨云鹏
	 * */
	@ResponseBody
	@PostMapping("/hot/activity/scenic")
	public List<Scenic> hotActivity(String activityName){
		return scenicService.queryByScenicWithActivity(activityName);
	}
	@RequestMapping("/ticket")
	public String showCity(Map<String,Object> map,String city){
		if(city==null){
			city=AddressUtils.getIpByCity();
		}
		map.put("city", city);
		return "forward:/ticket.jsp";
	}
	
	/***
	 * 景点详细信息
	 * 根据景点id查询相关的游记，点评，票价，景点，好评景点，
	 * */
	@RequestMapping("scenic")
	public String Scenic(@RequestParam("id")Integer id,@RequestParam("pageIndex")Integer pageIndex,HttpSession session,Map<String,Object> map) {
		
		//查询景点信息
		Scenic scen=scenicService.queryOne(id);
		
		//查询景点图片
		List<Scenicimage> scenimagelist=scenImage.queryScenicimageByScenicId(id);
		//查询景点评论
		List<Remark> remarklist=remarkService.queryScenicId(id,pageIndex);
		//分页
		PageInfo<Remark>  page=new PageInfo<Remark>(remarklist,5);
		//查询加精的景点评论
		List<Remark> remaresslist=remarkService.queryScenicIdessence(id, pageIndex);
		//加精评论分页
		PageInfo<Remark>  esspage=new PageInfo<Remark>(remaresslist,5);
		//查询有图的评论
		List<Remark> imgralist=remarkService.queryRemarkImg(id, pageIndex);
		//查询有图的评论分页
		PageInfo<Remark>  imgpage=new PageInfo<Remark>(imgralist,5);
		String username=null;
		Collect collect=null;
		
		Map<String,Object> pricMap=scenicService.queryPraiseScenic(id);
		
		map.put("pricMap", pricMap);
		
		//游记的查询
		List<Travel> travlist=travService.querybyIndentAll(id, pageIndex);
		if(session.getAttribute("user")!=null && session.getAttribute("user")!="") {
			username=(String)session.getAttribute("user");
			User user=userService.queryOneByName(username);
			//查询用户是否收藏了该景点
			collect=colService.queryCollectByUserIdAndScenicIdOrScenicwayId(user.getId(), id, null); 
			map.put("userid", user.getId());
		}
		//查询点评的数量 
		int count=remarkService.queryRmarkCont(id);
		
		int countlike=remarkService.queryScenicIdessenceCount(id);
		
		int countimg=remarkService.queryRemarkImgCount(id);
		
		int tral=travService.querybyIndentAllCount(id);
		
		//查询景点门票的种类
		List<TicketsType> typelist=typeSerivce.queryTicketsById(id);
		
		
		//游记的查询分页
		PageInfo<Travel> travpage=new PageInfo<Travel>(travlist,5);
		for(int i=0;i<travlist.size();i++ ) {
			String content=StringUtils.substringBefore(travlist.get(i).getContent(),"<img");
			String cont=content.replaceAll("<br>", ",");
			String contents=cont.replaceAll("<p>", " ");
			String conts=contents.substring(0, 100);
			travlist.get(i).setContent(conts);
		}
		List<Title> tile= titleService.queryTitleAll();
		Scenic scenicTwo=scenicService.queryAddress(id);
		Map<String,Object> mapcorr=new HashMap<String,Object>();
			mapcorr.put("city", scenicTwo.getCity());
			mapcorr.put("province", scenicTwo.getProvince());
			mapcorr.put("titleid", scenicTwo.getTitle().getId());
		//查询相关的景点
		List<Scenic> corrlist=scenicService.queryCorrelation(mapcorr);
		List<Scenic> pralist=scenicService.queryPraise(mapcorr);
		List<Scenic> scenlist=scenicService.queryCorrScenic(mapcorr);
		map.put("bool", collect!=null);
		map.put("scencorrlist", scenlist);
		map.put("corrlist", corrlist);
		map.put("typelist", typelist);
		map.put("pralist", pralist);
		map.put("scenicTwo", scenicTwo);
		map.put("countlike", countlike);
		map.put("tralCount", tral);
		map.put("countimg", countimg);
		map.put("tilelist", tile);
		map.put("travpage", travpage);
		map.put("page", page);
		map.put("esspage", esspage);
		map.put("imgpage", imgpage);
		map.put("remarklist", remarklist);
		map.put("count", count);
		map.put("scen", scen);
		map.put("scenimagelist", scenimagelist);
		return "view/scenic";
	}
	/***
	 * 景点详细信息
	 * 根据景点id查询相关的游记，点评，票价，景点，好评景点，
	 * */
	@RequestMapping("querySce")
	public String Scenic(@RequestParam("secenicbody")String secenicbody,@RequestParam("pageIndex")Integer pageIndex,HttpSession session,Map<String,Object> map) {
		Scenic scenic=scenicService.queryScenicByContent(secenicbody);
		Integer id=null;
		if(scenic!=null){
			id=scenic.getId();
			//查询景点信息
			Scenic scen=scenicService.queryOne(scenic.getId());
			//查询景点图片
			List<Scenicimage> scenimagelist=scenImage.queryScenicimageByScenicId(id);
			//查询景点评论
			List<Remark> remarklist=remarkService.queryScenicId(id,pageIndex);
			//分页
			PageInfo<Remark>  page=new PageInfo<Remark>(remarklist,5);
			//查询加精的景点评论
			List<Remark> remaresslist=remarkService.queryScenicIdessence(id, pageIndex);
			//加精评论分页
			PageInfo<Remark>  esspage=new PageInfo<Remark>(remaresslist,5);
			//查询有图的评论
			List<Remark> imgralist=remarkService.queryRemarkImg(id, pageIndex);
			//查询有图的评论分页
			PageInfo<Remark>  imgpage=new PageInfo<Remark>(imgralist,5);
			String username=null;
			Collect collect=null;
			
			Map<String,Object> pricMap=scenicService.queryPraiseScenic(id);
			
			map.put("pricMap", pricMap);
			
			//游记的查询
			List<Travel> travlist=travService.querybyIndentAll(id, pageIndex);
			if(session.getAttribute("user")!=null && session.getAttribute("user")!="") {
				username=(String)session.getAttribute("user");
				User user=userService.queryOneByName(username);
				//查询用户是否收藏了该景点
				collect=colService.queryCollectByUserIdAndScenicIdOrScenicwayId(user.getId(), id, null); 
				map.put("userid", user.getId());
			}
			//查询点评的数量 
			int count=remarkService.queryRmarkCont(id);
			
			int countlike=remarkService.queryScenicIdessenceCount(id);
			
			int countimg=remarkService.queryRemarkImgCount(id);
			
			int tral=travService.querybyIndentAllCount(id);
			
			//查询景点门票的种类
			List<TicketsType> typelist=typeSerivce.queryTicketsById(id);
			
			
			//游记的查询分页
			PageInfo<Travel> travpage=new PageInfo<Travel>(travlist,5);
			for(int i=0;i<travlist.size();i++ ) {
				String content=StringUtils.substringBefore(travlist.get(i).getContent(),"<img");
				String cont=content.replaceAll("<br>", ",");
				String contents=cont.replaceAll("<p>", " ");
				String conts=contents.substring(0, 100);
				travlist.get(i).setContent(conts);
			}
			List<Title> tile= titleService.queryTitleAll();
			Scenic scenicTwo=scenicService.queryAddress(id);
			Map<String,Object> mapcorr=new HashMap<String,Object>();
				mapcorr.put("city", scenicTwo.getCity());
				mapcorr.put("province", scenicTwo.getProvince());
				mapcorr.put("titleid", scenicTwo.getTitle().getId());
			//查询相关的景点
			List<Scenic> corrlist=scenicService.queryCorrelation(mapcorr);
			List<Scenic> pralist=scenicService.queryPraise(mapcorr);
			List<Scenic> scenlist=scenicService.queryCorrScenic(mapcorr);
			map.put("bool", collect!=null);
			map.put("scencorrlist", scenlist);
			map.put("corrlist", corrlist);
			map.put("typelist", typelist);
			map.put("pralist", pralist);
			map.put("scenicTwo", scenicTwo);
			map.put("countlike", countlike);
			map.put("tralCount", tral);
			map.put("countimg", countimg);
			map.put("tilelist", tile);
			map.put("travpage", travpage);
			map.put("page", page);
			map.put("esspage", esspage);
			map.put("imgpage", imgpage);
			map.put("remarklist", remarklist);
			map.put("count", count);
			map.put("scen", scen);
			map.put("scenimagelist", scenimagelist);
		}else{
			map.put("error", -1);
			map.put("name", secenicbody);
		}
		
		return "view/scenic";
	}
	/**
	 * 评论判断
	 * 已登录跳转评论页面，未登录跳转登录页面
	 * */
	@ResponseBody
	@RequestMapping("checkComment")
	public boolean getCommCheck(Map<String,Object> map,@RequestParam("id")Integer id,HttpSession session) {
		System.out.println(id);
		String username=(String)session.getAttribute("user");
		User user=userService.queryOneByName(username);
		int mark=remarkService.queryById(id, user.getId());
		if(mark>0) {
			return false;
		}
		return true;
	}
	
	/**
	 * 评论的跳转
	 * intdentId 订单id
	 * */
	@RequestMapping("comment")
	public String getComment(Map<String,Object> map,@RequestParam("intdentId")Integer intdentId) {
		map.put("intdentId", intdentId);
		return "view/comment";
	}
	
	/**
	 * 景点评论增加
	 * intdentId 订单id
	 * uploadPath 评论图片
	 * content 评论内容
	 * */
	@ResponseBody 
	@PostMapping("commentAdd")
	public boolean getCommentAdd(@RequestParam("intdentId")Integer intdentId,@RequestParam("uploadPath") String uploadPath,@RequestParam("content")String content,HttpSession session) {
		String username=(String)session.getAttribute("user");
		User user=userService.queryOneByName(username);
		Indent indent=new Indent();
		indent.setId(intdentId);
		Remark remark=new Remark();
		remark.setContent(content);
		remark.setIndent(indent);
		remark.setUser(user);
		int id=remarkService.addRemark(remark);
		int updateid=indentService.updatestatus(4, intdentId);
		int mark=0;
		if(uploadPath!=null) {
			String[] str=uploadPath.split(",");
			for (String string : str) {
				System.out.println(string);
				mark=reimgService.addRemarkImg(string,id);
			}
		}
		if(mark>0&&updateid>0) {
			return true;
		}
		return false;
	}
	
	/**
	 *查询全部的评论的分页 
	 * **/
	@ResponseBody 
	@RequestMapping(value="pageAll")
	public Map<String,Object> getPageAll(@RequestParam("pageIndex")Integer pageIndex,@RequestParam("scenId")Integer scenId,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Remark> remarklist=remarkService.queryScenicId(scenId,pageIndex);
		//分页
		PageInfo<Remark>  page=new PageInfo<Remark>(remarklist,5);
		map.put("allpage", page);
		map.put("scenId", scenId);
		return map;
	}
	
	/**
	 * 点赞判断
	 * */
	@ResponseBody
	@RequestMapping("likeCheck")
	public boolean getlikeCheck(Integer userId,Integer remarkId,HttpSession session) {
		int index=relikeService.queryCount(userId, remarkId);
		if(index>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 点赞
	 * */
	@ResponseBody
	@RequestMapping("likecomment")
	public boolean getAddLike(Integer userId,Integer remarkId) {
		int mark=relikeService.addRemarkLike(userId, remarkId);
		if(mark>0) {
			return true;
		}
		return false;
	}
	
	/**
	 * 回复评论
	 * */
	@ResponseBody
	@RequestMapping(value="commentCommit",method=RequestMethod.POST)
	public boolean getCommit(String content,Integer markId,HttpSession session) {
		String username=(String)session.getAttribute("user");
		Mark mar=new Mark();
		mar.setId(markId);
		User  user=userService.queryOneByName(username);
		Remark remak=new Remark();
		remak.setUser(user);;
		remak.setContent(content);
		remak.setRemid(markId);
		remarkService.addCommit(remak);
		return true;
	}
	
	/**
	 * 有图的景点评论
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="queryPageImg",method=RequestMethod.POST)
	public Map<String,Object> queryPageImg(@RequestParam("pageIndex")Integer pageIndex,@RequestParam("scenId")Integer scenId,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Remark> remarklist=remarkService.queryRemarkImg(scenId,pageIndex);
		//分页
		PageInfo<Remark>  page=new PageInfo<Remark>(remarklist,5);
		map.put("imgpage", page);
		map.put("scenId", scenId);
		return map;
	}
	
	/**
	 * 精华评论分页
	 * */
	@ResponseBody
	@RequestMapping(value="queryessPage",method=RequestMethod.POST)
	public Map<String,Object> queryessPage(@RequestParam("pageIndex")Integer pageIndex,@RequestParam("scenId")Integer scenId,HttpSession  session){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Remark> remarklist=remarkService.queryScenicIdessence(scenId,pageIndex);
		//分页
		PageInfo<Remark>  page=new PageInfo<Remark>(remarklist,5);
		map.put("esspage", page);
		map.put("scenId", scenId);
		return map;
	}
	
	/**
	 * 查询相关景点
	 * scenId 景点id typeId 分类id
	 * */
	@ResponseBody
	@RequestMapping(value="corrScenic",method=RequestMethod.POST)
	public Map<String,Object> getcorrScenic(@RequestParam("scenId")Integer scenId,@RequestParam("typeId")Integer typeId){
		Scenic scenicTwo=scenicService.queryAddress(scenId);
		Map<String,Object> mapcorr=new HashMap<String,Object>();
		mapcorr.put("city", scenicTwo.getCity());
		mapcorr.put("province", scenicTwo.getProvince());
		mapcorr.put("titleid", typeId);
		List<Scenic> scenlist=scenicService.queryCorrScenic(mapcorr);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("scenlist", scenlist);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="getPagetra",method=RequestMethod.POST)
	public Map<String,Object> getPagetra(@RequestParam("pageIndex")Integer pageIndex,@RequestParam("scenId")Integer scenId){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Travel> travlist=travService.querybyIndentAll(scenId, pageIndex);
		for(int i=0;i<travlist.size();i++ ) {
			String content=StringUtils.substringBefore(travlist.get(i).getContent(),"<img");
			String cont=content.replaceAll("<br>", ",");
			String contents=cont.replaceAll("<p>", " ");
			String conts=contents.substring(0, 100);
			travlist.get(i).setContent(conts);
		}
		PageInfo<Travel>  page=new PageInfo<Travel>(travlist,5);
		map.put("scenId", scenId);
		map.put("page", page);
		return map;
	}
}

