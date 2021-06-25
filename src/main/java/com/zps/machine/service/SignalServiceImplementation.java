package com.zps.machine.service;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.simple.parser.ParseException;

import com.zps.machine.mathematic.NodeObjects;
import com.zps.machine.model.SignalModel;

public class SignalServiceImplementation implements SignalService {
	
	@SuppressWarnings("null")
	public List<SignalModel> GetAllSignals(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException {
		
		return  SignalWrapper.GetAllSignals(stmt, timestampPoint1, timestampPoint2, machineToolNumber,
				timestampDB);
	}
	
	public SignalModel GetAllSignalValues(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException{
		return SignalValuesWrapper.GetAllSignalsValues(stmt, timestampPoint1, timestampPoint2, machineToolNumber,
				timestampDB);
	}

}

class  SignalWrapper {
	
	static  List<SignalModel> GetAllSignals(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException{
		
		List<SignalModel> signalsList  = new ArrayList<SignalModel>();
		
		NodeObjects nodes = new NodeObjects();

		List<Object> nodeObjects =  nodes.getNodeObjects( stmt, timestampPoint1,  timestampPoint2,machineToolNumber);
		
		List<List<Object>>nodeValues =  nodes.getNodeValues(stmt, timestampPoint1, timestampPoint2, machineToolNumber, timestampDB);
		 

        try {
        	SignalModel signals = new SignalModel()  ; 
        	
		for(int i = 0 ; i < nodeObjects.size(); i ++) {
			signals.setSignalName(nodeObjects.toString());
			signals.setSignalValues(nodeValues);
			signalsList.add(signals);
			break;
		}  
		
        }catch(Exception e) {System.out.println(" Connection Err");}
        
        return signalsList;
	}
	
}



class  SignalValuesWrapper {
	
	static SignalModel GetAllSignalsValues(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException{
		
		
		List<List<Object>> nodeValues = null;
		NodeObjects nodes = new NodeObjects();
		SignalModel signals = new SignalModel();
		try {
		 nodeValues =  nodes.getNodeValues(stmt, timestampPoint1, timestampPoint2, machineToolNumber, timestampDB);
		 signals.setSignalValues(nodeValues);
		
		}catch(Exception e) {}
        
        return signals;
	}
	
}
