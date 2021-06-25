package com.zps.machine.mathematic;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.swing.SwingWorker;

import org.apache.commons.math3.linear.EigenDecomposition;
import org.apache.commons.math3.linear.MatrixUtils;
import org.apache.commons.math3.linear.RealMatrix;
import org.apache.commons.math3.linear.RealVector;
import org.apache.commons.math3.stat.correlation.Covariance;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.knowm.xchart.QuickChart;
import org.knowm.xchart.SwingWrapper;
import org.knowm.xchart.XYChart;

public class Functions {

	MySwingWorker mySwingWorker;
	SwingWrapper<XYChart> sw;
	XYChart chart;
	static List<String> valuesDesc = new ArrayList<String>();

	/* Reading Data From DB */
	/* Create Objects for Table Data */
	public String[] takeDataFromDB(ResultSet rs, String[] parseL4, List<List<Object>> dynamicND,
			List<Object> nodeObjects) throws SQLException, IOException {

		while (rs.next()) {

			String id = new String(rs.getBytes("msr_json"), StandardCharsets.UTF_8);
			
			/* When local DB is used */
			
			/*String parseL1 = id.replace("{", "");
			String parseL2 = parseL1.replace("}", "");
			String parseL3 = parseL2.replaceAll("\"", "");
			parseL4 = parseL3.split("[|,|:|]");*/
			//String[] parseL5 = parseL3.split("[|,|:|]");
			
			/* END */
			
			/* When used Real Server */
			
			String parseL0 = id.replace("\"ns=2;s=Condition Monitoring\":", "");
			String parseL1 = parseL0.trim().replace("{", " ");
			String parseL2 = parseL1.replace("}", " ");
			String parseL3 = parseL2.replaceAll("\"", "");
			//: {
			String parseL3a = parseL3.replaceAll(":  ", "XX");
			String parseL3b = parseL3a.replaceAll("ns=2;", "");
			String parseL3c = parseL3b.replaceAll("Machine data.CUSTOMERXXMachine data.CUSTOMERXX", "Machine data.CUSTOMERXXMachine data.CUSTOMERXX: NULL");
			String parseL3d = parseL3c.replaceAll("Machine data.ALARM_LISTXXMachine data.ALARM_LISTXX", "Machine data.ALARM_LISTXXMachine : data.ALARM_LISTXX");
			String parseL3e = parseL3d.replaceAll("TAJMAC-ZPS, a.s. ", "TAJMAC-ZPS a.s. ");
			//String parseL3a = parseL3.replaceAll(": {", "");
			//String parseL3a = parseL3.replaceAll("{", "");
			//String parseL3b = parseL3a.replaceAll("}", "");
			System.out.println(" Parse L3: "+parseL3e);
			parseL4 = parseL3e.split("[|,|:|]");
			
			/* END */
			
			/* Writing Regular Expression here */
			//String parseL0 = id.replace("\"Condition Monitoring\":", "");

			// System.out.println(" Condition Monitoring: "+parseL0);
			// System.out.println(parseL0);
			// String parseL1 = parseL0.replace("{", "");
			 
			//String parseL1 = parseL0.trim().replace("{ {", " ");
			//String parseL2 = parseL1.replace("}}", " ");
			

			for (int j = 0; j < parseL4.length; j = j + 2) {
				nodeObjects.add(parseL4[j]);
				valuesDesc.add(parseL4[j].replace('.', '_').toString().trim() + ",");
				if (j + 2 == parseL4.length - 1) {
					valuesDesc.add(parseL4[j].toString().trim());
				}
				// writer.append(parseL5[j].toString());
			}

			for (int j = 1; j < parseL4.length; j = j + 2) {
				// if(j%2 !=0) {
				// myList.add(parseL4[j])
				// System.out.println(parseL4[j]);
				dynamicND.add(new ArrayList<Object>());
				// }
			}
			break;
		}

		/*
		 * writer.flush(); writer.close();
		 */
		/* When used local Server */
		for(int i = 0; i < parseL4.length; i++) {
		System.out.println(" Parse L4 Level: "+ parseL4[i]);
		}
		return parseL4;
	}

