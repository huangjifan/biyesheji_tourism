package com.znsd.tubaba.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.znsd.tubaba.entity.User;
import com.znsd.tubaba.mapper.UserMapper;
import com.znsd.tubaba.service.UserService;
import com.znsd.tubaba.service.UserrecordService;
import com.znsd.tubaba.util.VerificationCodeUtil;
import com.znsd.tubaba.utils.EmailHelper;
import com.znsd.tubaba.utils.SendMessage;

@Controller
public class UserController {
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserrecordService userrecordService;
	
	@GetMapping("/find/{id}")
	public @ResponseBody User findById(@PathVariable Integer id){
		return userMapper.findById(id);
	}
	
	//注册页面
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(HttpSession session) {
		session.removeAttribute("code");
		return "view/user/register";
	}
	//注册成功页面
	@RequestMapping("registerUser")
	public String registerUser() {
		return "view/user/registerUser";
	}
	
	//登陆页面
	@RequestMapping("login")
	public String login() {
		return "view/user/login";
	}
	
	//密码找回页面
	@RequestMapping("retrieve")
	public String retrieve() {
		return "view/user/retrievePassword";
	}
	
	//邮箱找回密码页面
	@RequestMapping("email")
	public String email() {
		return "view/user/emailRetrieve";
	}
	
	//邮箱发送成功页面
	@RequestMapping("emailRetrieveSuccess")
	public String emailRetrieveSuccess() {
		return "view/user/emailRetrieveSuccess";
	}
	
	//修改密码成功页面
	@RequestMapping("inEmailUpdatePassSuccess")
	public String inEmailUpdatePassSuccess() {
		return "view/user/inEmailUpdatePassSuccess";
	}
	
	//邮箱修改密码页面
	@RequestMapping("inEmailUpdatePass")
	public String inEmailUpdatePass(HttpServletRequest request,@RequestParam String email,@RequestParam String emailCode,Map<String,Object> map) {
		User user = userService.findByEmail(email);
		if(user.getEmailCode() != null && user.getEmailCode().equals(emailCode)) {
			map.put("emailCode", emailCode);
			request.setAttribute("email", email);
			return "view/user/inEmailUpdatePass";
		}
		return "redirect:index";
	}
	//跳转到主页
	@RequestMapping("index")
	public String index() {
		return "../index";
	}
	
