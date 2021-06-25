package com.zps.machine.model;

import java.util.List;

public class SignalModel {
	
	private String signalName;
	private String signalValue;
	private List<List<Object>> signalValues;
	private String txDt_From;
	private String txDt_To;
	private String dev_id0;
	private String signal_operations;
	private String prediction_operations;
	private String signal_writing_operations;
	private String singleSignal_writing_operations;
	/**** Getters ****/
	
	public String getSignalName() {
    	return this.signalName;
    }
    
    public String getSignalValue() {
    	return this.signalValue;
    }
    public List<List<Object>> getSignalValues() {
    	return this.signalValues;
    }
    public String getTxDt_From() {
    	return this.txDt_From;
    }
    public String getTxDt_To() {
    	return this.txDt_To;
    }
    public String getDev_id0() {
    	return this.dev_id0;
    }
    
    public String getSignal_writing_operations() {
    	return this.signal_writing_operations;
    }
    
    public String getSingleSignal_writing_operations() {
    	return this.singleSignal_writing_operations;
    }
    
    public String getSignal_operations() {
    	return this.signal_operations;
    }
    
    public String getPrediction_operations() {
    	return this.prediction_operations;
    }
	/**** END ****/
	
	
	/**** Setters ****/
    public void setSignalName(String signalName) {
    	this.signalName = signalName;
    }
    
    public void setSignalValue(String signalValue) {
    	this.signalValue = signalValue;
    }
    
    public void setSignalValues(List<List<Object>> signalValues) {
    	this.signalValues = signalValues;
    }
    
    
    public void setTxDt_From(String txDt_From) {
    	this.txDt_From = txDt_From;
    }
    
    public void setTxDt_To(String txDt_To) {
    	this.txDt_To = txDt_To;
    }
    
    public void setDev_id0(String dev_id0) {
    	this.dev_id0 = dev_id0;
    }
    
    public void setSignal_writing_operations(String signal_writing_operations) {
	   	 this.signal_writing_operations = signal_writing_operations;
	   }
    
    public void setSingleSignal_writing_operations(String singleSignal_writing_operations) {
	   	 this.singleSignal_writing_operations = singleSignal_writing_operations;
	   }
    
    public void setSignal_operations(String signal_operations) {
	   	 this.signal_operations = signal_operations;
	   }
    
    public void setPrediction_operations(String prediction_operations) {
	   	 this.prediction_operations = prediction_operations;
	   }
	/**** END ****/
	

}
