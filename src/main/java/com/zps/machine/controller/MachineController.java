package com.zps.machine.controller;


import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.json.simple.parser.ParseException;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.model.DeviceModel;
import com.zps.machine.model.OpcMsrModel;
import com.zps.machine.service.DeviceServiceImplementation;
import com.zps.machine.service.OpcMsrServiceImplementation;


@Controller
public class MachineController extends AbstractController {
	
	
	 public MachineController() throws SQLException {
		super();
		// TODO Auto-generated constructor stub
	}


	@Async
	//@RequestMapping(value = "/device", method = RequestMethod.GET)
	@RequestMapping(value = "/device", method = RequestMethod.POST)
	public ModelAndView showDevice(SessionStatus status, Model model,
    		@ModelAttribute("devicePref") DeviceModel device,
    		RedirectAttributes redirectAttributes) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException {
		
		/* Display devices to anouther controller and view */
		OpcMsrServiceImplementation opcMsrService = new OpcMsrServiceImplementation() ;
		OpcMsrModel mainObjectModel = new OpcMsrModel();
		OpcMsrModel mainObjectModel1 = new OpcMsrModel();
		Map<String, String> pcaStateMap = new HashMap();
		Map<Integer, Integer> machineStateMap = new HashMap();
		Map<String, String> timeFromMap = new HashMap();
		Map<String, String> timeToMap = new HashMap();
		Map<Integer, Integer> devicesMapMSR = new HashMap();
		
		int deviceFrom = device.getStartRange();
		int deviceTo = device.getEndRange();
		/* Tady je zmanana logika !!!!!!!! */
		/* When Local DB is Used */
		//int dataRange2TO = device.getStartRange() + 1000;
		// End 
		/* When Real Server is Used */
		int dataRange2TO = device.getStartRange() + 30000;
		//end
		String machineNumb = "\'"+String.valueOf(device.getDev_id0())+"\'";
		String dataRangeFrom = "\'"+String.valueOf(device.getStartRange())+"\'";
		String dataRangeTo = "\'"+String.valueOf(dataRange2TO)+"\'";
		int dbRecordsCount =  device.getRecordCount();
		
         List<OpcMsrModel> opcMsrList = opcMsrService.GetOpcMsrObject(stmt,  machineNumb , dataRangeFrom, dataRangeTo );
		
		 List<OpcMsrModel> opcPCAStateList = opcMsrService.getPCAState();
		//String dataRangeTo = "\'"+String.valueOf(device.getEndRange())+"\'";
		if(device.getStartRange()>0 && device.getStartRange() <dbRecordsCount && 
		/*Integer.valueOf(dataRangeTo)>Integer.valueOf(dataRangeFrom) && Integer.valueOf(dataRangeTo) <dbRecordsCount &&*/
		dataRange2TO < dbRecordsCount && opcMsrList.size()> 0) { 
		
		// Add Data range from and data range to count controll,
		if(opcPCAStateList.size() != 0) {
			for(int i = 0; i < opcPCAStateList.size(); i++ ) {
				pcaStateMap.put(opcPCAStateList.get(i).getPcaState(),opcPCAStateList.get(i).getPcaState());
			}
			
			model.addAttribute("pcaStateOptions", pcaStateMap);
		}
		/* Change logic here */
		List<Timestamp> timestamps = new ArrayList<Timestamp>();
		if(device.getStartRange()>0 && device.getStartRange() <dbRecordsCount && 
				/*Integer.valueOf(dataRangeTo)>Integer.valueOf(dataRangeFrom) && Integer.valueOf(dataRangeTo) <dbRecordsCount &&*/
				dataRange2TO < dbRecordsCount && opcMsrList.size() > 0) {
			for(int i = 0; i < opcMsrList.size(); i++ ) {
				//timeFromMap.put(opcMsrList.get(i).getMsr_txdt(), opcMsrList.get(i).getMsr_txdt());
				//timeToMap.put(opcMsrList.get(i).getMsr_txdt(), opcMsrList.get(i).getMsr_txdt());
				timestamps.add(Timestamp.valueOf(opcMsrList.get(i).getMsr_txdt()));
			}
			
			final Timestamp maxDate = timestamps.stream()
				    .max(Timestamp::compareTo)
				    .get();
			
			final Timestamp minDate = timestamps.stream()
				    .min(Timestamp::compareTo)
				    .get();
			
			timeFromMap.put(minDate.toString(), minDate.toString());
			timeToMap.put(maxDate.toString(), maxDate.toString());
			//timestamps.sort(c);
			//Timestamp ts = Timestamp.valueOf(newDateString);
			//try (Writer writer = new BufferedWriter(new OutputStreamWriter(
		              //new FileOutputStream("Timestamps.txt"), "utf-8"))) {
				//for(int i = 0; i <timestamps.size(); i ++) {
		   //writer.write(timestamps.get(i).toString());
				//}
				//writer.write(maxDate.toString()+ " --:-- "+minDate.toString());
		    //}
			
			devicesMapMSR.put(device.getDev_id0(), device.getDev_id0());
			
			
			machineStateMap.put(device.getDev_stat(),device.getDev_stat());
			model.addAttribute("deviceMsrOptions", devicesMapMSR);
			model.addAttribute("timeStampFromOptions", timeFromMap);
			model.addAttribute("timeStampToOptions", timeToMap);
			model.addAttribute("timeStampPref", mainObjectModel);
			model.addAttribute("timeStampToPref", mainObjectModel1);
			model.addAttribute("machineStateOptions", machineStateMap);
		}
		
		
		
	
		List<Object>signalOperationList = new ArrayList<Object>();
		signalOperationList.add(" VibroDiagnostic ");
		signalOperationList.add(" SFFT ");
		signalOperationList.add(" PoluynomFit ");
		signalOperationList.add(" Sikness ");
		
		ModelAndView map = new ModelAndView("device");
		
		
		double[][] pcaMatrix = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}};
		double[] pca1 = pcaMatrix[0];
		double[] pca2 = pcaMatrix[1];
	    map.addObject("opcMsrList", opcMsrList);
	   
		map.addObject("pca1", pca1);
		map.addObject("pca2", pca2);
		
		map.addObject("signalOperationList", signalOperationList);
		
		map.addObject("deviceFrom", deviceFrom);
		map.addObject("deviceTo", deviceTo);
		map.addObject("device",device);
		
		return map;}
		else {
			ModelAndView map = new ModelAndView("404");
			return map;
		}
	}
	
	

}
