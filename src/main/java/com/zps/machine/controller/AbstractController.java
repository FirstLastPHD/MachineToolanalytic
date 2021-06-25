package com.zps.machine.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.mathematic.CalcPart1;
import com.zps.machine.mathematic.CalculateMetrix;
import com.zps.machine.mathematic.Functions;
import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.OpcMsrModel;
import com.zps.machine.model.SignalModel;
import com.zps.machine.service.DeviceServiceImplementation;
import com.zps.machine.service.OpcMsrServiceImplementation;
import com.zps.machine.service.SignalServiceImplementation;

@Controller
public abstract class AbstractController {
	
	 Statement stmt = null;
	 
	 
	 
	 public AbstractController() throws SQLException {
		 try {
	    
	    	if(stmt == null) {
		stmt  =  PsqlDBConfig.GetConnection();
	    	}
	    	
	    
		 }catch(Exception e) {}
	 }
	 
	

}