	/* Fill Array of Objects */
	public void fillDataFromDB(ResultSet rs, String[] parseL4, List<List<Object>> dynamicND, JSONObject obj,
			JSONArray mToolData, List<Object> timestampDB) throws SQLException, JSONException {

		/* Dynamically Fill N-Dimensional Matrix */
		while (rs.next()) {
			String id = new String(rs.getBytes("msr_json"), StandardCharsets.UTF_8);
			
			/* When used Local Server */
			
			/*String parseL1 = id.replace("{", "");
			 String parseL2 = parseL1.replace("}", "");*/
			//String parseL1 = parseL0.trim().replace("{ {", " ");
			//String parseL2 = parseL1.replace("}}", " ");
			/*String parseL3 = parseL2.replaceAll("\"", "");
			parseL4 = parseL3.split("[|,|:|]");*/
			
			/* End */
			
			/* When Real Server is used */
			
			String parseL0 = id.replace("\"ns=2;s=Condition Monitoring\":", "");
			String parseL1 = parseL0.trim().replace("{", " ");
			String parseL2 = parseL1.replace("}", " ");
			String parseL3 = parseL2.replaceAll("\"", "");
			//: {
			String parseL3a = parseL3.replaceAll(":  ", "XX");
			String parseL3b = parseL3a.replaceAll("ns=2;", "");
			String parseL3c = parseL3b.replaceAll("Machine data.CUSTOMERXXMachine data.CUSTOMERXX", "Machine data.CUSTOMERXXMachine data.CUSTOMERXX: NULL");
			String parseL3d = parseL3c.replaceAll("Machine data.ALARM_LISTXXMachine data.ALARM_LISTXX", "Machine data.ALARM_LISTXXMachine : data.ALARM_LISTXX");
			String parseL3e = parseL3d.replaceAll("TAJMAC-ZPS, a.s. ", "TAJMAC-ZPS a.s. ");
			//String parseL3a = parseL3.replaceAll(": {", "");
			//String parseL3a = parseL3.replaceAll("{", "");
			//String parseL3b = parseL3a.replaceAll("}", "");
			System.out.println(" Parse L3: "+parseL3e);
			parseL4 = parseL3e.split("[|,|:|]");
			
			/* End */
			
			//String dates = new String(rs.getBytes("msr_txdt"), StandardCharsets.UTF_8);

			// String parseL1 = id.replace("{", "");
			// String parseL2 = parseL1.replace("}", "");
			//String parseL0 = id.replace("\"Condition Monitoring\":", "");

			// System.out.println(" Condition Monitoring: "+parseL0);
			// System.out.println(parseL0);
			// String parseL1 = parseL0.replace("{", "");
			// String parseL1 = id.replace("{", "");
			// String parseL2 = parseL1.replace("}", "");
			//String parseL1 = parseL0.trim().replace("{ {", " ");
			//String parseL2 = parseL1.replace("}}", " ");
			//String parseL3 = parseL2.replaceAll("\"", "");
			//parseL4 = parseL3.split("[|,|:|]");
			// System.out.println(" Length: "+parseL4.length);
			for (int j = 1; j < parseL4.length; j = j + 2) {
				// System.out.println(" Parse Level4: "+parseL4[j]);
				dynamicND.get(j / 2).add(parseL4[j]);
				//timestampDB.add(dates);
				// System.out.println(dates);
			}
			obj = new JSONObject(id);
			mToolData = obj.names();
		}
	}
	/* Reading Data From DB */

	/* Create Double Matrix From Dynamic array */

	public double[][] createMatrixArray(List<List<Object>> dynamicND) throws IOException {
		
		double[][] data1 = new double[dynamicND.size()][dynamicND.get(1).size()];
    try {
		for (int j = 0; j < dynamicND.get(0).size(); j++) {
			
			for (int i = 0; i < dynamicND.size(); i++) {
				data1[i][j] = (Double.parseDouble(dynamicND.get(i).get(j).toString()));
				//data1[i][j] = data1[i][j] * 100000.0;
				// System.out.print(" Input Data: "+ data1[i][j]+ " ");
				// writer.print(data1[i][j] + " ");
				// System.out.print(" Input Data: "+ data1[i][j]);
			}
			// System.out.println("\n");
		}
       }catch(Exception e) {}
		
		return data1;

	}

