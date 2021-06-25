package com.zps.machine.mathematic;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.zps.machine.mathematic.Functions;

public class CalcPart1 {
	
	private static long time_start = 0;
	private static long time_stop = 0;
	private static long time2_start = 0;
	private static long time2_stop = 0;
	
  public CalcPart1() {}
  
  
  /***** Principal Component Analyze Calculating 
 * @throws IOException 
 * @throws NumberFormatException ******/
  public double[][] buildPComponents(com.zps.machine.mathematic.Functions functions, List<List<Object>> dynamicND,
		  double[] arrayEigenValue,double[][] eigneVectors,
		  SignalFrimework signalFrimework,List<Object> nodeObjects) throws NumberFormatException, IOException{
	  
	  double[][] data1 = functions.createMatrixArray(dynamicND);
	 
      /**************** Calculating PCA *******************/
		arrayEigenValue = functions.CovarianceMatrix(data1, arrayEigenValue);
		for(int  i = 1; i < arrayEigenValue.length; i++) {
			
			arrayEigenValue[i] = Math.round(arrayEigenValue[i]* 10000000.0) / 10000000.0;
			
		}
		eigneVectors = functions.ReturnEigneVector(data1, eigneVectors, arrayEigenValue);
		for(int  i = 1; i < eigneVectors.length; i++) {
			for(int j = 0; j < eigneVectors[i].length; j ++) {
			eigneVectors[i][j] = Math.round(eigneVectors[i][j] * 10000000.0) / 10000000.0;
			}
		}
		double[][] buildPC = functions.buildPrincipalComponents1(2, eigneVectors,arrayEigenValue);
    
		return buildPC;
  }
  
  /****** END 
 * @throws ParseException 
 * @throws InterruptedException 
 * @throws InvocationTargetException *******/
  public double[][] PrincipalComponentsClustering( double[][] buildPC, SignalFrimework signalFrimework,
		  CalculateMetrix metrix, Clustering calculateClustering) throws ParseException, InvocationTargetException, InterruptedException{

	//double[][] metr = {y,y1};
	  Functions functions = new Functions();
	  
	  Functions functions1111 = new Functions();
	 
		double[][] metrixFinal = metrix.getAllMatrix(buildPC, signalFrimework);
		for(int i = 0; i < metrixFinal.length; i ++) {
			for(int j = 0; j < metrixFinal[i].length; j ++) {
				metrixFinal[i][j] = Math.round(metrixFinal[i][j]* 10000000.0) / 10000000.0;
				
				
			}
		}
		double[] arrayEigenValueFinal = null;
		double[][] eigneVectorsFinal = null;
		Object[][] res = functions.calculatingEigneValAndVect(metrixFinal);
		arrayEigenValueFinal = functions.CovarianceMatrix(metrixFinal, arrayEigenValueFinal);
		eigneVectorsFinal = functions.ReturnEigneVector(metrixFinal, eigneVectorsFinal, arrayEigenValueFinal);
		
		double[][] calculatingDimensionalPC = functions1111.buildPrincipalComponents1(2, eigneVectorsFinal,arrayEigenValueFinal);
		
		int minPoints = 10;
		double eps = 6;
		
		List<Clustering.Point> points = new ArrayList<Clustering.Point>();
		System.out.println("Original Points: ");
		for ( int j = 0; j < calculatingDimensionalPC[0].length; ++j) {
			Clustering.Point p = calculateClustering.new Point(calculatingDimensionalPC[0][j],calculatingDimensionalPC[1][j]);
			points.add(p);
		}
		//Collections.sort(points);
		List<Clustering.Cluster> clusters =calculateClustering.getClusters(points, minPoints, eps);
		Object[] finallCluster = null;
		for ( Clustering.Cluster c : clusters ) {
			finallCluster = c.points.toArray();
		}
		
		double[][] clustersR = calculateClustering.CorrectClusterRes(finallCluster);
		
        
        return clustersR;
		//return null;
  }
  
  public void DrawData(double[][] data1,List<Object> nodeObjects) throws NumberFormatException, IOException {
	  
	  System.out.println(" Jaky merici hodnoty ze stroje budeme sledovat: ");
	  while(true) {
		  System.out.println(" Vyberte hodnotu ze seznamu: ");
		  for(int i = 0; i <nodeObjects.size(); i++) {
			  System.out.println(" Node Number: " +i+" "+nodeObjects.get(i));
		  }
		  BufferedReader bufferRead = new BufferedReader(new InputStreamReader(System.in));
		  //System.out.println(" Please write niumber from 1 -10: ");
		  try {
		  int number = Integer.parseInt(bufferRead.readLine().toString());
		  Functions func = new Functions();
			double[] signal1 = func.DrawSinDiagram(data1, number, 2);
			func.go(signal1);
			if(number == 0) {
				  break;
			  }
		  }
	  catch(NumberFormatException e) {}
	  
  }
	  
	  

}
  
	public static int getTimePeriod() {
		return (int) (time_stop - time_start);
	}
	
	/**
	 * @return
	 */
	public int getTimePeriodMeasure() {
		return (int) (time2_stop - time2_start);
	}
	
}