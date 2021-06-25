package com.zps.machine.service;

import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.model.DeviceModel;

public class DeviceServiceImplementation implements DeviceService {

	
	
	@SuppressWarnings("null")
	public List<DeviceModel> GetAllDevices(Statement stmt) throws SQLException {
		
		return  DeviceWrapper.GetAllMachines(stmt)  ;
	}

	@Override
	public int GetDBRecordsCount(Statement stmt)throws SQLException {
		// TODO Auto-generated method stub
		return DBRecCountWrapper.GetAllMachines(stmt);
	}
	
}
 class  DeviceWrapper {
		
		static  List<DeviceModel> GetAllMachines(Statement stmt){
			
			List<DeviceModel> devicesList  = new ArrayList<DeviceModel>();
	        try {
	        
			ResultSet rs = stmt.executeQuery(DeviceService.getAlldevices);
			while (rs.next()) {
				DeviceModel devices = new DeviceModel()  ;
				devices.setDev_id0(Integer.parseInt(new String(rs.getBytes("dev_id0"), StandardCharsets.UTF_8)));
				devices.setDev_id(new String(rs.getBytes("dev_id"), StandardCharsets.UTF_8));
				devices.setDev_name(new String(rs.getBytes("dev_name"), StandardCharsets.UTF_8));
				devices.setDev_type(new String(rs.getBytes("dev_type"), StandardCharsets.UTF_8));
				devices.setDev_ownr(new String(rs.getBytes("dev_ownr"), StandardCharsets.UTF_8));
				devices.setDev_ipad(new String(rs.getBytes("dev_ipad"), StandardCharsets.UTF_8));
				devices.setDev_dt01(new String(rs.getBytes("dev_dt01"), StandardCharsets.UTF_8));
				devices.setDev_stat(Integer.parseInt(new String(rs.getBytes("dev_stat"), StandardCharsets.UTF_8)));
				
				devicesList.add(devices);

			}  
	        }catch(Exception e) {System.out.println(" Connection Err");}
	        
	        return devicesList;
		}
		
	}
 
 
 class  DBRecCountWrapper {
		
		static  int GetAllMachines(Statement stmt){
			
			int recordsCount  = 0;
	        try {
	        
			ResultSet rs = stmt.executeQuery(DeviceService.getAllRecordsCount);
			rs.next();
				DeviceModel devices = new DeviceModel();
				devices.setRecordCount(rs.getInt("rowcount"));
				
				recordsCount= devices.getRecordCount();

			 
	        }catch(Exception e) {System.out.println(" Connection Err");}
	        
	        return recordsCount;
		}
		
	}


