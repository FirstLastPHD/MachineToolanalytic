package com.zps.machine.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.helpers.CsvHelper;
import com.zps.machine.mathematic.CalcPart1;
import com.zps.machine.mathematic.CalculateMetrix;
import com.zps.machine.mathematic.Functions;
import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.DeviceModel;
import com.zps.machine.model.OpcMsrModel;
import com.zps.machine.model.SignalModel;
import com.zps.machine.service.OpcMsrServiceImplementation;
import com.zps.machine.service.SignalServiceImplementation;

@Controller
public class SpectrogramController extends AbstractController {
	
	
	public SpectrogramController() throws SQLException {
		super();
		// TODO Auto-generated constructor stub
	}

	//Mapping to device page 
	@RequestMapping(value = "/spectrogram", method = RequestMethod.POST)
    public ModelAndView getDevices(Model model,
    		@ModelAttribute("timeStampPref") OpcMsrModel times,
    		@ModelAttribute("devicePref") DeviceModel devices,
    		RedirectAttributes redirectAttributes) throws Exception{
		
        
        model.addAttribute("timeStampPref", times);
        model.addAttribute("devicePref", devices);
        List<Object> timestampDB = new ArrayList<Object>();
        OpcMsrServiceImplementation opcMsrService = new OpcMsrServiceImplementation() ;
        SignalServiceImplementation signalService = new SignalServiceImplementation();
        Map<String, String> timeStampFromMap = new HashMap();
        Map<String, String> timeStamToMap = new HashMap();
        Map<String, String> deviceIdMap = new HashMap();
        Map<String, String> signalOperationsMap = new HashMap();
        Map<String, String> signalAxesOperationsMap = new HashMap();
        Map<String, String> writeSignalObjectMap = new HashMap();
        Map<String, String> writeMAxesObjectMap = new HashMap();
        Map<List<List<Object>>, List<List<Object>>> signalFullObjectMap = new HashMap();
        Map<Integer, String> signalMap = new HashMap(); 
        Map<String, String> testStringMap = new HashMap();
        List<Object> nodeObjects = null;
        SignalModel currentSignal = new SignalModel();
        SignalFrimework signalFrimework = new SignalFrimework();
        SignalFrimework signalFrimework1 = new SignalFrimework();
        Functions functions = new Functions();
        CalcPart1 calc1 = new CalcPart1();
        double[] arrayEigenValue = new double[0];
        double[][] eigneVectors = new double[0][0];
        CalculateMetrix metrix = new CalculateMetrix();
        
        
      /**** Mapping object here ****/
        /*String machineToolNumber = "2";
    	String timestampPoint1 = "'2019-12-11 09:42:20.638'";
        String timestampPoint2 = "'2019-12-11 09:55:10.829'";*/
      System.out.println("PCA State: "+times.getPcaState());
      
      String[] timesArr = times.getMsr_txdt().split(",");
      int device_id = times.getDev_id0();
      int dev_state = times.getDev_state();
      String timestampFrom = timesArr[0];
      String timestamoTo = timesArr[1];	  
      String machineToolNumber = String.valueOf(device_id);
      String timestampPoint1 ="\'"+ timestampFrom+"\'";
      String timestampPoint2 ="\'"+ timestamoTo+"\'";
      // Controlling for equality timestamp Value
      
      timeStampFromMap.put(timestampPoint1,timestampPoint1) ;
      timeStamToMap.put(timestampPoint2,timestampPoint2) ;
      deviceIdMap.put(machineToolNumber, machineToolNumber) ;
      signalOperationsMap.put("Full", "Full");
      signalOperationsMap.put("AnalysisSpectral", "AnalysisSpectral");
      signalOperationsMap.put("VibrodiagnostiAnalysis", "VibrodiagnosticAnalysis");
      signalOperationsMap.put("EnergyDiagnostic", "EnergyDiagnostic");
      model.addAttribute("machineToolOptions", deviceIdMap);
      model.addAttribute("timeFromOptions", timeStampFromMap);
      model.addAttribute("timeToOptions", timeStamToMap);
      model.addAttribute("signalOperationsOptions", signalOperationsMap);
      /* Operations with Multiple Axseses pripad kdy vybiram signaly */
      signalAxesOperationsMap.put("CalculatePCA", "CalculatePCA");
      signalAxesOperationsMap.put("DrawGraphs", "DrawGraphs");
      signalAxesOperationsMap.put("Full", "Full");
      signalAxesOperationsMap.put("AnalysisSpectral", "AnalysisSpectral");
      signalAxesOperationsMap.put("VibrodiagnostiAnalysis", "VibrodiagnosticAnalysis");
      signalAxesOperationsMap.put("EnergyDiagnostic", "EnergyDiagnostic");
      model.addAttribute("chooseAxesSignalOperations", signalAxesOperationsMap);
      
      writeSignalObjectMap.put("WriteNodeToCSV", "WriteNodeToCSV");
      writeSignalObjectMap.put("WriteNodeToTXT", "WriteNodeToTXT");
      writeSignalObjectMap.put("WriteNodeToRDAT", "WriteNodeToRDAT");
      model.addAttribute("writingNodeOptions", writeSignalObjectMap);
      
      /*Multiple Axes Writing Object Map*/
      writeMAxesObjectMap.put("NotWrite", "NotWrite");
      writeMAxesObjectMap.put("WriteNodeToCSV", "WriteNodeToCSV");
      writeMAxesObjectMap.put("WriteNodeToTXT", "WriteNodeToTXT");
      writeMAxesObjectMap.put("WriteNodeToRDAT", "WriteNodeToRDAT");
      model.addAttribute("writingMAxesOptions", writeMAxesObjectMap);
       /* Tohle nejak zabalit do tridy */
      System.out.println(" Timestamp:  "+  timestampFrom);
      List<SignalModel> signalObjects =signalService.GetAllSignals(stmt, timestampPoint1, timestampPoint2, machineToolNumber, timestampDB);
      
      SignalModel signaValues1 = signalService.GetAllSignalValues(stmt, timestampPoint1, timestampPoint2, machineToolNumber, timestampDB);
      List<List<Object>> signaValues = signaValues1.getSignalValues();
      String[] nodesSignal = signalObjects.get(0).getSignalName().split(",");
      
      /* Test !!! */
      signalFullObjectMap.put(signaValues,signaValues);
      model.addAttribute("signalFullNodeOptions", signalFullObjectMap);
      
      if(nodesSignal.length!= 0) {
			for(int i = 0; i < nodesSignal.length; i++) {
				signalMap.put(i, nodesSignal[i]);
			}
			model.addAttribute("signalOptions", signalMap);
			model.addAttribute("signalPref", currentSignal);
			redirectAttributes.addFlashAttribute("signalPref", model);
		}
      /**** UnComment and fix errors here ****/
      List<List<Object>> fftValues = new ArrayList<List<Object>>();
      try {
      System.out.println(" Signal MAtrix Size: "+signaValues.size());
      double[][] data1 = functions.createMatrixArray(signaValues);
      double[][] fftMatrix = new double[data1.length][];
      for(int i = 0; i < data1.length; i ++) {
      double[]fft = null;
      double[]fft1 = null;
      fft = signalFrimework.fftArray( signalFrimework, data1[i], fft, fft1);
      fftMatrix[i] = fft;
      }
      System.out.println(" FFT MAtrix: "+fftMatrix[10][10]);
      
      for(int i =0; i <fftMatrix.length; i++) {
    	  List<Object> arrVal = new ArrayList<Object>();
    	  for(int j  = 0 ; j < fftMatrix[i].length; j++) {
    		  fftMatrix[i][j] = Math.round(fftMatrix[i][j]* 1000.0) / 1000.0;
    		  arrVal.add(fftMatrix[i][j]);
    	  }
    	  fftValues.add(arrVal);
      }
     
      }catch(Exception e) {}
      
      
      ModelAndView map = new ModelAndView("spectrogram");
      try {
    	  double[][] pcaNative = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}}; 
    	  double[][] pcaMatrix1 = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}};
    	  double[] fftPC1 = null;
    	  double[] fftPC2 = null;
    	  double[] fftPC11 = null;
    	  double[] fftPC12 = null;
    	  
    	  /* FFT */
          double maxFFT1Value =pcaNative[0][0]; 
          double minFFT1Value =pcaNative[0][0];
          double meanFFT1Sum = 0.0;
          double meanFFT11  = 0.0;
          
          double maxFFT2Value =pcaNative[0][0]; 
          double minFFT2Value =pcaNative[0][0];
          double meanFFT2Sum = 0.0;
          double meanFFT21  = 0.0;
          
          
    	if(!times.getPcaState().contains(" Not ")) { 
    		
       //signaValues = fftValues;
       pcaMatrix1 = opcMsrService.GetClusteringPCA(signaValues);
       pcaNative = opcMsrService.ReturnPCAComponents(functions,signaValues, arrayEigenValue, eigneVectors, signalFrimework1, nodeObjects);
       
       fftPC1 = signalFrimework.fftArray( signalFrimework, pcaNative[0], fftPC1, fftPC11);
       fftPC2 = signalFrimework.fftArray( signalFrimework, pcaNative[1], fftPC2, fftPC12);
       
       for(int count = 0; count < fftPC1.length; count ++) {
    	   meanFFT1Sum =  meanFFT1Sum + fftPC1[count];
     	  if(fftPC1[count] > maxFFT1Value){
     		 maxFFT1Value = fftPC1[count];
     	    }
     	  if(fftPC1[count] < minFFT1Value){
     		 minFFT1Value = fftPC1[count];
     	    }
     	  
       }
       meanFFT11 =  meanFFT1Sum / fftPC1.length;
       
       
       /* Component 2*/
   	
   	for(int count = 0; count < fftPC2.length; count ++) {
    	   meanFFT2Sum =  meanFFT2Sum + fftPC2[count];
     	  if(fftPC2[count] > maxFFT2Value){
     		 maxFFT2Value = fftPC2[count];
     	    }
     	  if(fftPC2[count] < minFFT2Value){
     		 minFFT2Value = fftPC2[count];
     	    }
     	  
       }
       meanFFT21 =  meanFFT2Sum / fftPC2.length;
       
    	}
    	
  
      //double[][] pcaMatrix1 = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}};
		double[] pca1 = pcaMatrix1[0];
		double[] pca2 = pcaMatrix1[1];
		
		double[] pcaNative1 = pcaNative[0];
		double[] pcaNative2 = pcaNative[1];
		
		// Mistake Data Vizualization
	  
	  
	  
	  List<List<Object>> metrixFinalObject = new ArrayList<List<Object>>();
	  if(!times.getPcaState().contains(" Not ")) {
		  
	   double[][] buildPC = calc1.buildPComponents(functions, signaValues, arrayEigenValue,eigneVectors,
				   signalFrimework,   nodeObjects);
	  double[][] metrixFinal = metrix.getAllMatrix(buildPC, signalFrimework);
	  
	  try {
	  for(int i = 0 ; i < metrixFinal.length; i ++) {
		  List<Object> metrixValue = new ArrayList<Object>();
		  for(int j = 0; j <metrixFinal[0].length; j++) {
			  metrixValue.add(metrixFinal[i][j]);
		  }
		  metrixFinalObject.add(metrixValue);
	  }
	  
	  signaValues = fftValues;
	  
	  }catch(Exception e) {}
	  }
	  
	  /*CsvHelper.writeArrayToTXT(pca1, "pca1.txt");
	  CsvHelper.writeArrayToTXT(pca2, "pca2.txt");
	  
	  CsvHelper.writeArrayToTXT(pcaNative1, "pcaNative1.txt");
	  CsvHelper.writeArrayToTXT(pcaNative2, "pcaNative2.txt");*/
	  
	  System.out.println(" Dev_State: "+devices.getDev_stat());
	  
      map.addObject("device_id", device_id);
	  map.addObject("timestampFrom", timestampFrom);
	  map.addObject("timestamoTo",timestamoTo);
	  map.addObject("pca1", pca1);
	  map.addObject("pca2", pca2);
	  map.addObject("pcaNative1", pcaNative1);
	  map.addObject("pcaNative2", pcaNative2);
	  map.addObject("signaValues",signaValues);
	  map.addObject("metrixFinalObject",metrixFinalObject);
	  map.addObject("dev_state",dev_state);
	  map.addObject("fftPC1",fftPC1);
	  map.addObject("fftPC2",fftPC2);
	  map.addObject("maxFFT1Value", maxFFT1Value);
	  map.addObject("minFFT1Value",minFFT1Value);
	  map.addObject("meanFFT11",meanFFT11);
	  map.addObject("maxFFT2Value",maxFFT2Value);
	  map.addObject("minFFT2Value",minFFT2Value);
	  map.addObject("meanFFT21",meanFFT21);
	  /* Write data to csv */ 
	  
      }catch(Exception e) {}
        return map;
    }
}

