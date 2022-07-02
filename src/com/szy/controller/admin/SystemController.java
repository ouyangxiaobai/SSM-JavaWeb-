package com.szy.controller.admin;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.szy.entity.Manager;
import com.szy.service.ManagerService;
import com.szy.util.CpachaUtil;

@Controller
@RequestMapping("/system")
public class SystemController {
	
	@Autowired
	private ManagerService managerService;
	
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView index(ModelAndView model){
		model.setViewName("system/index");
		return model;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView login(ModelAndView model){
		model.setViewName("system/login");
		return model;
	}
	
	@RequestMapping(value="/login_out",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest request){
		request.getSession().setAttribute("manager", null);
		return "redirect:login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> loginAct(@RequestParam(value="username", required=true) String username,
			@RequestParam(value="password", required=true) String password,
			@RequestParam(value="vcode", required=true) String vcode,
			HttpServletRequest request){
		Map<String,String> ret = new HashMap<String,String>();
		if(StringUtils.isEmpty(username)){
			ret.put("type", "error");
			ret.put("msg", "用户名不能为空！");
			return ret;
		}
		if(StringUtils.isEmpty(password)){
			ret.put("type", "error");
			ret.put("msg", "密码不能为空！");
			return ret;
		}
		if(StringUtils.isEmpty(vcode)){
			ret.put("type", "error");
			ret.put("msg", "验证码不能为空！");
			return ret;
		}
		Object attribute = request.getSession().getAttribute("loginCapcha");
		if(attribute == null){
			ret.put("type", "error");
			ret.put("msg", "长时间未操作，请刷新页面！");
			return ret;
		}
		if(!vcode.toUpperCase().equals(attribute.toString().toUpperCase())){
			ret.put("type", "error");
			ret.put("msg", "验证码错误！");
			return ret;
		}
		Manager manager = managerService.findByName(username);
		if(manager == null){
			ret.put("type", "error");
			ret.put("msg", "不存在该用户！");
			return ret;
		}
		if(!password.equals(manager.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "密码错误！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "登录成功");
		//销毁验证码
		request.getSession().setAttribute("loginCapcha",null);
		//将登录用户放入session
		request.getSession().setAttribute("manager",manager);
		return ret;
	}
	
	@RequestMapping(value="/get_cpacha",method=RequestMethod.GET)
	public void getCpacha(@RequestParam(value="type", required=false,defaultValue="adminLogin") String type,
			@RequestParam(value="w", required=false,defaultValue="98") int width,
			@RequestParam(value="h", required=false,defaultValue="33") int height,
			@RequestParam(value="cl", required=false,defaultValue="4") int codeLength,
			HttpServletRequest request,
			HttpServletResponse reponse){
		CpachaUtil cpachaUtil = new CpachaUtil(codeLength,width,height);
		String generatorVCode = cpachaUtil.generatorVCode();
		request.getSession().setAttribute("loginCapcha", generatorVCode);
		BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
		try {
			ImageIO.write(generatorRotateVCodeImage, "gif", reponse.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
