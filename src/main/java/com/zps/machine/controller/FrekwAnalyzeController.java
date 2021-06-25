package com.zps.machine.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;



@Controller("FreqwAnalyzeController")
public class FrekwAnalyzeController {
	
	public FrekwAnalyzeController() throws SQLException {
		super();
	}
	
	@Async
	@RequestMapping(value = "/freqwAnalyze", method = RequestMethod.POST)
	public ModelAndView showFrekwAnalyze(HttpServletRequest request,SessionStatus status, Model model) throws SQLException {
		
		
		
		ModelAndView map = new ModelAndView("freqwAnalyze");
		
		
		return map;
		
	}

}
