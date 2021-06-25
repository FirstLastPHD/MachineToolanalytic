package com.zps.machine.controller;

import java.sql.SQLException;
import java.sql.Statement;
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

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.model.DeviceModel;
import com.zps.machine.service.DeviceServiceImplementation;

@Controller("IndexController")
public class IndexController extends AbstractController {

	public IndexController() throws SQLException {
		super();
		// TODO Auto-generated constructor stub
	}


	@Async
	@RequestMapping(value = "*", method = RequestMethod.GET)
	public ModelAndView showMachineTool(HttpServletRequest request,SessionStatus status, Model model) throws SQLException {
		
		
		/* Display devices to anouther controller and view */
		DeviceModel currentDevice = new DeviceModel();
		Map<Integer, String> devicesMap = new HashMap();
		Map<Integer, Integer> recordsCount = new HashMap();
		Map<Integer, Integer> machineStateMap = new HashMap();
		DeviceServiceImplementation deviceService = new DeviceServiceImplementation() ;
		if(stmt == null) {
			stmt  =  PsqlDBConfig.GetConnection();
		}
		List<DeviceModel> devicesList = deviceService.GetAllDevices(stmt);
		System.out.println(" Device List Size: "+devicesList);
		
		int dbRecords = deviceService.GetDBRecordsCount( stmt);
		recordsCount.put(dbRecords,dbRecords);
		System.out.println(" Device Record Count: "+dbRecords);
		if(devicesList.size()!= 0) {
			for(int i = 0; i < devicesList.size(); i++) {
				devicesMap.put(devicesList.get(i).getDev_id0(), devicesList.get(i).getDev_name());
				machineStateMap.put(devicesList.get(i).getDev_stat(), devicesList.get(i).getDev_stat());
			}
			System.out.println(" IndexController Working!!! ");
			model.addAttribute("deviceOptions", devicesMap);
			model.addAttribute("machineStOptions", machineStateMap);
			model.addAttribute("devicePref", currentDevice);
			model.addAttribute("dbRecordOptions", recordsCount);
			
			//model.addAttribute("machinePref", currentDevice);
		}
		ModelAndView map = new ModelAndView("index");
		map.addObject("dbRecords", dbRecords);
		return map;
		
	}
	
	

}