	/***** End ****/
	/**** Drawing Diagram ****/
	public double[] DrawSinDiagram(double[][] data1, int component, int size) {
		int n = data1[0].length;

		// the function y = sin(4x) + sin(20x), sampled at n+1 points
		// between x = 0 and x = pi
		double[] x = new double[n + 1];
		double[] y = new double[n + 1];
		for (int i = 0; i <= n - 1; i++) {
			x[i] = (Math.PI * i / n) * size;
			y[i] = Math.sin(4 * data1[component][i] * size) + Math.sin(20 * data1[component][i] * size);
		}

		return y;

	}

	/**** END ****/

	/********** PCA --- Section ********/
	/**** Computing Covariance Matrix and eigne values and eigne vectors ****/
	public double[] CovarianceMatrix(double[][] data1, double[] arrayEigenValue) {

		try {
			RealMatrix mx = MatrixUtils.createRealMatrix(data1);
			RealMatrix cov = new Covariance(mx).getCovarianceMatrix();
			// System.out.println(" We are here : ");
			EigenDecomposition e = new EigenDecomposition(cov);

			arrayEigenValue = e.getRealEigenvalues();

			
			 for(int i = 0; i < arrayEigenValue.length; i++) {
				 arrayEigenValue[i] = Math.round(arrayEigenValue[i]* 10000000.0) / 10000000.0;
			 //System.out.println(" Eigne VAlues "+arrayEigenValue[i]); }
			 }
			 
		} catch (Exception e) {
		}
		return arrayEigenValue;
	}

	public double[][] ReturnEigneVector(double[][] data1, double[][] eigneVectors, double[] arrayEigenValue) {

		
		System.out.println(" Breakepoint Eigne vector Controlling!!! ");
		try {
		RealMatrix mx = MatrixUtils.createRealMatrix(data1);
		RealMatrix cov = new Covariance(mx).getCovarianceMatrix();
		EigenDecomposition e = new EigenDecomposition(cov);
		arrayEigenValue = e.getRealEigenvalues();
		eigneVectors = new double[e.getRealEigenvalues().length][e.getRealEigenvalues().length];
		for (int i = 0; i < e.getRealEigenvalues().length; i++) {
			RealVector arrayEigenVector = null;
			arrayEigenVector = e.getEigenvector(i);
			for (int j = 0; j < arrayEigenVector.getDimension(); j++) {
				if (!Double.isNaN(arrayEigenVector.getEntry(j))) {
				eigneVectors[i][j] = (double) (arrayEigenVector.getEntry(j));
				//System.out.println(" Eigne Vector VAlue: "+eigneVectors[i][j]);
				}else {
					eigneVectors[i][j] = 0.0;
				}
			}
		}}
		catch(Exception e) {}
		return eigneVectors;
	}

	/******* END ******/
	public Object[][] calculatingEigneValAndVect(double[][] matrix) {

		double a = matrix[0][0];
		double b = matrix[0][1];
		double c = matrix[1][0];
		double d = matrix[1][1];
		Object[][] res = null;
		List<Double> eigneVectorX = new ArrayList<Double>();
		List<Double> eigneVectorY = new ArrayList<Double>();
		List<Double> eigneValue = new ArrayList<Double>();
		// double[][] eigenValue = new double[2][matrix[0].length];

		double eigenvalue1 = ((a + d) + Math.sqrt(Math.pow(a - d, 2) + 4 * b * c)) / 2;
		double eigenvalue2 = ((a + d) - Math.sqrt(Math.pow(a - d, 2) + 4 * b * c)) / 2;

		// store the basis in a 2 element array
		double[] basis = new double[matrix[0].length];
          try {
		for (double y = -1000; y <= 1000; y++) {
			for (double x = -1000; x <= 1000; x++) {
				if (((a - eigenvalue1) * x + b * y == 0) && (c * x + (d - eigenvalue1) * y == 0)) {
					//System.out.println("Eigenvector1: (" + x + "," + y + ")");
					eigneVectorX.add(x);
					eigneVectorY.add(y);
					eigneValue.add(eigenvalue1);
					basis[0] = eigenvalue1;
				}
			}
		}

		for (double y = -10; y <= 10; y++) {
			for (double x = -10; x <= 10; x++) {
				if (((a - eigenvalue2) * x + b * y == 0) && (c * x + (d - eigenvalue2) * y == 0)) {
					//System.out.println("Eigenvector2: (" + x + "," + y + ")");
					eigneVectorX.add(x);
					eigneVectorY.add(y);
					eigneValue.add(eigenvalue1);
					basis[1] = eigenvalue2;
				}
			}
		}
		 res = new Object[][]{ eigneVectorX.toArray(), eigneVectorY.toArray(), eigneValue.toArray() };
		/*
		 * for(int i =0; i <basis.length; i++) {
		 * System.out.println(" Eigne Val: "+basis[i]); }
		 */
          }catch(Exception e) {}
		return res;
	}

