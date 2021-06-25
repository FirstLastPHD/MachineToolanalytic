package com.zps.machine.model;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;

@Component
public class DeviceModel {
	
	private int dev_id0;
	private String dev_id;
	
	private String dev_name;
	private String dev_type;
	private String dev_ownr;
	private String dev_ipad;
	private String dev_dt0;
	private int dev_stat;
	
	private int startRange;
	private int endRange;
	private int recordCount;
	
	/**** Getters ****/
    public int getDev_id0() {
    	return this.dev_id0;
    }
    
    public String getDev_id() {
    	return this.dev_id;
    }
    
    public String getDev_name() {
    	return this.dev_name;
    }
    
    public String getDev_type() {
    	return this.dev_type;
    }
    
    public String getDev_ownr() {
    	return this.dev_ownr;
    }
    
    public String getDev_ipad() {
    	return this.dev_ipad;
    }
    
    public String getDev_date() {
    	return this.dev_dt0;
    }
    
    public int getDev_stat() {
    	return this.dev_stat;
    }
    
    public int getStartRange() {
    	return this.startRange;
    }
    
    public int getEndRange() {
    	return this.endRange;
    }
    
    public int getRecordCount() {
    	return this.recordCount;
    }
    
    /**** Setters ****/
    
    public void setDev_id0(int dev_id0) {
    	this.dev_id0 = dev_id0;
    }
    
    public void setDev_id(String dev_id) {
    	this.dev_id = dev_id;
    }
    
    public void setDev_name(String dev_name) {
    	 this.dev_name = dev_name;
    }
    
    public void setDev_type(String dev_type) {
    	 this.dev_type = dev_type;
    }
    
    public void setDev_ownr(String dev_ownr) {
    	 this.dev_ownr = dev_ownr;
    }
    
    public void setDev_ipad(String dev_ipad) {
    	 this.dev_ipad = dev_ipad;
    }
    
    public void setDev_dt01(String dev_dt01) {
   	 this.dev_ownr = dev_dt01;
     }
   
   public void setDev_stat(int dev_stat) {
   	 this.dev_stat = dev_stat;
   }
   
   public void setStartRange(int startRange) {
   	this.startRange=startRange;
   }
   
   public void setEndRange(int endRange) {
   	 this.endRange=endRange ;
   }
   
   public void setRecordCount(int recordCount) {
   	this.recordCount = recordCount;
   }
    

}
