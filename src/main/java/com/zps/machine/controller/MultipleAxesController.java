package com.zps.machine.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.zps.machine.helpers.AutocorrelationCalc;
import com.zps.machine.helpers.CsvHelper;
import com.zps.machine.helpers.Spectrum;
import com.zps.machine.helpers.SpectrumFactory;
import com.zps.machine.helpers.VibrationCalculation;
import com.zps.machine.mathematic.CalcPart1;
import com.zps.machine.mathematic.CalculateMetrix;
import com.zps.machine.mathematic.Functions;
import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.SignalModel;
import com.zps.machine.service.OpcMsrServiceImplementation;
import com.zps.machine.service.SignalServiceImplementation;

@Controller
public class MultipleAxesController extends AbstractController{

	public MultipleAxesController() throws SQLException {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "multipleAxes", method = RequestMethod.POST)
    public ModelAndView ggetMultipleAxes(HttpServletRequest request,
            HttpServletResponse response,@ModelAttribute("signalPref") SignalModel signals,Model model,
    		RedirectAttributes redirectAttributes) throws Exception{
		
		model.addAttribute("signalPref", signals);
		if(stmt == null) {
			stmt  =  PsqlDBConfig.GetConnection();
		}
		
		
		 ModelAndView map = new ModelAndView("multipleAxes");
		 
		 String rFileLink1 = "www.google.com";
		 /* Csv Helper Declaration */
		 try {
		 CsvHelper csvHelp = new CsvHelper();
		 
		 System.out.println(" signals.getSignalName(): "+signals.getSignalName());
		 List<Object> timestampDB = new ArrayList<Object>();
			SignalServiceImplementation signalService = new SignalServiceImplementation();
			List<SignalModel> signalObjects =signalService.GetAllSignals( stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
			  SignalModel signalValues1 =signalService.GetAllSignalValues(stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
		      List<List<Object>> signalValues = signalValues1.getSignalValues();
		      /* Dostavam tady signaly */
		      String[] signalsArr = signals.getSignalName().toString().split(",");
		      int[] signalIndexes = new int[signalsArr.length];
		      String tempValue = "123";
		      System.out.println(" Signals: "+signalsArr.length);
		      
		      for(int i = 0; i < signalIndexes.length; i++) {
		    	  signalIndexes[i] = Integer.parseInt(signalsArr[i]); 
		      }
		       /* Vytvorit maticu objectu z jmeny signalu a jejich hodnotami */
		      /* Dostavam Stringy Nazvy Signalu */
		      String[] nodesSignal = signalObjects.get(0).getSignalName().split(",");
		      
		      String[] signalNode = new String[signalIndexes.length];
		      /* Dostavam Hlavicky signalu */
		      /* Tj. Nazev Signaly vsechno jde do pole String[] arr */
		      for(int i = 0 ; i < signalNode.length; i ++) {
		    	  //byte[] englishBytes = nodesSignal[signalIndexes[i]].getBytes();
		    	   //tempValue = new String(englishBytes, StandardCharsets.UTF_8);
		    	  //System.out.println("TempValue: "+tempValue.replaceAll(".", ""));
		    	  signalNode[i] = "\""+nodesSignal[signalIndexes[i]]+"\"";
		    	  //signalNode[i] = "23432";
		    	  System.out.println(signalNode[i]);
		      }
		      
		      /* ted Dostavam Hodnoty Objekty Signalu */
		      /* Budu Potrebovat Vyplnit List Object Array */
		      List<List<Object>> dynamicND1 = new ArrayList<List<Object>>();
		      
		     /* for(int i = 0; i < signalIndexes.length; i++) {
		    	  System.out.println(" Signal Indexes:   "+signalIndexes[i]);
		      }*/
		      for(int i = 0 ; i < signalIndexes.length; i++) {
		      //List<Object> calculateFrequencyVibr = signalValues.get(signalIndexes[i]);
		      dynamicND1.add(signalValues.get(signalIndexes[i]));
		      }
		      
		      System.out.println(" DynamicND1 size:  "+dynamicND1.get(0).size());
		      
		      /* Naplit ND array hodnotami */
		      double[][] dataMatrix1 = new double[dynamicND1.size()][dynamicND1.get(0).size()];
		      
		      try {
		  		for (int j = 0; j < dynamicND1.get(0).size(); j++) {
		  			
		  			for (int i = 0; i < dynamicND1.size(); i++) {
		  				dataMatrix1[i][j] = (Double.parseDouble(dynamicND1.get(i).get(j).toString()));
		  				//data1[i][j] = data1[i][j] * 100000.0;
		  				// System.out.print(" Input Data: "+ data1[i][j]+ " ");
		  				// writer.print(data1[i][j] + " ");
		  				// System.out.print(" Input Data: "+ data1[i][j]);
		  			}
		  			// System.out.println("\n");
		  		}
		         }catch(Exception e) {}
		      
		      System.out.println(" Data MAtrix1 Size: "+dataMatrix1[0].length);
		      
		      /* Kdyz nezapisuji do souboru */
		      /* realizovat funkcionalitu kdyz nezapisuji data do souboru */
		      /* A navic pridat vyber operaci  */
		      if(signals.getSignal_writing_operations().contains("NotWrite") == true) {
		    	  
		    	   if(signals.getSignal_operations().contains("DrawGraphs") == true) {
		    	  map =  new ModelAndView("plotAxes");
		    	  map.addObject("dynamicND1", dynamicND1);
		    	  map.addObject("signalNode",signalNode);
		    	  // How is to create dynamicaly plots in JS
		    	   }
		    	   else if(signals.getSignal_operations().contains("AnalysisSpectral") == true) {
		    	    	  
		    	    	  
		    	    	 
		    	    	   
		    	       }
		    	      /* Realizovat Podobni if else v Axes */
		    	      else if(signals.getSignal_operations().contains("EnergyDiagnostic") == true) {
		    	    	  
		    	    	  
		    	    	  
		    	      }
		    	      
		    	      else if(signals.getSignal_operations().contains("VibrodiagnostiAnalysis") == true) {
		    	    	  //https://github.com/marytts/marytts/blob/master/marytts-signalproc/src/main/java/marytts/util/math/FFT.java
		    	    	  //multipleAxesVibro
		    	    	  // Vypocet vibrodiagnostiky pro urcitou skupinu uzlu....
		    	    	  // Jak spocitat vibrodiagnostiku pro skupinu signalu
		    	    	  // Vyhodit na zacatku grafy signalu 
		    	    	  // Pravdepodobne to se pocita pro kazdou asu zvlast
		    	    	  // a potom se vyhazuji pro kazdou osu
		    	    	  //dataMatrix1
		    	    	  
		    	    	  // Calculate Vibrodiagnostic Here
		    	    	  // Tady v cyclu vypocitat vibrodiagnostiku pro signalni uzel 
		    	    	  /*  Calculating Freqw Domain */
		    	    	  SignalFrimework signalFrimework = new SignalFrimework();
		    	    	  OpcMsrServiceImplementation opcMsrService = new OpcMsrServiceImplementation();
		    	    	  Functions functions12 = new Functions();
		    	    	  double[] arrayEigenValue1 = new double[0];
		                  	double[][] eigneVectors1 = new double[0][0];
		    	    	  double[][] pcaNative11 = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}}; 
		    	    	  double[][] pcaNative12 = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}}; 
		    	    	  double[][] pcaNativeVelocity1 = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}}; 
		    	          // Posivat se na tento zdroj 
		    	    	  // https://eam.su/lekciya-14-spektralnyj-analiz-vibracii.html
		    	    	  /* Acceleration */
		    	    	  List<List<Object>> vibrodiagnostics = new ArrayList<List<Object>>();
		    	    	  /* Velocity */
		    	    	  List<List<Object>> vibroVelocity = new ArrayList<List<Object>>();
		    	    	  List<List<Object>> vibrodiagnostics1 = new ArrayList<List<Object>>();
		    	    	  List<List<Object>> autocorrelation1 = new ArrayList<List<Object>>();
		    	    	  /* Calculate Frequency Spectrum */
		    	    	  double[] signalFrekwSpectrum = VibroFrekwSpectrum(dataMatrix1[0]);
		    	    	  for(int i = 0; i < dataMatrix1.length; i++ ) {
		    	    		  /* Acceleration */
		    	    		 vibrodiagnostics.add(VibrodiagnosticCalculation(dataMatrix1[i],0));
		    	    		 vibroVelocity.add(VibrodiagnosticCalculation(dataMatrix1[i],1));
		    	    		 /* Velocity */
		    	    		 vibrodiagnostics1.add(VibrodiagnosticCalculationAmplitude( signalFrimework, dataMatrix1[i]));
		    	    		 autocorrelation1.add(VibrodiagnosticAutocorrelation(dataMatrix1[i]));
		    	    	  }
		    	    	  
