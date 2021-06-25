package com.zps.machine.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.model.SignalModel;
import com.zps.machine.service.SignalServiceImplementation;

@Controller
public class SingleNodeCSVController extends AbstractController {
	
	
	private static final int BUFFER_SIZE = 4096;
	
	
	public SingleNodeCSVController() throws SQLException {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "singleNodeCSV", method = RequestMethod.POST)
    public ModelAndView getSingleCSV(HttpServletRequest request,
            HttpServletResponse response,@ModelAttribute("signalPref") SignalModel signals,Model model,
    		RedirectAttributes redirectAttributes) throws Exception{
		
		model.addAttribute("signalPref", signals);
		if(stmt == null) {
			stmt  =  PsqlDBConfig.GetConnection();
		}
		
		
		 ModelAndView map = new ModelAndView("singleNodeCSV");
		 
		 String rFileLink = "www.google.com";
		 
		 System.out.println(" signals.getSignalName(): "+signals.getSignalName());
		 List<Object> timestampDB = new ArrayList<Object>();
			SignalServiceImplementation signalService = new SignalServiceImplementation();
			List<SignalModel> signalObjects =signalService.GetAllSignals( stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
			  SignalModel signalValues1 =signalService.GetAllSignalValues(stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
		      List<List<Object>> signalValues = signalValues1.getSignalValues();
		      List<Object> calculateFrequencyVibr = signalValues.get(Integer.valueOf(signals.getSignalName()));
		      double[] signalFreqwVibr = new double[calculateFrequencyVibr.size()];
		      String[] nodesSignal = signalObjects.get(0).getSignalName().split(",");
		      String signalNode = nodesSignal[Integer.valueOf(signals.getSignalName())];
		     // int neurons_amount[]  = new int[signalFreqwVibr.length];
		      for(int i = 0; i < calculateFrequencyVibr.size(); i++) {
		    	  signalFreqwVibr[i] =Double.parseDouble(calculateFrequencyVibr.get(i).toString());
		    	  //neurons_amount[i] = Integer.valueOf(String.valueOf(signalFreqwVibr[i]*1000)); 
		    	  System.out.println(" Signal Value: "+signalFreqwVibr[i]);
		      }
		      
		      if(signals.getSignal_writing_operations().contains("WriteNodeToCSV") == true) {
		    	  //return odkaz
		    	  rFileLink =WriteMatrixToCSV( signalNode, calculateFrequencyVibr,"csv");
		    	  doDownload(rFileLink, request, response);
		      }else if(signals.getSignal_writing_operations().contains("WriteNodeToRDAT") == true) {
		    	//return odkaz
		    	  rFileLink = WriteMatrixToCSV( signalNode, calculateFrequencyVibr,"rdat");
		    	  doDownload(rFileLink, request, response);
		    	  
		      }else if(signals.getSignal_writing_operations().contains("WriteNodeToTXT") == true) {
		    	//return odkaz
		    	  rFileLink = WriteMatrixToCSV( signalNode, calculateFrequencyVibr,"TXT");
		    	  doDownload(rFileLink, request, response);
		      }
		      
		 
		return map;
	}
	/* Download File */
	public void doDownload(String filepath,HttpServletRequest request,
            HttpServletResponse response) throws IOException {
 
        // get absolute path of the application
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");
        System.out.println("appPath = " + appPath);
 
        // construct the complete absolute path of the file
        //String fullPath = appPath + filePath;    
		String fullPath = filepath;
        File downloadFile = new File(fullPath);
        FileInputStream inputStream = new FileInputStream(downloadFile);
         
        // get MIME type of the file
        String mimeType = context.getMimeType(fullPath);
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        System.out.println("MIME type: " + mimeType);
 
        // set content attributes for the response
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());
 
        // set headers for the response
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"",
                downloadFile.getName());
        response.setHeader(headerKey, headerValue);
 
        // get output stream of the response
        OutputStream outStream = response.getOutputStream();
 
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead = -1;
 
        // write bytes read from the input stream into the output stream
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
 
        inputStream.close();
        outStream.close();
 
    }
	
	/* Write to Csv Method */
	public String WriteMatrixToCSV(String signalNode, List<Object> calculateFrequencyVibr, String fileFormat) throws IOException {
		
		String filePath = "C:\\Users\\spravce\\eclipse-workspace\\WebDevAnalyticInterface\\"+signalNode+"."+fileFormat;
		FileWriter writer = new FileWriter(filePath);
		
		
		//writer.write(" Iteration, "+signalNode+"\n");
		//writer.write("+signalNode+"\n");
		writer.write(" Iteration, " +  "Rate\n");
		//Rate
		for (int i = 0; i < calculateFrequencyVibr.size(); i++) {
			writer.write(i+", " +calculateFrequencyVibr.get(i).toString()+"\n");
		}
		
		writer.flush();
		writer.close();
		
		
		return filePath;
	
	}
	

}