	/*********** Computing PCA Components **********************/

	/* Build Principal Component Analyze */
	static double[][] buildPrincipalComponents1(int numComponents, double[][] vectors, double[] vals) {
		double[][] PC = {};
		System.out.println(" Breakepoint PCA Calculating!!!!! ");
		try {
		if (numComponents > vals.length) {
			throw new RuntimeException("Cannot produce more principal components than those provided.");
		}
		boolean[] chosen = new boolean[vals.length];
		double[][] vecs = vectors;
		 PC = new double[numComponents][];
		for (int i = 0; i < PC.length; i++) {
			int max = 0;
			while (chosen[max]) {
				max++;
			}
			for (int j = 0; j < vals.length; j++) {
				if (Math.abs(vals[j]) > Math.abs(vals[max]) && !chosen[j]) {
					max = j;
				}
			}
			chosen[max] = true;
			PC[i] = vecs[max];
		}}catch(Exception e) {}
		return PC;
	}

	/************** Plot Sine Time Series Graph ************************/
	public void go(double[] y) {

		// Create Chart
		chart = QuickChart.getChart(" PCA Components ", "Attemps", "Value", "randomWalk", new double[] { 0 },
				new double[] { 0 });
		chart.getStyler().setLegendVisible(false);
		chart.getStyler().setXAxisTicksVisible(true);

		// Show it
		sw = new SwingWrapper<XYChart>(chart);
		sw.displayChart();

		mySwingWorker = new MySwingWorker(y);
		mySwingWorker.execute();
	}

	private class MySwingWorker extends SwingWorker<Boolean, double[]> {

		final LinkedList<Double> fifo = new LinkedList<Double>();
		double[] pcaArr = null;

		public MySwingWorker(double[] pcaArr) {
			this.pcaArr = pcaArr;
			fifo.add(0.0);
		}

		@Override
		protected Boolean doInBackground() throws Exception {

			while (!isCancelled()) {

				fifo.add(fifo.get(fifo.size() - 1) + Math.random() - .5);
				if (fifo.size() > 500) {
					fifo.removeFirst();
				}
				double[] arrayIndex = new double[pcaArr.length];
				double[] array = new double[pcaArr.length];
				for (int i = 0; i < pcaArr.length; i++) {
					array[i] = pcaArr[i];
					// arrayIndex[i] = i;
				}
				publish(array);
				// publish(arrayIndex);
				try {
					Thread.sleep(5);
				} catch (InterruptedException e) {
					// eat it. caught when interrupt is called
					System.out.println("MySwingWorker shut down.");
				}
			}

			return true;
		}

		@Override
		protected void process(List<double[]> chunks) {

			// System.out.println("number of chunks: " + chunks.size());

			double[] mostRecentDataSet = chunks.get(chunks.size() - 1);

			chart.updateXYSeries("randomWalk", null, mostRecentDataSet, null);
			sw.repaintChart();

			long start = System.currentTimeMillis();
			long duration = System.currentTimeMillis() - start;
			try {
				Thread.sleep(40 - duration); // 40 ms ==> 25fps
				// Thread.sleep(400 - duration); // 40 ms ==> 2.5fps
			} catch (InterruptedException e) {
				System.out.println("InterruptedException occurred.");
			}
		}
		
		/*private  void writeDoublesToOutput(
			    final double start,
			    final double threshold,
			    final double delta,
			    final String label,
			    final Format format) {
			    //System.out.println(generateHeader(label));
			    double doubleValue = start;
			    do {
			        //out.println("= " + format.fromDouble(doubleValue));
			        doubleValue += delta;
			    }
			    while (doubleValue < threshold);
			}*/
	}
	/* End */

}