package com.zps.machine.mathematic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

//import de.lmu.ifi.dbs.elki.math.MeanVariance;
import java.awt.Color;
import java.io.IOException;
import java.lang.Object;



public class NodeObjects {
	
	static SignalFrimework signalFrimework = new SignalFrimework();
	static String[] parseL44;
	//static String[] parseL4;
	static Clustering calculateClustering = new Clustering();
	static Functions functions1111 = new Functions();
	static Functions functions2222 = new Functions();
	static Functions functions11 = new Functions();
	static Functions functions12 = new Functions();
	static Functions functions12223 = new Functions();
	
	static Functions functions = new Functions();
	Functions functions1 = new Functions();
	static CalcPart1 calc1 = new CalcPart1();
	static CalculateMetrix metrix = new CalculateMetrix();
	//static List<List<Object>> dynamicND = new ArrayList<List<Object>>();
	static List<List<Object>> dynamicND1 = new ArrayList<List<Object>>();
	static JSONObject obj = null;
	static JSONArray mToolData = null;
	
public   List<Object>  getNodeObjects(Statement st,String timestampPoint1, String timestampPoint2,String machineToolNumber) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException {
		
       
        List<Object> nodeObjects = new ArrayList<Object>();
        List<List<Object>> dynamicND = new ArrayList<List<Object>>();
        String[] parseL4 = null;
		String sql = "select msr_json, msr_txdt from opcmsr where msr_txdt between "+timestampPoint1+"and"+timestampPoint2+ "AND dev_id0 ="+machineToolNumber ;
		ResultSet rs = st.executeQuery(sql);
		 rs = st.executeQuery(sql);
		/* Dynamically Create N-Dimensional Matrix */
		 parseL4 = functions.takeDataFromDB(rs, parseL4, dynamicND,nodeObjects);
		System.out.println(" Dynamic 2D size: " + dynamicND.size());
		return nodeObjects;

	}


/* Tohle Opravit !!! ***/
public List<List<Object>>  getNodeValues(Statement st,String timestampPoint1, String timestampPoint2,String machineToolNumber,
		List<Object> timestampDB) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException {
		
	List<List<Object>> dynamicND = new ArrayList<List<Object>>();
	try {
	    
	    String[] parseL4 = null;
        List<Object> nodeObjects = new ArrayList<Object>();
		String sql = "select msr_json, msr_txdt from opcmsr where msr_txdt between "+timestampPoint1+"and"+timestampPoint2+ "AND dev_id0 ="+machineToolNumber ;
		   ResultSet rs = st.executeQuery(sql);
		 rs = st.executeQuery(sql);
		/* Dynamically Create N-Dimensional Matrix */
		parseL4 = functions.takeDataFromDB(rs, parseL4, dynamicND,nodeObjects);
		System.out.println(" Data Size Step 1 !!!"+parseL4.length);
		System.out.println(" Dynamic ND size Step 1 !!!"+dynamicND.size());
		functions.fillDataFromDB(rs, parseL4, dynamicND, obj, mToolData,timestampDB);
		System.out.println(" Data Size Step 2 !!!"+parseL4.length);
		System.out.println(" Dynamic ND size Step 2 !!!"+dynamicND.size());
	
		return dynamicND;
	}catch(Exception e) {}
    
	return dynamicND;
	}

}