		    	    	  List<Object> nodeObjects1 = null;
		    	    	  /* PCA Pro vibrozrychleni/ Freq */
		    	    	  pcaNative11 = opcMsrService.ReturnPCAComponents(functions12,vibrodiagnostics, arrayEigenValue1, eigneVectors1, signalFrimework, nodeObjects1);
		    	    	  /* PCA Pro ampl/ Freq */
		    	    	  pcaNative12 = opcMsrService.ReturnPCAComponents(functions12,vibrodiagnostics1, arrayEigenValue1, eigneVectors1, signalFrimework, nodeObjects1);
		    	    	  
		    	    	  /* Pro Velocity */
		    	    	  pcaNativeVelocity1 = opcMsrService.ReturnPCAComponents(functions12,vibroVelocity, arrayEigenValue1, eigneVectors1, signalFrimework, nodeObjects1);
		    	    	  
		    	    	  double[] pcaNat1 = pcaNative11[0];
		    	    	  double[] pcaNat2 = pcaNative11[1];
		    	    	  
		    	    	  double[] resAccelRMS = new double[pcaNat1.length];
		    	    	  /* Zkusim sformulovat rezultujici signal */
		    	    	  for(int i = 0; i < pcaNat1.length; i++) {
		    	    		  for(int j = 0; j < pcaNat2.length; j++) {
		    	    			  resAccelRMS[i] = (pcaNat1[i]+pcaNat2[i])/2;
		    	    		  }
		    	    	  }
		    	    	  
		    	    	  
		    	    	  
