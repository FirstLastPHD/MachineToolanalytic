package com.zps.machine.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.simple.parser.ParseException;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.zps.machine.config.PsqlDBConfig;
import com.zps.machine.mathematic.CalcPart1;
import com.zps.machine.mathematic.Data;
import com.zps.machine.mathematic.NodeObjects;
import com.zps.machine.mathematic.SignalFrimework;
import com.zps.machine.model.DeviceModel;
import com.zps.machine.model.OpcMsrModel;
@Service
public class OpcMsrServiceImplementation implements OpcMsrService {

	@Override
	public List<OpcMsrModel> GetOpcMsrObject(Statement stmt, String dev_id0, String rangeFrom, String rangeTo) throws SQLException {
		// TODO Auto-generated method stub
		return OpcMsrWrapper.GetFullOpcMsrObject( stmt,  dev_id0,  rangeFrom,  rangeTo) ;
	}
	
	public double[][] GetClusteringPCA(List<List<Object>> dynamicND) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException{
		
		double[][] pcaMatrix = Data.execute( dynamicND);
		return pcaMatrix;
	}
	
	public double[][] ReturnPCAComponents(com.zps.machine.mathematic.Functions functions, List<List<Object>> dynamicND,
			  double[] arrayEigenValue,double[][] eigneVectors,SignalFrimework signalFrimework,List<Object> nodeObjects) throws NumberFormatException, IOException
	{
		CalcPart1 calc1 = new CalcPart1();
		double[][] nativePCA = calc1. buildPComponents(functions,  dynamicND, arrayEigenValue, eigneVectors,
				  signalFrimework,nodeObjects);
		return nativePCA;
	}
	
	
	public List<Object> ReturnDeviceNodes(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException{
		NodeObjects nodes = new NodeObjects();
		List<Object> nodeObjects =  nodes.getNodeObjects( stmt, timestampPoint1,  timestampPoint2,machineToolNumber);
		
		return nodeObjects;
	}
	
	public List<List<Object>> ReturnDeviceNodeValues(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException{
		NodeObjects nodes = new NodeObjects();
		
		List<List<Object>> nodeObjectValues =  nodes.getNodeValues( stmt, timestampPoint1,  timestampPoint2,machineToolNumber,timestampDB);
		
		return nodeObjectValues;
	}
	
	public List<OpcMsrModel> getPCAState(){
		
		List<OpcMsrModel> opcMsrList  = new ArrayList<OpcMsrModel>();
		OpcMsrModel opcmsr = new OpcMsrModel();
		OpcMsrModel opcmsr1 = new OpcMsrModel();
		opcmsr.setPcaState(" Include PCA Computition ");
		opcMsrList.add(opcmsr);
		opcmsr1.setPcaState(" Not Include PCA Computition ");
		opcMsrList.add(opcmsr1);
		
		return opcMsrList;
	}
	
	
}

class  OpcMsrWrapper {
	
	static  List<OpcMsrModel> GetFullOpcMsrObject(Statement stmt, String dev_id0, String rangeFrom, String rangeTo ){
		
		List<OpcMsrModel> opcMsrList  = new ArrayList<OpcMsrModel>();
        try {
         
        	
        	 String getFullOpcMsrObject = " SELECT dev_id0, msr_txdt FROM opcmsr where dev_id0 = " +dev_id0+ " and (msr_id0 between  "+rangeFrom+" and "+rangeTo+") order by msr_id0 ";
        	 System.out.println(getFullOpcMsrObject);
		ResultSet rs = stmt.executeQuery(getFullOpcMsrObject);
		while (rs.next()) {
			OpcMsrModel opcmsr = new OpcMsrModel()  ;
			//opcmsr.setMsr_id0(Integer.parseInt(new String(rs.getBytes("msr_id0"), StandardCharsets.UTF_8)));
			opcmsr.setDev_id0(Integer.parseInt(new String(rs.getBytes("dev_id0"), StandardCharsets.UTF_8)));
			//opcmsr.setNod_id0(Integer.parseInt(new String(rs.getBytes("nod_id0"), StandardCharsets.UTF_8)));
			//opcmsr.setMsr_idp(Integer.parseInt(new String(rs.getBytes("msr_idp"), StandardCharsets.UTF_8)));
			//opcmsr.setMsr_json(new String(rs.getBytes("msr_json"), StandardCharsets.UTF_8));
			//opcmsr.setMsr_tim1(Integer.parseInt(new String(rs.getBytes("msr_tim1"), StandardCharsets.UTF_8)));
			//opcmsr.setMsr_tim2(Integer.parseInt(new String(rs.getBytes("msr_tim2"), StandardCharsets.UTF_8)));
			//opcmsr.setMsr_dscr(new String(rs.getBytes("msr_dscr"), StandardCharsets.UTF_8));
			opcmsr.setMsr_txdt(new String(rs.getBytes("msr_txdt"), StandardCharsets.UTF_8));
			
			opcMsrList.add(opcmsr);

		}  
        }catch(Exception e) {System.out.println(" Connection Err");
        System.out.println(e);}
        
        return opcMsrList;
	}
	
}
