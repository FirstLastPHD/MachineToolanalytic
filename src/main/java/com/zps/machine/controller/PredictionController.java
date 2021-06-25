package com.zps.machine.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zps.machine.mathematic.Forecast;
import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.SignalModel;
import com.zps.machine.service.SignalServiceImplementation;

@Controller
public class PredictionController extends AbstractController {
	
	public PredictionController() throws SQLException {
		super();
	}
	
	@RequestMapping(value="/prediction", method=RequestMethod.POST)
	public ModelAndView getPrediction(@ModelAttribute("signalPref") SignalModel signals, Model model) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException {
		
		//System.out.println(" Prediction: "+signals.getPrediction_operations());
		Forecast forecast = new Forecast();
		
		List<Object> timestampDB = new ArrayList<Object>();
		SignalServiceImplementation signalService = new SignalServiceImplementation();
		  SignalModel signalValues1 =signalService.GetAllSignalValues(stmt, signals.getTxDt_From(), signals.getTxDt_To(), signals.getDev_id0(), timestampDB);
	      List<List<Object>> signalValues = signalValues1.getSignalValues();
	      List<Object> calculateFrequencyVibr = signalValues.get(Integer.valueOf(signals.getSignalName()));
	      double[] signalFreqwVibr = new double[calculateFrequencyVibr.size()];
	     // int neurons_amount[]  = new int[signalFreqwVibr.length];
	      for(int i = 0; i < calculateFrequencyVibr.size(); i++) {
	    	  signalFreqwVibr[i] =Double.parseDouble(calculateFrequencyVibr.get(i).toString());
	    	  //neurons_amount[i] = Integer.valueOf(String.valueOf(signalFreqwVibr[i]*1000)); 
	    	  //System.out.println(" Signal Value: "+signalFreqwVibr[i]);
	      }
	    double[] trandGraph = forecast.fitTrand(signalFreqwVibr, 0.8,0.2);
	    SignalFrimework signalFrimework = new SignalFrimework();
	    double [] fft = null;
	    double [] fft1 = null;
	    fft = signalFrimework.fftArray( signalFrimework, signalFreqwVibr, fft, fft1);
	    System.out.println("FFt: "+fft.length);
	    /*double[] levels = new double[trandGraph.length];
	    double[] smoothedData = new double[trandGraph.length];
	    double[][] predictMetrix = forecast.getLeves(signalFreqwVibr, trandGraph, smoothedData, levels, 0.8,0.2);
	    double[] predictions = forecast.forecast(trandGraph.length, predictMetrix[1], trandGraph);*/
	    
	    
	    /*ModelForecast modelPrediction = Forecast.fit(signalFreqwVibr, 0.8, 0.2);
	    System.out.println("Forecast: " + Arrays.toString(modelPrediction.forecast(100)));
	    double[] forecastsArr = modelPrediction.forecast(2000);
	    
	   
		     int n = forecastsArr.length;

	        // the function y = sin(4x) + sin(20x), sampled at n+1 points
	        // between x = 0 and x = pi
	        double[] x = new double[n+1];
	        double[] y = new double[n+1];
	        for (int i = 0; i <= n-1; i++) {
	            x[i] = (Math.PI * i / n)*1;
	            y[i] = Math.sin(4*forecastsArr[i]*1)+ Math.sin(20*forecastsArr[i]*1);
	        }*/

	       
			
		
	    
	    
	     /*int genomes_per_generation = 3;
	     int neurons_amount[] = {2, 2, 1};
	      NeuralNetwork nn = new NeuralNetwork(neurons_amount, genomes_per_generation, 0.5, -1, 1);
	      double outputs[] = new double[signalFreqwVibr.length];
    	  outputs =nn.getOutputs(signalFreqwVibr);
    	  for(int i = 0 ; i < outputs.length; i++) {
    		  System.out.println(" NN Signal: "+outputs[i]);
    	  }*/
	    
	     //System.out.println();
		//String predOP = signals.getPrediction_operations();
		//System.out.println(" Signal ID: "+signals.getTxDt_From());
	    ModelAndView map = null;
	    //System.out.println(" Pred Operations: "+signals.getPrediction_operations());
	    if( signals.getPrediction_operations().contains("LSTM Cells") == true) {
		map = new ModelAndView("prediction");
		//map.addObject("predOP", predOP);
		map.addObject("signalFreqwVibr", signalFreqwVibr);
		map.addObject("trandGraph", trandGraph);
		map.addObject("fft", fft);
	    }
	    
	    else if(signals.getPrediction_operations().contains("Linear Regression") == true) {
	    	  
	    	  map =  new ModelAndView("linRegRNN");
	    	  map.addObject("signalFreqwVibr", signalFreqwVibr);
	    	  
	      }
		//map.addObject("y", y);
		return map;
	}

}