		    	    	  double[] pcaNat12 = pcaNative12[0];
		    	    	  double[] pcaNat22 = pcaNative12[1];
		    	    	  /* Tady Dostavam Rezultujici signal pro Amplitudu a freqw Spectrogram */
		    	    	  double[] resAmplRMS = new double[pcaNat12.length];
		    	    	  
		    	    	  for(int i = 0; i < pcaNat12.length; i++) {
		    	    		  for(int j = 0; j < pcaNat22.length; j++) {
		    	    			  
		    	    			  resAmplRMS[i] = (pcaNat12[i]+pcaNat22[i])/2;
		    	    		  }
		    	    	  }
		    	    	  
		    	    	  
		    	    	  /* Res Signal */
		    	    	  double[] resVelocityRMS = new double[pcaNat12.length];
		    	    	  double[] pcaVelocity1 = pcaNativeVelocity1[0];
		    	    	  double[] pcaVelocity2 = pcaNativeVelocity1[1];
		    	    	  for(int i = 0; i < pcaVelocity1.length; i++) {
		    	    		  for(int j = 0; j < pcaVelocity2.length; j++) {
		    	    			  
		    	    			  resVelocityRMS[i] = (pcaVelocity1[i]+pcaVelocity2[i])/2;
		    	    		  }
		    	    	  }
		    	    	  
		    	    	  // Dodelat rezultujici signal
		    	    	  
		    	    	  /*for(int i = 0 ; i < vibrodiagnostics.size(); i++) {
		    	    		  for(int j = 0 ; j < vibrodiagnostics.get(0).size(); j++ ) {
		    	    			  
		    	    		  }
		    	    	  }*/
		    	    	  // Vypocitat stredni hodnotu
		    	    	  //System.out.println(" pca1[0].Size():..  "+pcaNative1[0].length);
		    	    	  /* Overit Tohle */
		    	    	  /* Calculating Resulting Grapg of All Signals */
		    	    	  /* Dodelat Datovou redukci vypocitaneho signalu */
		    	    	  
