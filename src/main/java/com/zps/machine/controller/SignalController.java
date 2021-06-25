package com.zps.machine.controller;

import java.io.FileWriter;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.helpers.AutocorrelationCalc;
import com.zps.machine.helpers.CsvHelper;
import com.zps.machine.helpers.Spectrum;
import com.zps.machine.helpers.SpectrumFactory;
import com.zps.machine.helpers.VibrationCalculation;
import com.zps.machine.mathematic.Forecast;
import com.zps.machine.mathematic.Functions;
import com.zps.machine.mathematic.PowerSpectrum;
import com.zps.machine.mathematic.RingMatrix;
import com.zps.machine.mathematic.STFT;
import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.DeviceModel;
import com.zps.machine.model.OpcMsrModel;
import com.zps.machine.model.SignalModel;
import com.zps.machine.service.SignalServiceImplementation;

@Controller
public class SignalController extends AbstractController {
  
	
	public SignalController() throws SQLException {
		super();
		
	}

	@RequestMapping(value = "/signal", method = RequestMethod.POST)
	public ModelAndView getSignal(@ModelAttribute("signalPref") SignalModel signals, Model model) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException {

     VibrationCalculation vibrCalc = new VibrationCalculation();	
     ModelAndView map = null;
     Map<String, String> writeSignalObjectMap = new HashMap();
		try {
		
	  model.addAttribute("signalPref", signals);
	  
	  writeSignalObjectMap.put("WriteNodeToCSV", "WriteNodeToCSV");
      writeSignalObjectMap.put("WriteNodeToTXT", "WriteNodeToTXT");
      writeSignalObjectMap.put("WriteNodeToRDAT", "WriteNodeToRDAT");
      model.addAttribute("writingNodeOptions", writeSignalObjectMap);
      
	  SignalFrimework signalFrimework = new SignalFrimework();
		Functions functions = new Functions();
	  List<Object> timestampDB = new ArrayList<Object>();
	  SignalServiceImplementation signalService = new SignalServiceImplementation();
	  SignalModel signalValues1 =signalService.GetAllSignalValues(stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
      List<List<Object>> signalValues = signalValues1.getSignalValues();
      /*  Native Signal Receive */
      List<Object> calculateFrequencyVibr = signalValues.get(Integer.valueOf(signals.getSignalName()));
      double[] signalFreqwVibr = new double[calculateFrequencyVibr.size()];
      for(int i = 0; i < calculateFrequencyVibr.size(); i++) {
    	  try {
    	  signalFreqwVibr[i] =Double.parseDouble(calculateFrequencyVibr.get(i).toString());
    	  }catch(Exception e) { 
    		  signalFreqwVibr[i] = 0.0;
    		  System.out.println(" Bad Converting format...");}
      }
      //double[] amplitude = CalculateSignalAmplitude( signalFreqwVibr);
      //System.out.println(" Amplitude Length: "+ amplitude.length);
      /*for(int i = 0; i < amplitude.length; i++) {
      System.out.println(" Amplitude: "+ amplitude[i]);
      }*/
      /* Native Signal */
      double maxValue =signalFreqwVibr[0]; 
      double minValue =signalFreqwVibr[0];
      double meanSum = 0.0;
      double mean1  = 0.0;
      /* FFT */
      double maxFFTValue =signalFreqwVibr[0]; 
      double minFFTValue =signalFreqwVibr[0];
      double meanFFTSum = 0.0;
      double meanFFT1  = 0.0;
      
      /* Calculate Prediction */
      Map<String, String> predictionOperationsMap = new HashMap();
      Map<String,String> signalValuesMap1 = new HashMap();
      Map<String,String> signalValuesMap2 = new HashMap();
      Map<String,String> signalValuesMap3 = new HashMap();
      Map<String,String> signalValuesMap4 = new HashMap();
      predictionOperationsMap.put("RNN with LSTM Cells", "RNN with LSTM Cells");
      predictionOperationsMap.put("RNN with Linear Regression", "RNN with Linear Regression");
      model.addAttribute("predictionOption", predictionOperationsMap);
      signalValuesMap1.put(signals.getDev_id0(),signals.getDev_id0());
      signalValuesMap2.put(signals.getTxDt_From(),signals.getTxDt_From());
      signalValuesMap3.put(signals.getTxDt_To(),signals.getTxDt_To());
      signalValuesMap4.put(signals.getSignalName(),signals.getSignalName());
      model.addAttribute("SignalVOption1", signalValuesMap1);
      model.addAttribute("SignalVOption2", signalValuesMap2);
      model.addAttribute("SignalVOption3", signalValuesMap3);
      model.addAttribute("SignalVOption4", signalValuesMap4);
      
      for(int count = 0; count < signalFreqwVibr.length; count ++) {
    	  meanSum = meanSum + signalFreqwVibr[count];
    	  if(signalFreqwVibr[count] > maxValue){
    	      maxValue = signalFreqwVibr[count];
    	    }
    	  if(signalFreqwVibr[count] < minValue){
    	      minValue = signalFreqwVibr[count];
    	    }
    	  
      }
      mean1 = meanSum / signalFreqwVibr.length;
      
      
      
     
      //System.out.println(calculateFrequencyVibr.size());
      double [] fft = null;
      double [] fft1 = null;
      List<Object> fftObj = new ArrayList<Object>(); 
      
      
      List<Object> entropyObj = new ArrayList<Object>();
      List<Object> kovariationObj = new ArrayList<Object>(); 
      List<Object> lShiftObj = new ArrayList<Object>(); 
      List<Object> accVarObj = new ArrayList<Object>(); 
      List<Object> curveaturesObj = new ArrayList<Object>(); 
      List<Object> spikinessObj = new ArrayList<Object>(); 
      List<Object> trandObj = new ArrayList<Object>(); 
      List<Object> rleObj = new ArrayList<Object>(); 
      
      List<List<Object>>  anomaliesMatrix = new ArrayList<List<Object>>();
      
      double mean = 0;
	  double accVar = 0;
	  Forecast forecast = new Forecast();
      
      fft = signalFrimework.fftArray( signalFrimework, signalFreqwVibr, fft, fft1);
      double[] entropyGraph  = signalFrimework.getEntropyRes(signalFreqwVibr,  signalFrimework, entropyGraph= new double[fft.length]);
      //System.out.println(" entropyGraph: "+ entropyGraph.length);
      double[] kovariationGraph =    signalFrimework.Variation(signalFreqwVibr);
      
      double[] lShiftGraph = signalFrimework.optimizedPrintKMax(signalFreqwVibr, signalFreqwVibr.length, 3);
      
      double[] accVarRes = signalFrimework.VarianceTest( signalFreqwVibr,  accVarRes= new double[signalFreqwVibr.length],  mean, accVar, signalFreqwVibr.length);
      
      double[][] curveatures = {signalFreqwVibr,signalFreqwVibr};
      
      double[] curveaturesGraph = signalFrimework.createAndShowGUI(curveatures, curveaturesGraph= new double[signalFreqwVibr.length]);
      
      double[] spikinessGraph = signalFrimework.calcSpikiness(signalFreqwVibr);
      
      
      double[] rleGraph = signalFrimework.calculatingRLE(signalFreqwVibr);
      
      
      double[] trandGraph = forecast.fitTrand(signalFreqwVibr, 0.8,0.2);
      
      double[][] signalDataValues = {fft,entropyGraph, kovariationGraph,lShiftGraph,accVarRes,
    		  curveaturesGraph,spikinessGraph,rleGraph,trandGraph};
      double[][] signalDataFinal = new double[signalDataValues.length][signalDataValues[0].length];
      
      
      double[] signalAmplitude = vibrCalc.CalculateAmplitude(signalFreqwVibr);
      double[] amplitude = vibrCalc.CalculateSignalAmplitude( fft);
      double[] psd =new double[signalFreqwVibr.length];
      for(int i = 0; i < psd.length; i++) {
    	  psd[i] = signalFreqwVibr[i];
      }
      STFT sfftV = new STFT(psd, 0, 0);
      /* When Local Server is Used */
      // double[] sfftK = sfftV.getSTFT(psd, 512);
      /* End */
      /* When Real Server is used */
      double[] sfftK = sfftV.getSTFT(psd, 512);
      /* END */
       for (int i = 1; i <sfftK.length; i++) {
    	   
    		   System.out.println(" stft: "+sfftK[i]);
    	   }
       
       double[] psdK =new double[sfftK.length];
       for(int i = 0; i < sfftK.length; i++) {
     	  psdK[i] = sfftK[i];
       }
      PowerSpectrum powerSpektr = new PowerSpectrum(psdK.length/2, 0, 0.0);
      powerSpektr.transform(psdK);
      
      /*try {
      for(int i = 0 ; i <signalDataFinal.length; i++) {
    	  
    	  for(int j = 0 ; j <signalDataFinal[i].length; i++) {
    		  signalDataFinal[i][j] = signalDataValues[i][j];
    	  }
    	  
      }
      }catch(Exception e) {}*/
      
      
      
      for(int i = 0 ; i <fft.length; i ++) {
    	  entropyObj.add(entropyGraph[i]);
    	  fftObj.add(fft[i]);
    	  kovariationObj.add(kovariationGraph[i]);
    	  lShiftObj.add(lShiftGraph[i]);
    	  accVarObj.add(accVarRes[i]);
    	  curveaturesObj.add(curveaturesGraph[i]);
    	  spikinessObj.add(spikinessGraph[i]);
    	  trandObj.add(trandGraph[i]);
    	  rleObj.add(rleGraph[i]);
      }
      
      anomaliesMatrix.add(entropyObj);
      anomaliesMatrix.add(fftObj);
      anomaliesMatrix.add(kovariationObj);
      anomaliesMatrix.add(lShiftObj);
      anomaliesMatrix.add(accVarObj);
      anomaliesMatrix.add(curveaturesObj);
      anomaliesMatrix.add(spikinessObj);
      anomaliesMatrix.add(trandObj);
      anomaliesMatrix.add(rleObj);
      

      
      //List<Object> timeObjects = new ArrayList<Object>();
      
      //System.out.println(" TimeStamp DB:" + timestampDB.size());
      
      //for(int i = 0 ; i < timestampDB.size(); i++) {
    	  //timeObjects.add("\'"+timestampDB.get(i)+"\'".toString()) ;
      //}
     
      int flag = 1;
      
      
      for(int count = 0; count < fft.length; count ++) {
    	  meanFFTSum = meanFFTSum + fft[count];
    	  if(fft[count] > maxFFTValue){
    	      maxFFTValue = fft[count];
    	    }
    	  if(fft[count] < minFFTValue){
    	      minFFTValue = fft[count];
    	    }
    	  
      }
      meanFFT1 = meanFFTSum / fft.length;
      /* Prediction Timeseries */
      /*String predOP = signals.getPrediction_operations();
      if(predOP.contains(" Calculate ") == true) {
    	  System.out.println(" Prediction Working!!! ");
    	  map = new ModelAndView("prediction");
    	  return map;
      }*/
      /* Full Signal Diagnostic */
      
     
      
      
      if(signals.getSignal_operations().contains("Full") == true) {
    	  
    	 /* CsvHelper.writeArrayToTXT1(calculateFrequencyVibr, "nativeSignal.txt");
    	  CsvHelper.writeArrayToTXT(entropyGraph, "entrophy.txt");
    	  CsvHelper.writeArrayToTXT(kovariationGraph, "kovariation.txt");
    	  CsvHelper.writeArrayToTXT(lShiftGraph, "lShift.txt");
    	  CsvHelper.writeArrayToTXT(accVarRes, "accVarRes.txt");
    	  CsvHelper.writeArrayToTXT(curveaturesGraph, "curveatures.txt");
    	  CsvHelper.writeArrayToTXT(spikinessGraph, "spikiness.txt");
    	  CsvHelper.writeArrayToTXT(rleGraph, "rle.txt");
    	  CsvHelper.writeArrayToTXT(trandGraph, "trand.txt");
    	  CsvHelper.writeArrayToTXT(signalAmplitude, "signalAmplitude.txt");*/
    
     map = new ModelAndView("signal");
      double[][] signalDataMatrix = {signalFreqwVibr, fft};
      map = new ModelAndView("signal");
      map.addObject("calculateFrequencyVibr", calculateFrequencyVibr);
      map.addObject("fft", fft);
      map.addObject("signalDataMatrix", signalDataMatrix);
      map.addObject("entropyGraph", entropyGraph);
      map.addObject("kovariationGraph", kovariationGraph);
      map.addObject("lShiftGraph", lShiftGraph);
      map.addObject("accVarRes", accVarRes);
      map.addObject("curveaturesGraph", curveaturesGraph);
      map.addObject("spikinessGraph", spikinessGraph);
      map.addObject("rleGraph", rleGraph);
      map.addObject("trandGraph", trandGraph);
      map.addObject("anomaliesMatrix", anomaliesMatrix);
      map.addObject("signalAmplitude", signalAmplitude);
      map.addObject("maxValue", maxValue);
	  map.addObject("minValue", minValue);
	  map.addObject("mean1", mean1);
	  map.addObject("maxFFTValue", maxFFTValue);
	  map.addObject("minFFTValue", minFFTValue);
	  map.addObject("meanFFT1", meanFFT1);
      return map;
      }
      
      else if(signals.getSignal_operations().contains("AnalysisSpectral") == true) {
    	  
    	  //System.out.println("VibroDiasgnostic route working!!!! " );
    	  map =  new ModelAndView("freqwAnalyze");
    	  map.addObject("signalFreqwVibr", signalFreqwVibr);
    	  map.addObject("signalAmplitude", signalAmplitude);
    	  map.addObject("fft", fft);
    	  map.addObject("maxValue", maxValue);
    	  map.addObject("minValue", minValue);
    	  map.addObject("mean1", mean1);
    	  map.addObject("maxFFTValue", maxFFTValue);
    	  map.addObject("minFFTValue", minFFTValue);
    	  map.addObject("meanFFT1", meanFFT1);
    	  map.addObject("psdK", psdK);
    	  map.addObject("sfftK", sfftK);
    	  map.addObject("amplitude", amplitude);
    	  
    	 // map.addObject("timeObjects", timeObjects);
    	 
    	   
       }
      /* Realizovat Podobni if else v Axes */
      else if(signals.getSignal_operations().contains("EnergyDiagnostic") == true) {
    	  
    	  map =  new ModelAndView("energyConsuption");
    	  map.addObject("calculateFrequencyVibr", calculateFrequencyVibr);
    	  
      }
      
      else if(signals.getSignal_operations().contains("VibrodiagnostiAnalysis") == true) {
    	  
    	  AutocorrelationCalc auroCorrCalc = new AutocorrelationCalc();
    	  // Vzito z: https://stackoverflow.com/questions/12239096/computing-autocorrelation-with-fft-using-jtransforms-library
    	  // https://cnx.org/contents/1KmznyM9@3/Java1485-Spectrum-Analysis-using-Java-Forward-and-Inverse-Transforms-Filtering-in-the-Frequency-Domain
    	  // !!!!!!  https://www.developer.com/?s=Spectrum+Analysis
    	  //!!!!!!! https://www.developer.com/java/2d-fourier-transforms-using-java-part-2/
    	  double[] data = signalFreqwVibr;
    	  //double[] data = fft;
          double [] ac1 = new double [data.length];
          auroCorrCalc.bruteForceAutoCorrelation(data, ac1);
          
          double[] distancies = vibrCalc.CalculateDistancies(signalFreqwVibr);
          double[] velocity =vibrCalc.CalculateVelocity(distancies, 2);
          double[] acceleration = vibrCalc.CalculateAcceleration(velocity, 2);
       // generate a 7000Hz sine wave for testing, and its length is 144.
          //double[] d = signalFreqwVibr;
          double[] d1 = acceleration;
          double[] d = fft;
          double[] d2 = signalAmplitude ;
          // generate a 15200Hz sine wave for testing, and its length is 5000.
          //short[] s = Sine.wave(15200, 5000);
          
          Spectrum sp = SpectrumFactory.getSpectrum(d);
          Spectrum sp1 = SpectrumFactory.getSpectrum(d1);
          Spectrum sp2 = SpectrumFactory.getSpectrum(d2);
          //System.out.println(sp.getMaxFrequency()); // print 7062.890625
          //System.out.println(" SP.ToString()  " +sp.toString());
          
          double[][] returnSpektr = sp.ReturnSpectrum();
          double[] frekwSpektrum = returnSpektr[0]; 
          double[] powerSpectr = returnSpektr[1];
          
          
          double[][] returnSpektr1 = sp1.ReturnSpectrum();
          double[] frekwSpektrum1 = returnSpektr1[0]; 
          double[] powerSpectr1 = returnSpektr1[1]; 
          
          double[][] returnSpektr2 = sp2.ReturnSpectrum();
          double[] frekwSpektrum2 = returnSpektr2[0]; 
          double[] powerSpectr2 = returnSpektr2[1]; 
          // Vzito z: https://github.com/yangchiu/spectrumanalysis-java
          
          //Spectrum sp2 = SpectrumFactory.getSpectrum("test.wav");
          //System.out.println(sp2.getMaxFrequency()); // print 19437.500953674316
          //System.out.println(sp2.toString());
          // print 
          // Frequency  :  Power
          // ----------------
          // ...
          // 6890.625Hz : 1700042.1632794542
          // 7062.890625Hz : 1977663.0627275368
          // 7235.15625Hz : 592296.5430651765
          // ...

          //Spectrum sp1 = SpectrumFactory.getSpectrum(s);
          //System.out.println(sp1.getMaxFrequency()); // print 15202.44140625
          //System.out.println(sp1.toString());
          
          
    	  map =  new ModelAndView("vibrodiagnostic");
    	  map.addObject("calculateFrequencyVibr", calculateFrequencyVibr);
    	  map.addObject("fft", fft);
    	  map.addObject("ac1", ac1);
    	  map.addObject("frekwSpektrum", frekwSpektrum);
    	  map.addObject("powerSpectr", powerSpectr);
    	  map.addObject("frekwSpektrum1", frekwSpektrum1);
    	  map.addObject("powerSpectr1", powerSpectr1);
    	  map.addObject("acceleration", acceleration);
    	  map.addObject("velocity", velocity);
    	  map.addObject("amplitude", amplitude);
    	  map.addObject("frekwSpektrum2", frekwSpektrum2);
    	  map.addObject("powerSpectr2", powerSpectr2); 
      }
      
		}catch(Exception e) { System.out.println(" Data Err... ");}
      
      return map;
      
    }
	

	public static double[] getMinMax(double[] signal) {
        if (signal.length == 0)
            return new double[] { Double.MIN_VALUE, Double.MAX_VALUE };
        double min = signal[0];
        double max = signal[0];
        int len = signal.length;
        for (int i = 1; i < len; i++) {
            double curVal = signal[i];
            if (curVal < min) {
                min = curVal;
            }
            if (curVal > max) {
                max = curVal;
            }
        }
        return new double[] { min, max };
    }
	
	
	
	
	
}
