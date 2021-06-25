package com.zps.machine.service;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.zps.machine.model.DeviceModel;

public interface DeviceService {
	/* Create Sql Query */
	public static String getAlldevices = " SELECT * FROM opcdev Limit 10";
	public List<DeviceModel> GetAllDevices(Statement stmt) throws SQLException;
	
	public static String getAllRecordsCount = " SELECT COUNT(*) AS rowcount FROM opcmsr";
	public int GetDBRecordsCount(Statement stmt)throws SQLException;

}
