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
import java.lang.Object;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.XYPlot;
import org.jfree.data.xy.XYDataset;
import java.awt.Dimension;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;


//import org.junit.Test;

public class Data extends JFrame{
	/******* Variables *******/
	static SignalFrimework signalFrimework = new SignalFrimework();
	static String[] parseL44;
	static String[] parseL4;
	static Clustering calculateClustering = new Clustering();
	static Functions functions1111 = new Functions();
	static Functions functions2222 = new Functions();
	static Functions functions11 = new Functions();
	static Functions functions12 = new Functions();
	static Functions functions12223 = new Functions();
	static JSONObject obj = null;
	static JSONArray mToolData = null;
	JSONParser parser = new JSONParser();
	static double[] arrayEigenValue = null;
	static double[][] eigneVectors = null;
	static Functions functions = new Functions();
	Functions functions1 = new Functions();
	static CalcPart1 calc1 = new CalcPart1();
	static CalculateMetrix metrix = new CalculateMetrix();
	//static String timestampPoint1 = null;
	//static String timestampPoint2 = null;
	static List<List<Object>> dynamicND = new ArrayList<List<Object>>();
	static List<List<Object>> dynamicND1 = new ArrayList<List<Object>>();

    /******** End ********/
	
	
	/******* Constructors **********/
	  public Data(double[] arr1, double[] arr2) {
	    XYDataset dataset = signalFrimework.createDataset(arr1, arr2);
	    // Create chart
	    JFreeChart chart = ChartFactory.createScatterPlot(
	        "PCA MAtrix", 
	        "PCA1-Axis", "PCA2-Axis", dataset);
	    //Changes background color
	    XYPlot plot = (XYPlot)chart.getPlot();
	    plot.setBackgroundPaint(new Color(255,228,196));
	    // Create Panel
	    ChartPanel panel = new ChartPanel(chart);
	    setContentPane(panel);
	  }
	 

	  public Data(String appTitle, double[][] arr) {
	    super(appTitle);
	    // Create Dataset
	    CategoryDataset dataset = signalFrimework.createDataset( arr);
	    //Create chart
	    JFreeChart chart=ChartFactory.createBarChart(
	        "Principal Components", //Chart Title
	        "PC", // Category axis
	        "Freq", // Value axis
	        dataset,
	        PlotOrientation.VERTICAL,
	        true,true,false
	       );
	    ChartPanel panel=new ChartPanel(chart);
	    setContentPane(panel);
	  }
	  /********** End ***********/
	  
	/***** Execute Function 
	 * @throws IOException 
	 * @throws java.text.ParseException *****/
	
	public static  double[][] execute(List<List<Object>> dynamicND) throws SQLException, JSONException, ParseException, IOException, java.text.ParseException {
		
		
		
        List<Object> timestampDB22 = new ArrayList<Object>();
        List<Object> nodeObjects = new ArrayList<Object>();
        List<Object> nodeObjects1 = new ArrayList<Object>();
        //String sql1 = "select msr_json, msr_txdt from opcmsr where" + " dev_id0 ="+machineToolNumber ;
        //ResultSet rs = st.executeQuery(sql1);
       // parseL44 = functions12223.takeDataFromDB(rs, parseL44, dynamicND1,nodeObjects1);
        //functions12223.fillDataFromDB(rs, parseL44, dynamicND1, obj, mToolData,timestampDB22);
	
		//String sql = "select msr_json, msr_txdt from opcmsr where msr_txdt between "+timestampPoint1+"and"+timestampPoint2+ "AND dev_id0 ="+machineToolNumber ;
		// rs = st.executeQuery(sql);
		// System.out.println(rs.getString(1));
		System.out.println(" Start: ");
		
		/* Dynamically Create N-Dimensional Matrix */
		//parseL4 = functions.takeDataFromDB(rs, parseL4, dynamicND,nodeObjects);
		//System.out.println(" Dynamic 2D size: " + dynamicND.size());
		//functions.fillDataFromDB(rs, parseL4, dynamicND, obj, mToolData,timestampDB);
		double[][] clusteringPC = new double[0][0];
		double[][] buildPC = new double[0][0];
		try {
			
			 buildPC = calc1.buildPComponents(functions, dynamicND, arrayEigenValue,eigneVectors,
					   signalFrimework,   nodeObjects);
			 //for(int i = 1 ; i < buildPC[1].length; i ++ ) {
			//System.out.println(" PC2: "+buildPC[1][i]);
			 //}
			/**** End ****/
			 System.out.println(" Start Clustering: ");
			 clusteringPC = calc1.PrincipalComponentsClustering(buildPC, signalFrimework, metrix,calculateClustering);
			 //functions12223 = null;
			 //functions = null;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return clusteringPC;

	}
}


class Complex {
	public final double re;
	public final double im;

	public Complex() {
		this(0, 0);
	}

	public Complex(double r, double i) {
		re = r;
		im = i;
	}

	public Complex add(Complex b) {
		return new Complex(this.re + b.re, this.im + b.im);
	}

	public Complex sub(Complex b) {
		return new Complex(this.re - b.re, this.im - b.im);
	}

	public Complex mult(Complex b) {
		return new Complex(this.re * b.re - this.im * b.im, this.re * b.im + this.im * b.re);
	}

	@Override
	public String toString() {
		String result = re+" , " + im;
		return result;
	}
}