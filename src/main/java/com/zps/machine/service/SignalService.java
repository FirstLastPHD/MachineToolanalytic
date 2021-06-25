package com.zps.machine.service;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.json.JSONException;
import org.json.simple.parser.ParseException;

import com.zps.machine.model.SignalModel;

public interface SignalService {
	
	public List<SignalModel> GetAllSignals(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException;
	
	public SignalModel GetAllSignalValues(Statement stmt,String timestampPoint1, String timestampPoint2, String machineToolNumber,
			List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException;

}
