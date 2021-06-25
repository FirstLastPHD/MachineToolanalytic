package com.zps.machine.service;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.json.JSONException;
import org.json.simple.parser.ParseException;
import org.springframework.scheduling.annotation.Async;

import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.OpcMsrModel;


@Async
public interface OpcMsrService {
	
	/* Tohle Musim Resit */
	//public static String getFullOpcMsrObject = " SELECT * FROM opcmsr Limit 20000";
	//public static String getFullOpcMsrObject = " SELECT * FROM opcmsr where msr_txdt between '2019-10-08 11:39:35.204' and '2019-10-08 13:48:49.029' ";
	
	//public static String getFullOpcMsrObject = " SELECT dev_id0, msr_txdt FROM opcmsr where dev_id0 = 1 and (msr_id0 between 500000 and 550000) order by msr_id0 ";
	
	//public static String getFullOpcMsrObject = " SELECT dev_id0, msr_txdt FROM opcmsr where dev_id0 = 1  order by msr_txdt limit 20000";
	
	public List<OpcMsrModel> GetOpcMsrObject(Statement stmt, String dev_id0, String rangeFrom, String rangeTo) throws SQLException;
	@Async
	public double[][] GetClusteringPCA(List<List<Object>> dynamicND)throws SQLException, JSONException, ParseException, IOException, java.text.ParseException;
	
	@Async
	public List<Object> ReturnDeviceNodes(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException;
	@Async
	List<List<Object>> ReturnDeviceNodeValues(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException;
	
	@Async 
	public List<OpcMsrModel> getPCAState();
	
	@Async
	double[][] ReturnPCAComponents(com.zps.machine.mathematic.Functions functions, List<List<Object>> dynamicND,
			  double[] arrayEigenValue,double[][] eigneVectors,SignalFrimework signalFrimework,List<Object> nodeObjects) throws NumberFormatException, IOException;
	
	

}
