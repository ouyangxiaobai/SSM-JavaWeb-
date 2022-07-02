package com.szy.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.szy.entity.Vote;
import com.szy.page.Page;
import com.szy.service.SubjectItemService;
import com.szy.service.SubjectService;
import com.szy.service.VoteService;

@Controller
@RequestMapping("/admin/vote")
public class AdminVoteController {
	
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private SubjectItemService subjectItemService;
	@Autowired
	private VoteService voteService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView index(ModelAndView model){
		model.setViewName("admin/vote/list");
		return model;
	}
	
	@RequestMapping(value="/get_list",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> list(@RequestParam(value="username", required=false,defaultValue="") String username,
			@RequestParam(value="subjectName", required=false,defaultValue="") String subjectName,
			@RequestParam(value="subjectItemTitle", required=false,defaultValue="") String subjectItemTitle,
			Page page
			){
		Map<String,Object> queryMap = new HashMap<String,Object>();
		queryMap.put("username", "%" + username + "%");
		queryMap.put("subjectName", "%" + subjectName + "%");
		queryMap.put("subjectItemTitle", "%" + subjectItemTitle + "%");
		queryMap.put("startIndex", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		List<Vote> findByName = voteService.findList(queryMap);
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("total", voteService.getTotal(queryMap));
		ret.put("rows", findByName);
		return ret;
	}
	
}
