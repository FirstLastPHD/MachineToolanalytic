package com.zps.machine.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Statement;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.helpers.CsvHelper;
import com.zps.machine.mathematic.Functions;
import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.SignalModel;
import com.zps.machine.service.SignalServiceImplementation;


@Controller
public class CSVController extends AbstractController {

	public CSVController() throws SQLException {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "allNodesCSV", method = RequestMethod.POST)
    public ModelAndView getCSV(HttpServletRequest request,
            HttpServletResponse response,@ModelAttribute("signalPref") SignalModel signals, Model model) throws Exception{
		
		
		
		model.addAttribute("signalPref", signals);
		if(stmt == null) {
			stmt  =  PsqlDBConfig.GetConnection();
		}

		System.out.println(" DB Connection: "+stmt.toString());
	/* Csv Helper */
	CsvHelper csvHelper = new CsvHelper();
	/* To musim dostat */	
	String rFileLink = "www.google.com";
		
	  List<Object> timestampDB = new ArrayList<Object>();
	  SignalServiceImplementation signalService = new SignalServiceImplementation();
      List<SignalModel> signalObjects =signalService.GetAllSignals( stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
      
      SignalModel signaValues1 = signalService.GetAllSignalValues(stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
      List<List<Object>> signalValues = signaValues1.getSignalValues();
      String[] nodesSignal = signalObjects.get(0).getSignalName().split(",");
	    
      if(signals.getSignal_writing_operations().contains("WriteNodeToCSV") == true) {
    	  //return odkaz
    	  rFileLink = csvHelper.WriteMatrixToCSV( nodesSignal, signalValues,"csv");
    	  csvHelper.doDownload(rFileLink, request, response);
      }else if(signals.getSignal_writing_operations().contains("WriteNodeToRDAT") == true) {
    	//return odkaz
    	  rFileLink = csvHelper.WriteMatrixToCSV( nodesSignal, signalValues,"rdat");
    	  csvHelper.doDownload(rFileLink, request, response);
    	  
      }else if(signals.getSignal_writing_operations().contains("WriteNodeToTXT") == true) {
    	//return odkaz
    	  rFileLink = csvHelper.WriteMatrixToCSV( nodesSignal, signalValues,"TXT");
    	  csvHelper.doDownload(rFileLink, request, response);
      }
      
      /* Vratit odkaz na soubor */
      
      System.out.println(" SignalValues size()..."+signalValues.size());
		 ModelAndView map = new ModelAndView("allNodesCSV");
		 map.addObject("rFileLink",rFileLink);
		return map;
	}

	
	}