	//手机找回密码页面
	@RequestMapping("iphone")
	public String phone() {
		return "view/user/iphoneRetrieve";
	}
	//普通用户登录
	@RequestMapping("/userLoginPost")
	public String userLoginPost(User user,HttpSession session,Map<String, Object> map) {
		User result=userService.userLoginPost(user.getUsername(), user.getUserpass());
		if (result!=null) {
			if (result.getType()==0) {
				session.setAttribute("user", result.getUsername());
				session.setAttribute("userid", result.getId());
				userService.updateUserstatusLoginTime(result.getId());
				map.put("error","");
				return "redirect:index";
			}
			else {
				map.put("error","此用户已停用，请重新注册登录");
				return "view/user/login";
			}
		}
		map.put("error","用户名或密码错误");
		return "view/user/login";
	}
	//普通用户登录(ajax提交)
	@ResponseBody
	@RequestMapping("/userLoginAjax")
	public String userLoginAjax(User user,HttpSession session) {
		User result=userService.userLoginPost(user.getUsername(), user.getUserpass());
		if (result!=null) {
			session.setAttribute("user", result.getUsername());
			session.setAttribute("userid", result.getId());
			userService.updateUserstatusLoginTime(result.getId());
			return "success";
		}
		return "error";
	}
	//退出登录
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("userid");
		return "view/user/login";
	}

	//用户手机动态登录/
	@RequestMapping("/userShoujiLogin")
	public String userShoujiLogin(@PathParam("yzm")String yzm,@PathParam("iphone")String iphone,HttpSession session,HttpServletResponse resp,Map<String, Object> map) throws IOException {
		User booliphone=userService.findByIphone(iphone);
		String codes=(String) session.getAttribute("code");
		if (booliphone!=null) {
			if (yzm.equals(codes)) {
				String userPhone ="";
				if(session.getAttribute("userPhone") != null) {
					userPhone = (String) session.getAttribute("userPhone");
				}
				if(userPhone.equals(iphone)) {
					if (booliphone.getType()==0) {
						session.setAttribute("user", booliphone.getUsername());
						session.setAttribute("userid", booliphone.getId());
						userService.updateUserstatusLoginTime(booliphone.getId());
						map.put("shoujierror", "");
						return "redirect:index";
					}
					else {
						map.put("error","此用户已停用，请重新注册登录");
						return "view/user/login";
					}
				}else {
					map.put("error", "验证码错误");
					return "view/user/login";
				}
				
			}
			else {
				map.put("shoujierror", "验证码错误");
				return "view/user/login";
			}
		}
		else {
			if (yzm.equals(codes)) {
				User user=new User();
				user.setIphone(iphone);
				user.setUsername(iphone);
				user.setType(0);
				Integer result=userService.addUser(user);
				if (result>0) {
					map.put("shoujierror", "");
					session.setAttribute("user", user.getIphone());
					session.setAttribute("userid", user.getId());
					userService.updateUserstatusLoginTime(booliphone.getId());
					map.put("shoujierror", "");
					return "redirect:index";
				}
				else {
					map.put("shoujierror", "登录失败");
					return "view/user/login";
				}
			}
			map.put("shoujierror", "验证码错误");
			return "view/user/login";
		}
		
	}
	//用户手机动态登录(ajax)
	@ResponseBody
	@RequestMapping("/userIphoneAjax")
	public Map<String,Object> userIphoneAjax(@PathParam("yzm")String yzm,@PathParam("iphone")String iphone,HttpSession session,HttpServletResponse resp) throws IOException {
		User booliphone=userService.findByIphone(iphone);
		Map<String,Object> resultMap=new HashMap<String,Object>(0);
		String codes=(String) session.getAttribute("code");
		if (booliphone!=null) {
			if (yzm.equals(codes)) {
				session.setAttribute("user", booliphone.getUsername());
				session.setAttribute("userid", booliphone.getId());
				resultMap.put("msg", "success");
			}
			else {
				resultMap.put("msg", "yzmerror");
			}
		}else {
			if (yzm.equals(codes)) {
				User user=new User();
				user.setIphone(iphone);
				user.setUsername(iphone);
				user.setType(0);
				Integer result=userService.addUser(user);
				if (result>0) {
					session.setAttribute("user", user.getIphone());
					session.setAttribute("userid", booliphone.getId());
					resultMap.put("msg", "success");
				}else {
					resultMap.put("msg", "error");
				}
			}else
				resultMap.put("msg", "yzmerror");
		}
		return resultMap;
	}

	
	//判断手机号是否重复
	@RequestMapping(value="/checkPhone",method=RequestMethod.GET)
	@ResponseBody
	public void checkPhone(HttpServletResponse response,@RequestParam String phone) throws IOException {
		User user = userService.findByIphone(phone);
		if(user != null) {
			response.getWriter().write("false");
		}else {
			response.getWriter().write("true");
		}
	}
	
	//判断邮箱是否重复
	@RequestMapping(value="/checkEmail",method=RequestMethod.GET)
	@ResponseBody
	public void checkEmail(HttpServletResponse response,@RequestParam String email) throws IOException {
		User user = userService.findByEmail(email);
		if(user != null) {
			response.getWriter().write("false");
		}else {
			response.getWriter().write("true");
		}
	}
	
	//获取图片验证码
	@RequestMapping(value="/code",method=RequestMethod.GET)
	@ResponseBody
	public void getCode(HttpSession session,HttpServletResponse response) throws IOException {
		 VerificationCodeUtil vcu = VerificationCodeUtil.Instance();  
		 InputStream inputStream = vcu.getImage();
		 session.setAttribute("random", vcu.getVerificationCodeValue());
		 OutputStream out =  response.getOutputStream();
		 int length = 0;
		 byte buffer[] = new byte[1024];
		 while((length = inputStream.read(buffer)) != -1){
			 out.write(buffer, 0, length);
		 }
		 out.flush();
		 out.close();
		 inputStream.close();
	}
	
	//判断图片验证码是否正确
	@RequestMapping(value="/checkCode",method=RequestMethod.GET)
	@ResponseBody
	public void checkCode(HttpServletRequest request,HttpServletResponse response,HttpSession session,@RequestParam("code") String code) throws IOException {
		/*String code = request.getParameter("code");*/
		String random = (String) session.getAttribute("random");
		if(random.equalsIgnoreCase(code)) {
			response.getWriter().write("true");
		}else {
			response.getWriter().write("false");
		}
	}
	
	//发送短信验证码
	@RequestMapping(value="/send_code",method=RequestMethod.GET)
	@ResponseBody
	public void send_code(HttpSession session,HttpServletResponse response,@RequestParam("phone") String phone) throws Exception {
		boolean flag = false;
		if(session.getAttribute("time") != null) {
			long time = (long) session.getAttribute("time");
			if((System.currentTimeMillis() - time) / 100 / 60 >= 10) {
				flag = true;
			}
		}else {
			flag = true;
		}
		if(flag) {//避免用户刷新页面之后继续发送短信
			StringBuffer buffer = new StringBuffer();
			Random random = new Random();
			for(int i = 0 ;i < 6 ;i++) {
				buffer.append(random.nextInt(10));
			}
			boolean bool=false;
			try {
				bool=SendMessage.sendCode(phone, buffer.toString());
			} catch (IOException e) {
				response.getWriter().write("connection");
			}
			if(bool) {
				System.out.println("code:"+buffer.toString());
				session.setAttribute("code", buffer.toString());
				session.setAttribute("time", System.currentTimeMillis());
				session.setAttribute("userPhone", phone);
				response.getWriter().write("true");
			}else {
				response.getWriter().write("false");
			}
		}else {
			response.getWriter().write("false");
		}
		
	}
	
	//验证手机短信
	@RequestMapping(value="/checkPhoneCode",method=RequestMethod.GET)
	@ResponseBody
	public void checkPhoneCode(HttpSession session,HttpServletResponse response,@RequestParam("code") String code,@RequestParam("phone")String phone) throws IOException {
		if(session.getAttribute("code") != null) {
			String code_session = (String) session.getAttribute("code");
			Long time = (Long) session.getAttribute("time");
			if((System.currentTimeMillis() - time) / 100 / 60 >= 10) {
				response.getWriter().write("1"); //1代表时间已过期
			}else if(code_session.trim().equalsIgnoreCase(code)) {
				/*session.removeAttribute("time");
				session.removeAttribute("code");*/
				String userPhone ="";
				if(session.getAttribute("userPhone") != null) {
					userPhone = (String) session.getAttribute("userPhone");
				}
				if(userPhone.equals(phone)) {
					response.getWriter().write("2"); //2代表验证码正确  验证通过
				}else {
					response.getWriter().write("4"); //4手机号码与验证码不匹配
				}
			}else {
				response.getWriter().write("3"); //3代表验证码错误  验证不通过
			}
		}else {
			response.getWriter().write("0"); //0代表未发送短信就验证
		}
	}
	
	//删除session的验证码
	@ResponseBody
	@GetMapping("removeCode")
	public Map<String,Object> removeCode(HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		session.removeAttribute("time");
		session.removeAttribute("code");
		map.put("result", true);
		return map;
	}
	
	//注册用户提交
	@RequestMapping(value="registerUser",method=RequestMethod.POST)
	public String registerUser(@RequestParam("mobile") String phone,@RequestParam("password") String password) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		for(int i = 0 ;i < 10 ;i++) {
			buffer.append(random.nextInt(10));
		}
		User user = new User();
		user.setIphone(phone);
		user.setUserpass(password);
		/*user.setBirthday(new Date());*/
		user.setUsername(buffer.toString());
		user.setType(0);
		Integer result = userService.addUser(user);
		if(result > 0) {
			return "view/user/registerUser";
		}else {
			return "view/user/register";
		}
	}
	
	
	//手机找回密码提交,通过手机号码修改密码
	@RequestMapping(value="phoneUpdatePassword",method=RequestMethod.PUT)
	public String phoneUser(@RequestParam("mobile")String phone,@RequestParam("password")String password) {
		Integer result = userService.inPhoneUpdatePass(phone, password);
		if(result > 0) {
			return "redirect:login";
		}
		return "redirect:login";
	}
	
	//邮箱找回密码邮件发送 -- 发送邮箱给用户,用户通过邮箱中的页面才修改密码
	@RequestMapping(value="emailSubmit",method=RequestMethod.GET)
	public String emailSubmit(@RequestParam("txtUsername") String email,HttpSession session) {
		EmailHelper helper=new EmailHelper();
		User user = userService.findByEmail(email);
		String emailCode = "";
		if(user.getEmailCode() != null) {
			emailCode = user.getEmailCode();
		}else {
			Random random = new Random();
			for(int i = 0 ;i < 6 ;i++) {
				emailCode += random.nextInt(10);
			}
			userService.updateUserEmailCode(emailCode, email);
		}
		try {
			String from = "1209237719@qq.com";
			String to = email;
			String title = "兔爸爸旅游网";
			String context = "<table bgcolor=\"#F2F2F2\" style=\"margin:0 auto;\">\r\n" + 
					"		<tbody><tr>\r\n" + 
					"			<td style=\"border-top:3px solid #D30085\">\r\n" + 
					"				<img src=\"http://pic.lvmama.com/img/new_v/ob_login/sm_logoall.jpg\">\r\n" + 
					"			</td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td style=\"font-size:14px;color:#565656;text-align:left;\">\r\n" + 
					"				<table style=\"background-color:#ffffff;border:1px solid #d8d8d8;margin:5px;width:626px\">\r\n" + 
					"					<tbody><tr>\r\n" + 
					"						<td style=\"background-color:#ffffff;font-size:14px;padding:30px 10px 20px 40px;color:#565656\">\r\n" + 
					"							<p style=\"margin:0px;margin-bottom:18px;\">亲爱的<label style=\"font-weight:bold;color:#bd0059;font-size:16px;font-family:arial\">"+email+"</label>，您好！</p>\r\n" + 
					"							<p style=\"margin:0px;margin-bottom:20px;font-weight:bold;\">您申请了重置密码，设置新密码成功后，您可以使用新密码登录。</p>\r\n" + 
					"							<p style=\"margin:0px;margin-bottom:5px;\">请点击下面的按钮设置新密码：</p>\r\n" + 
					"							<a href=\"http://localhost:1001/inEmailUpdatePass?email="+email+"&emailCode="+emailCode+"\" target=\"_blank\" style=\"display:inline-block;width:112px;height:35px;margin-bottom:3px;\" rel=\"noopener\"><img src=\"http://pic.lvmama.com/img/new_v/ob_login/sm_email_btn.jpg\" style=\"border:none\"></a>\r\n" + 
					"							<p style=\"margin:0px\"><a href=\"http://localhost:1001/inEmailUpdatePass?email="+email+"&emailCode="+emailCode+"\" target=\"_blank\" style=\"color:#0066cc\" rel=\"noopener\">http://localhost:1001/inEmailUpdatePass</a></p>\r\n" + 
					"							<p style=\"margin:0px;margin:5px 0;color:#8f8f8f\">(如果点击链接无效，您可以直接复制到浏览器地址栏访问)</p>\r\n" + 
					"							<p style=\"margin:0px;font-weight:bold;margin-top:20px;margin-bottom:5px\">友情提示：</p>\r\n" + 
					"							<p style=\"margin:0px;line-height:16px;margin:3px 0 15px 0\">为了保障您的账户安全，你可以<a href=\"http://localhost:1001/login\" target=\"_blank\" style=\"color:#0066cc\" rel=\"noopener\">绑定手机</a>，通过短信的方式接收密码，绑定手机并验证\r\n" + 
					"							</p><p style=\"margin:0px;margin-bottom:15px;\">如果您并未请求重置密码，请忽略本邮件。</p>\r\n" + 
					"						</td>\r\n" + 
					"					</tr>\r\n" + 
					"				</tbody></table>\r\n" + 
					"			</td>\r\n" + 
					"		</tr>\r\n" + 
					"	</tbody></table>"
					+ "<table width=\"600\" style=\"margin:10px auto 0 auto;font-family:arial;\">\r\n" + 
					"		<tbody><tr>\r\n" + 
					"			<td style=\"color:#888888;margin-top:15px;margin-bottom:20px;text-align:center;font-size:12px;line-height:20px;\">\r\n" + 
					"				为了确保我们的信息不被当作垃圾邮件处理，请把兔爸爸 <a href=\"mailto:1209237719@qq.com\" style=\"color:#0066CC;\">1209237719@qq.com</a> 添加为您的联系人<br>\r\n" + 
					"			本邮件由系统自动发出，请勿直接回复，如有疑问，请拨打24小时客服服务热线：<b>1010-6060</b><br>\r\n" + 
					"			Copyright 2012 http://localhost:1001/index.jsp，上海景域文化传播有限公司版权所有	\r\n" + 
					"			</td>\r\n" + 
					"		</tr>\r\n" + 
					"	</tbody></table>";
			helper.send(from, to, title, context);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:email";
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:email";
		}
		session.setAttribute("txtUsername", email);
		return "redirect:emailRetrieveSuccess";
	}
	
	//邮箱修改密码提交
	@RequestMapping(value="emailUpdatePassword")
	public String emailUpdatePassword(@RequestParam String email,@RequestParam String password,@RequestParam String emailCode) {
		User user = userService.findByEmail(email);
		if(user.getEmailCode() != null && user.getEmailCode().equals(emailCode)) {
			Integer result = userMapper.inEmailUpdatePass(email, password);
			userService.updateUserEmailCode(null, email);
			if(result > 0) {
				return "redirect:inEmailUpdatePassSuccess";
			}
		}
		return "redirect:index";
	}
	//判断用户是否登录
	@ResponseBody
	@GetMapping("/isLogin")
	public String isLogin(HttpSession session){
		if(session.getAttribute("userid")!=null)
			return "success";
		else
			 return "error";
	}
	
	//修改用户的支付密码
	@ResponseBody
	@RequestMapping(value="updateUserPaymentCode")
	public Map<String,Object> updateUserPaymentCode(@RequestParam Integer id,@RequestParam Integer paymentCode){
		Integer result = userService.updateUserPaymentCode(id, paymentCode);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", result);
		return map;
	}
	
	//通过用户id查询用户支付密码
	@ResponseBody
	@GetMapping("findByUserPaymentCode")
	public Map<String,Object> findByUserPaymentCode(@RequestParam Integer id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("paymentCode", userService.findByUserPaymentCode(id));
		return map;
	} 
	
	//修改用户账户金额(充值,提现)
	@ResponseBody
	@PostMapping("updateUserMoney")
	public Map<String,Object> updateUserMoney(@RequestParam Integer id,@RequestParam Double money,@RequestParam String phone,@RequestParam Integer status) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		boolean flag = userService.updateUserMoney2(id, money, phone, status);
		map.put("result", flag);
		return map;
		
	}
	
	//判断密码是否正确
	@ResponseBody
	@GetMapping("checkUserPass")
	public Map<String,Object> checkUserPass(@RequestParam String password,@RequestParam Integer userId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", userService.checkUserPass(userId, password));
		return map;
	}
	
	//修改用户密码
	@ResponseBody
	@GetMapping("updateUserPass")
	public Map<String,Object> updateUserPass(@RequestParam String password,@RequestParam Integer userId){
		Map<String,Object> map  = new HashMap<String,Object>();
		map.put("result", userService.updateUserPass(userId, password));
		return map;
	}
	
	//修改用户手机
	@PostMapping("updateUserIphone")
	public String updateUserIphone(String mobile,Integer userId){
		userService.updateUserIphone(userId, mobile);
		return "redirect:securitySettings";
	}
	
	//修改邮箱时的发送邮箱
	@ResponseBody
	@GetMapping("sendEmailCode")
	public Map<String,Object> sendEmailCode(HttpSession session,String email){
		boolean flag = false;
		if(session.getAttribute("emailTime") != null) {
			long time = (long) session.getAttribute("emailTime");
			if((System.currentTimeMillis() - time) / 100 / 60 >= 10) {
				flag = true;
			}
		}else {
			flag = true;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		if(flag) {
			EmailHelper helper=new EmailHelper();
			StringBuffer buffer = new StringBuffer();
			Random random = new Random();
			for(int i = 0 ;i < 6 ;i++) {
				buffer.append(random.nextInt(10));
			}
			try {
				String from = "1209237719@qq.com";
				String to = email;
				String title = "兔爸爸旅游网";
				String context = "<table bgcolor=\"#F2F2F2\" style=\"margin:0 auto;\">\r\n" + 
						"		<tbody><tr>\r\n" + 
						"			<td style=\"border-top:3px solid #D30085;text-align:center\">\r\n" + 
						"				<img src=\"http://pic.lvmama.com/img/new_v/ob_login/sm_logoall.jpg\">\r\n" + 
						"			</td>\r\n" + 
						"		</tr>\r\n" + 
						"		<tr>\r\n" + 
						"			<td style=\"font-size:14px;color:#565656;text-align:left\">\r\n" + 
						"					<table style=\"background-color:#ffffff;border:1px solid #d8d8d8;margin:5px;width:626px\">\r\n" + 
						"						<tbody><tr>\r\n" + 
						"							<td style=\"font-size:14px;color:#565656;\">\r\n" + 
						"								<p style=\"margin-bottom:15px;margin-top:20px;margin-left:30px;\">亲爱的<label style=\"font-weight:bold;color:#bd0059;font-size:16px;font-family:arial\"><span style=\"border-bottom:1px dashed #ccc;z-index:1\" t=\"7\" onclick=\"return false;\" data="+email+">"+email+"</span></label>，您好！</p>\r\n" + 
						"								<p style=\"margin-left:30px;display:block;margin-bottom:15px;\">\r\n" + 
						"									<span style=\"display:block;width:90%;line-height:22px;margin-bottom:15px;\">\r\n" + 
						"										您申请了修改邮箱，修改邮箱后，可以使用新邮箱地址登录。原来的邮箱地址将不能用来登录。 <br>\r\n" + 
						"									</span>\r\n" + 
						"									<label>请在效验码输入框中输入：<label style=\"font-weight:bold;color:#bd0059;font-size:16px;font-family:arial\">"+buffer+"</label>，以完成操作。</label>\r\n" + 
						"								</p>\r\n" + 
						"								\r\n" + 
						"							</td>\r\n" + 
						"						</tr>\r\n" + 
						"					</tbody></table>\r\n" + 
						"				<br>\r\n" + 
						"			</td>\r\n" + 
						"		</tr>\r\n" + 
						"	</tbody></table>"
						+ "<table width=\"600\" style=\"margin:10px auto 0 auto;font-family:arial\">\r\n" + 
						"		<tbody><tr>\r\n" + 
						"			<td style=\"color:#888888;margin-top:15px;margin-bottom:20px;text-align:center;font-size:12px;line-height:20px;\">\r\n" + 
						"				为了确保我们的信息不被当作垃圾邮件处理，请把兔爸爸 <a href=\"mailto:1209237719@qq.com\" style=\"color:#0066CC;\" rel=\"noopener\" target=\"_blank\">1209237719@qq.com</a> 添加为您的联系人<br>\r\n" + 
						"			本邮件由系统自动发出，请勿直接回复，如有疑问，请拨打24小时客服服务热线：<b>1010-6060</b><br>\r\n" + 
						"			Copyright 2012 <a href=\"http://www.lvmama.com\" rel=\"noopener\" target=\"_blank\">index</a>，上海景域文化传播有限公司版权所有	\r\n" + 
						"			</td>\r\n" + 
						"		</tr>\r\n" + 
						"	</tbody></table>";
				helper.send(from, to, title, context);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				map.put("result", false);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				map.put("result", false);
			}
			session.setAttribute("emailCode", buffer.toString());
			session.setAttribute("emailTime", System.currentTimeMillis());
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	//验证邮箱验证码
	@RequestMapping(value="/checkEmailCode",method=RequestMethod.GET)
	@ResponseBody
	public void checkEmailCode(HttpSession session,HttpServletResponse response,@RequestParam("emailCode") String emailCode) throws IOException {
		if(session.getAttribute("emailCode") != null) {
			String code_session = (String) session.getAttribute("emailCode");
			Long time = (Long) session.getAttribute("emailTime");
			if((System.currentTimeMillis() - time) / 100 / 60 >= 10) {
				response.getWriter().write("1"); //1代表时间已过期
			}else if(code_session.trim().equalsIgnoreCase(emailCode)) {
				/*session.removeAttribute("time");
				session.removeAttribute("code");*/
				response.getWriter().write("2"); //2代表验证码正确  验证通过
			}else {
				response.getWriter().write("3"); //3代表验证码错误  验证不通过
			}
		}else {
			response.getWriter().write("0"); //0代表未发送短信就验证
		}
	}
	
	//修改用户邮箱
	@PostMapping("updateUserEmail")
	public String updateUserEmail(String email,Integer userId) {
		userService.updateUserEmail(email, userId);
		return "redirect:securitySettings";
	}
	
	//删除邮箱session的验证码
	@ResponseBody
	@GetMapping("removeEmailCode")
	public Map<String,Object> removeEmailCode(HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		session.removeAttribute("emailTime");
		session.removeAttribute("emailCode");
		map.put("result", true);
		return map;
	}
	
	//判断用户支付密码是否正确
	@ResponseBody
	@GetMapping("checkUserPaymentCode")
	public Map<String,Object> checkUserPaymentCode(@RequestParam("userId")Integer userId,@RequestParam("paymentCode")Integer paymentCode){
		Map<String,Object> map = new HashMap<String,Object>();
		Integer result = userService.checkUserPaymentCode(userId, paymentCode);
		if(result > 0) {
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	//注销用户
	@ResponseBody
	@PostMapping("logoutUser")
	public Map<String,Object> logoutUser(@RequestParam("type") Integer type,@RequestParam("userId") Integer userId,@RequestParam("logoutWhy")String logoutWhy) {
		System.out.println("type:"+type);
		System.out.println("userId:"+userId);
		System.out.println("logoutWhy:"+logoutWhy);
		Map<String,Object> map = new HashMap<String,Object>();
		Integer result = userService.deleteUser(type, userId,logoutWhy);
		if(result > 0) {
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	
	/**
	 * 检查用户余额是否充足
	 * @param money 付款金额
	 * @return 返回用户是否可以支付成功
	 */
	@ResponseBody
	@GetMapping("/user/isMoneyTrue")
	public Map<String,Object> isMoneyTrue(@RequestParam("money") Double money,HttpServletRequest request){
		Integer userId = (Integer) request.getSession().getAttribute("userid");
		User user = userService.findById(userId);
		Map<String,Object> map = new HashMap<String,Object>();
		boolean flag = true;
		if(user != null && user.getMoney() < money) {
			flag = false;
		}
		map.put("success", flag);
		return map;
	}
}
