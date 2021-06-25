package com.zps.machine.model;

public class OpcMsrModel {
	
	private int msr_id0;
	private int dev_id0;
	private int nod_id0;
	private int msr_jdp;
	private String msr_json;
	private int msr_tim1;
	private int msr_tim2;
	private String msr_dscr;
	private String msr_txdt;
	private String pcaState;
	private int dev_state;
	private int recordCount;
	
	
	/**** Getters ****/
	public int getMsr_id0() {
    	return this.msr_id0;
    }
    
    public int getDev_id0() {
    	return this.dev_id0;
    }
    
    public int getNod_id0() {
    	return this.nod_id0;
    }
    
    public int getMsr_idp() {
    	return this.msr_jdp;
    }
    
    public String getMsr_json() {
    	return this.msr_json;
    }
    
    public int getMsr_tim1() {
    	return this.msr_tim1;
    }
    
    public int getMsr_tim2() {
    	return this.msr_tim2;
    }
    
    public String getMsr_dscr() {
    	return this.msr_dscr;
    }
    
    public String getMsr_txdt() {
    	return this.msr_txdt;
    }
    
    public String getPcaState() {
    	return this.pcaState;
    }
    
    public int getDev_state() {
    	return this.dev_state;
    }
    
    
    public int getRecordCount() {
    	return this.recordCount;
    }
    /**** Setters ****/
    
    public void setMsr_id0(int msr_id0) {
    	this.msr_id0 = msr_id0;
    }
    
    public void setDev_id0(int dev_id0) {
    	this.dev_id0 = dev_id0;
    }
    
    public void setNod_id0(int nod_id0) {
   	 this.nod_id0 = nod_id0;
   }
    
    public void setMsr_idp(int msr_jdp) {
    	 this.msr_jdp = msr_jdp;
    }
    
    public void setMsr_json(String msr_json) {
    	 this.msr_json = msr_json;
    }
    
    public void setMsr_tim1(int msr_tim1) {
    	 this.msr_tim1 = msr_tim1;
    }
    
    public void setMsr_tim2(int msr_tim2) {
    	 this.msr_tim2 = msr_tim2;
    }
    
    public void setMsr_dscr(String msr_dscr) {
   	 this.msr_dscr = msr_dscr;
     }
   
   public void setMsr_txdt(String msr_txdt) {
   	 this.msr_txdt = msr_txdt;
   }
   
   public void setPcaState(String pcaState) {
	   	 this.pcaState = pcaState;
	   }
   
   public void setDev_state(int dev_state) {
	   	 this.dev_state = dev_state;
	   }
   
   public void setRecordCount(int recordCount) {
	   	this.recordCount = recordCount;
	   }
   
   
   

}
