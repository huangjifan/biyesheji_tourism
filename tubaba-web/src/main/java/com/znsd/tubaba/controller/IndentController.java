package com.znsd.tubaba.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.Cost;
import com.znsd.tubaba.entity.CostExplainListBean;
import com.znsd.tubaba.entity.Indent;
import com.znsd.tubaba.entity.Indentdetails;
import com.znsd.tubaba.entity.LinkMan;
import com.znsd.tubaba.entity.PlayManListBean;
import com.znsd.tubaba.service.DiscountsService;
import com.znsd.tubaba.service.IndentService;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月10日 上午10:13:16
 * 
 * @描述: 订单功能controller类
 */
@Controller
public class IndentController {
	/**
	 * 订单功能service
	 */
	@Autowired
	IndentService indentService;
	/**
	 * 活动记录功能service
	 */
	@Autowired
	DiscountsService discountsService;
	
	@InitBinder("indent")    
    public void initBinder1(WebDataBinder binder) {    
            binder.setFieldDefaultPrefix("indent.");    
    }    
	
	/**
	 * 进入填写订单界面
	 */
	@PostMapping("/indent/enterIntoFillInOrderForm")
	public String enterIntoFillInOrderForm(@RequestParam Map<String,Object> requestMap,Map<String,Object> responseMap) {
		System.out.println("进入填写订单界面");
		Double totalPrice = Double.parseDouble((String)requestMap.get("totalPrice"));
		//原价
		responseMap.put("totalPrice", totalPrice);
		Set<String> keys = requestMap.keySet();
		for (String key : keys) {
			System.out.println(key+"="+requestMap.get(key));
			responseMap.put(key, requestMap.get(key));
		}
		
		return "view/product/fillInOrderForm";
	}
	
	/**
	 * 提交订单
	 */
	@PostMapping("/indent/submitIndent")
	public String submitIndent(@ModelAttribute Indent indent
			,@ModelAttribute Indentdetails indentdetails
			/*,@ModelAttribute LinkMan linkMan*/
			,@RequestParam("iphone") String iphone
			,@RequestParam("realname") String realname
			,@RequestParam("email") String email
			,@ModelAttribute PlayManListBean playManListBean
			,@RequestParam("concessionsMoney") Double concessionsMoney
			,@RequestParam("grossAmount") Double grossAmount
			,@ModelAttribute CostExplainListBean costExplainListBean
			,@RequestParam("couponId") Integer couponId
			,Map<String,Object> responseMap
			,HttpServletRequest request) {
		System.out.println("提交订单");
		LinkMan linkMan = new LinkMan(realname,iphone,email);
		Cost cost = new Cost(concessionsMoney,grossAmount,null,null);
		String ordernumber = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + 10 + (int)((Math.random()*9+1)*1000);
		indent.setOrdernumber(ordernumber);
		System.out.println(indent);
		System.out.println(indentdetails);
		System.out.println(linkMan);
		System.out.println(Arrays.toString(playManListBean.getPlayMans().toArray()));
		System.out.println(cost);
		System.out.println(Arrays.toString(costExplainListBean.getCostExplains().toArray()));
		System.out.println(couponId);
		//查询用户信息
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		
		boolean flag = indentService.submitIndent(userId,indent,indentdetails,linkMan,playManListBean.getPlayMans(),cost,costExplainListBean.getCostExplains(),couponId);
		responseMap.put("success", flag);
		responseMap.put("indentId", indent.getId());
		responseMap.put("name",indent.getCommodity());
		responseMap.put("description",indent.getIndentdetails().getScenicway().getDescription());
		responseMap.put("money", grossAmount);
		return "view/product/indentSuccess";
	}
	
	/**
	 * 支付订单
	 */
	@ResponseBody
	@PostMapping("/indent/paymentIndent")
	public Map<String,Object> paymentIndent(@RequestParam Integer indentId,@RequestParam Integer pass,HttpServletRequest request){
		System.out.println("支付订单 indentId:"+indentId);
		//查询用户信息
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		Map<String,Object> map = indentService.paymentIndent(userId,pass,indentId);
		System.out.println("支付订单 map:"+map);
		return map;
	}
}
