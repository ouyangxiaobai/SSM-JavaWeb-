package com.szy.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.szy.entity.Subject;
import com.szy.entity.User;
import com.szy.entity.VoteType;
import com.szy.page.Page;
import com.szy.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView index(ModelAndView model){
		model.setViewName("admin/user/list");
		return model;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> add(User user){
		Map<String,Object> ret = new HashMap<String,Object>();
		if(isExist(user.getName(),null)){
			ret.put("type", "error");
			ret.put("msg", "用户名已经存在!");
			return ret;
		}
		user.setCreateTime(new Date(System.currentTimeMillis()));
		if(userService.add(user) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败!");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> edit(User user){
		Map<String,Object> ret = new HashMap<String,Object>();
		if(isExist(user.getName(),user.getId())){
			ret.put("type", "error");
			ret.put("msg", "用户名已经存在!");
			return ret;
		}
		if(userService.edit(user) <= 0){
			ret.put("type", "error");
			ret.put("msg", "修改失败!");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delete(String id){
		Map<String,Object> ret = new HashMap<String,Object>();
		try {
			if(userService.delete("(" + id + ")") <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("type", "error");
			ret.put("msg", "改主题下存在投票信息，无法删除，请先去删除投票选项!");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	@RequestMapping(value="/get_list",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> list(@RequestParam(value="name", required=false,defaultValue="") String name,
			Page page
			){
		Map<String,Object> queryMap = new HashMap<String,Object>();
		queryMap.put("name", "%" + name + "%");
		queryMap.put("startIndex", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		List<User> findByName = userService.findByName(queryMap);
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("total", userService.getTotalByName(queryMap));
		ret.put("rows", findByName);
		return ret;
	}
	
	private boolean isExist(String name,Long id){
		User user = userService.findUserByName(name);
		if(user == null){
			return false;
		}
		if(id != null && user.getId() == id.longValue())return false;
		return true;
	}
}