		    	    	  // Calling autocorellation function 
		    	    	  
		    	    	  //VibrodiagnosticCalculation(dataMatrix1[0]);
		    	    	  map =  new ModelAndView("multipleAxesVibro");
				    	  map.addObject("dynamicND1", dynamicND1);
				    	  map.addObject("signalNode",signalNode);
				    	  
				    	  map.addObject("signalFrekwSpectrum", signalFrekwSpectrum);
				    	  map.addObject("vibrodiagnostics",vibrodiagnostics);
				    	  map.addObject("vibrodiagnostics1",vibrodiagnostics1);
				    	  map.addObject("vibroVelocity",vibroVelocity);
				    	  map.addObject("autocorrelation1", autocorrelation1);
				    	  //map.addObject("pcaNat1", pcaNat1);
				    	  //map.addObject("pcaNat2", pcaNat2);  
				    	  //map.addObject("pcaNat12", pcaNat12);
				    	  //map.addObject("pcaNat22", pcaNat22);
				    	  //map.addObject(redirectAttributes);
				    	  map.addObject("resAccelRMS", resAccelRMS);
				    	  map.addObject("resAmplRMS",  resAmplRMS);
				    	  
				    	  map.addObject("resVelocityRMS", resVelocityRMS);
				    	
				    	 
		    	    	  
		    	      }
		    	   
                    else if(signals.getSignal_operations().contains("Full") == true) {
		    	    	  
		    	    	  
		    	    	  
		    	      }
                    else if (signals.getSignal_operations().contains("CalculatePCA") == true) {
                    	
                    // Calculating PCA
                    // Receiving PCA values vs Spectrogram Controller
                    double[][] pcaNative1 = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}}; 
                  	double[][] pcaMatrix11 = {{3.0,556.78,66.78,78.78},{43.786,5556.56,6236.56,72348.345}};
                  	Functions functions1 = new Functions();
                  	CalcPart1 calc11 = new CalcPart1();
                  	CalculateMetrix metrix11 = new CalculateMetrix();
                  	List<List<Object>> metrixFinalObject1 = new ArrayList<List<Object>>();
                  	double[] arrayEigenValue1 = new double[0];
                  	double[][] eigneVectors1 = new double[0][0];
                  	List<Object> nodeObjects1 = null;
                  	SignalFrimework signalFrimework11 = new SignalFrimework();
                    OpcMsrServiceImplementation opcMsrService = new OpcMsrServiceImplementation();
                    pcaMatrix11 = opcMsrService.GetClusteringPCA(dynamicND1);
                    pcaNative1 = opcMsrService.ReturnPCAComponents(functions1,dynamicND1, arrayEigenValue1, eigneVectors1, signalFrimework11, nodeObjects1);
                    
                    double[][] buildPC1 = calc11.buildPComponents(functions1, dynamicND1, arrayEigenValue1,eigneVectors1,
         				   signalFrimework11,   nodeObjects1);
         	        double[][] metrixFinal = metrix11.getAllMatrix(buildPC1, signalFrimework11);
                    
                    double[] pca11 = pcaMatrix11[0];
            		double[] pca12 = pcaMatrix11[1];
            		
            		double[] pcaNative11 = pcaNative1[0];
            		double[] pcaNative12 = pcaNative1[1];
            		
            		
            		try {
            			  for(int i = 0 ; i < metrixFinal.length; i ++) {
            				  List<Object> metrixValue = new ArrayList<Object>();
            				  for(int j = 0; j <metrixFinal[0].length; j++) {
            					  metrixValue.add(metrixFinal[i][j]);
            				  }
            				  metrixFinalObject1.add(metrixValue);
            			  }
            			  
            		
            			  }catch(Exception e) {}
            			  
                      map =  new ModelAndView("multipleAxesPCA");
      		    	  map.addObject("dynamicND1", dynamicND1);
      		    	  map.addObject("signalNode",signalNode);
      		    	  
      		    	  map.addObject("pca11", pca11);
      			      map.addObject("pca12", pca12);
      			      map.addObject("pcaNative11", pcaNative11);
      			      map.addObject("pcaNative12", pcaNative12);
      			      map.addObject("metrixFinalObject1",metrixFinalObject1);
                    	
                    }
		    	   
		    	    
		    	  
		      }
		      
		      
		      /* Zapis dat do souboru */
		      
		      if(signals.getSignal_writing_operations().contains("WriteNodeToCSV") == true) {
		    	  //return odkaz
		    	  rFileLink1 =csvHelp.WriteMatrixToCSV( signalNode, dynamicND1,"csv");
		    	  csvHelp.doDownload(rFileLink1, request, response);
		      }else if(signals.getSignal_writing_operations().contains("WriteNodeToRDAT") == true) {
		    	//return odkaz
		    	  rFileLink1 = csvHelp.WriteMatrixToCSV( signalNode, dynamicND1,"rdat");
		    	  csvHelp.doDownload(rFileLink1, request, response);
		    	  
		      }else if(signals.getSignal_writing_operations().contains("WriteNodeToTXT") == true) {
		    	//return odkaz
		    	  rFileLink1 = csvHelp.WriteMatrixToCSV( signalNode, dynamicND1,"txt");
		    	  csvHelp.doDownload(rFileLink1, request, response);
		      }
		      /* End Zapis dat do souboru */
		      
		      //List<Object> calculateFrequencyVibr = signalValues.get(Integer.valueOf(signals.getSignalName()));
		      //double[] signalFreqwVibr = new double[calculateFrequencyVibr.size()];
		      //String[] nodesSignal = signalObjects.get(0).getSignalName().split(",");
		      //String signalNode = nodesSignal[Integer.valueOf(signals.getSignalName())];
		 }catch(Exception e) {}	 
		return map;
		 		 
	}
	
	/* VibroDiagnostic Calculation */
	/* Pro Acceleration */
	public List<Object> /*double[][]*/ VibrodiagnosticCalculation(double[] data ,int flagVelocity){

    //List<List<Object>> dynamicND1 = new ArrayList<List<Object>>();
	AutocorrelationCalc auroCorrCalc = new AutocorrelationCalc();
	  //double[] data = fft;
    double [] ac1 = new double [data.length];
    auroCorrCalc.bruteForceAutoCorrelation(data, ac1);
    
	  VibrationCalculation vibrCalc = new VibrationCalculation();
    double[] distancies = vibrCalc.CalculateDistancies(data);
    double[] velocity =vibrCalc.CalculateVelocity(distancies, 2);
    double[] acceleration = vibrCalc.CalculateAcceleration(velocity, 2); 
    
	  double[] d = acceleration;
	  if(flagVelocity == 1) {
		  d = acceleration = velocity;
	  }
    Spectrum sp = SpectrumFactory.getSpectrum(d);
    double[][] returnSpektr = sp.ReturnSpectrum();
    double[] frekwSpektrum = returnSpektr[0]; 
    double[] powerSpectr = returnSpektr[1]; 
    List<Object> returnObject = new ArrayList<Object>();
    for(int i = 0 ; i < powerSpectr.length; i++ ) {
    	returnObject.add(powerSpectr[i]);
    }
    //double[][] vibrodiagnosticArr = {frekwSpektrum,powerSpectr,ac1};
    //List<List<Object>> returnObject = new ArrayList<List<Object>>();
    //returnObject.add(frekwSpektrum);
    //return vibrodiagnosticArr;
    return returnObject;
	}
	
	/* Return Frequency Spevtrum */
	/* VibroDiagnostic Calculation */
	public double[] /*double[][]*/ VibroFrekwSpectrum(double[] data){
		
		
    //List<List<Object>> dynamicND1 = new ArrayList<List<Object>>();
	AutocorrelationCalc auroCorrCalc = new AutocorrelationCalc();
	  //double[] data = fft;
    double [] ac1 = new double [data.length];
    auroCorrCalc.bruteForceAutoCorrelation(data, ac1);
    
	  VibrationCalculation vibrCalc = new VibrationCalculation();
    double[] distancies = vibrCalc.CalculateDistancies(data);
    double[] velocity =vibrCalc.CalculateVelocity(distancies, 2);
    double[] acceleration = vibrCalc.CalculateAcceleration(velocity, 2); 
	  double[] d = acceleration;
    Spectrum sp = SpectrumFactory.getSpectrum(d);
    double[][] returnSpektr = sp.ReturnSpectrum();
    double[] frekwSpektrum = returnSpektr[0]; 
    double[] powerSpectr = returnSpektr[1]; 
    List<Object> returnObject = new ArrayList<Object>();
    returnObject.add(powerSpectr);
    //double[][] vibrodiagnosticArr = {frekwSpektrum,powerSpectr,ac1};
    //List<List<Object>> returnObject = new ArrayList<List<Object>>();
    //returnObject.add(frekwSpektrum);
    //return vibrodiagnosticArr;
    return frekwSpektrum;
	}
	
	/* End Acceleration */
	
	/* Pro Amplitudu */
	
	/* Pro Acceleration */
	public List<Object> /*double[][]*/ VibrodiagnosticCalculationAmplitude(SignalFrimework signalFrimework, double[] data){

  	double[] fft = new double[data.length];
  	double[] fft1 = new double[data.length];
  	fft =  signalFrimework.fftArray( signalFrimework, data, fft, fft1);
    Spectrum sp = SpectrumFactory.getSpectrum(fft);
    double[][] returnSpektr = sp.ReturnSpectrum();
    double[] frekwSpektrum = returnSpektr[0]; 
    double[] powerSpectr = returnSpektr[1]; 
    List<Object> returnObject = new ArrayList<Object>();
    for(int i = 0 ; i < powerSpectr.length; i++ ) {
    	returnObject.add(powerSpectr[i]);
    }
    //double[][] vibrodiagnosticArr = {frekwSpektrum,powerSpectr,ac1};
    //List<List<Object>> returnObject = new ArrayList<List<Object>>();
    //returnObject.add(frekwSpektrum);
    //return vibrodiagnosticArr;
    return returnObject;
	}
	
	
	/* End Vibrodiagnostic Calculation */
	
	
	/* Pro Autocorrelation */
	public List<Object> /*double[][]*/ VibrodiagnosticAutocorrelation(double[] data){
	    //List<List<Object>> dynamicND1 = new ArrayList<List<Object>>();
		AutocorrelationCalc auroCorrCalc = new AutocorrelationCalc();
		  //double[] data = fft;
	    double [] ac1 = new double [data.length];
	    auroCorrCalc.bruteForceAutoCorrelation(data, ac1);
	    
	    List<Object> returnObject = new ArrayList<Object>();
	    for(int i = 0 ; i < ac1.length; i++ ) {
	    	returnObject.add(ac1[i]);
	    }
	    //double[][] vibrodiagnosticArr = {frekwSpektrum,powerSpectr,ac1};
	    //List<List<Object>> returnObject = new ArrayList<List<Object>>();
	    //returnObject.add(frekwSpektrum);
	    //return vibrodiagnosticArr;
	    return returnObject;
		}
	/* End Autocorrelation */
	
	  //AutocorrelationCalc auroCorrCalc = new AutocorrelationCalc();
	  //double [] data = { 1, -81, 2, -15, 8, 2, -9, 0};
	  //double[] data = dataMatrix1[0];
      //double [] ac1 = new double [data.length];
      //double [] ac2 = new double [data.length];
      //auroCorrCalc.bruteForceAutoCorrelation(data, ac1);
      //auroCorrCalc.fftAutoCorrelation(data, ac2);
      //auroCorrCalc.print("bf", ac1);
      //auroCorrCalc.print("fft", ac2);
      //double err = 0;
      //for (int i = 0; i < ac1.length; i++)
          //err += auroCorrCalc.sqr(ac1[i] - ac2[i]);
      //System.out.println("err = " + err);
      //for(int i =0; i < ac1.length; i++) {
    	 // System.out.println(" Autocorellation element[i]:   "+ac1[i]);
      //}
      //System.out.println(" AC1 .length:   "+ ac1.length);
      
}
