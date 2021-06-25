package com.zps.machine.helpers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CsvHelper {
	
	/**
     * Size of a byte buffer to read/write file
     */
 	
	private static final int BUFFER_SIZE = 4096;
	
	public CsvHelper() {}
	
/* Download from webpage Method */
	// Vzito z: https://www.codejava.net/frameworks/spring/spring-mvc-sample-application-for-downloading-files
	
	public void doDownload(String filepath,HttpServletRequest request,
            HttpServletResponse response) throws IOException {
 
        // get absolute path of the application
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");
        System.out.println("appPath = " + appPath);
 
        // construct the complete absolute path of the file
        //String fullPath = appPath + filePath;    
		String fullPath = filepath;
        File downloadFile = new File(fullPath);
        FileInputStream inputStream = new FileInputStream(downloadFile);
         
        // get MIME type of the file
        String mimeType = context.getMimeType(fullPath);
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        System.out.println("MIME type: " + mimeType);
 
        // set content attributes for the response
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());
 
        // set headers for the response
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"",
                downloadFile.getName());
        response.setHeader(headerKey, headerValue);
 
        // get output stream of the response
        OutputStream outStream = response.getOutputStream();
 
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead = -1;
 
        // write bytes read from the input stream into the output stream
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
 
        inputStream.close();
        outStream.close();
 
    }

	/* Write to Csv Method */
	public String WriteMatrixToCSV(String[] nodesSignal,List<List<Object>> signalValues, String fileFormat) throws IOException {
		
		Random rndK = new Random();
		int year = 2000;
		String filePath = "C:\\Users\\spravce\\eclipse-workspace\\WebDevAnalyticInterface\\fullSignalMatrix."+fileFormat;
		FileWriter writer = new FileWriter(filePath);
		StringBuilder sb = new StringBuilder();
	 
		for (int i = 0; i < nodesSignal.length; i++) {
			if(nodesSignal[i].contains("[") ) {
				nodesSignal[i] = nodesSignal[i].replace("[", "");
			}
			
			if( nodesSignal[i].contains("]")) {
				nodesSignal[i] = nodesSignal[i].replace("]", "");
			}
			// Tady nekde pridat timestamp 
		
			writer.append(nodesSignal[i]);
		}
		
		for (int j = 0; j <  signalValues.get(0).size(); j++) {
			
			sb.append("\n");
			for (int i = 0; i < signalValues.size(); i++) {
				// Tady nekde pridat datumy
				if(i == 0) {
					// Tady pridat tridu rand
					Random random = new Random();
					int min = 1850;
					int max = 2014;
					int min1 = 01;
					int max2 = 12;
					
					int min11 = 1972;
					int max11 = 2200;
					/*int date1 = random.ints(min, max)
						      .findFirst()
						      .getAsInt();*/
					int date2 = random.ints(min1, max2)
						      .findFirst()
						      .getAsInt();
					
					int date44 = random.ints(min11, max11)
							.findFirst()
						      .getAsInt();
					//sb.append("\"1990/1991\""+","+String.valueOf(j)+","+"\"1990-0"+String.valueOf(date2)+"-"+String.valueOf(date1)+"\""+ ",");
					//sb.append(String.valueOf(min+j)+"/"+String.valueOf(date2) + ",");
					/*String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new java.util.Date());*/
					long timeInNanos = System.nanoTime();
					String timeStamp = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss."+String.valueOf(j)).format(new java.util.Date());
						//sb.append(String.valueOf((date44))+"-"+String.valueOf(rndK.nextInt((12 - 10) + 1) + 10)+"-"+String.valueOf(rndK.nextInt((30 - 10) + 1) + 10)+",");
					//sb.append(String.valueOf((1972+j))+"-"+String.valueOf(rndK.nextInt((12 - 10) + 1)+ 10)+"-"+String.valueOf(rndK.nextInt((30 - 10) + 1) + 10)+",");
					
					sb.append(timeStamp+",");
					
				}
				if(i < signalValues.size() - 1) {
					sb.append(signalValues.get(i).get(j).toString().trim() + ",");
					}
					 else {
						 sb.append(signalValues.get(i).get(j).toString().trim());
					 }
				
			}
			
		}
		writer.write(sb.toString());
		writer.flush();
		writer.close();
		
		
		return filePath;
	
	}
	
	/* Write Array to TXT File */
	public static void writeArrayToTXT(double[] prvky, String filename) {
		
		System.out.println(" We are here !!! ");
		try {
	        FileWriter writer = new FileWriter(filename, true);
	        for (int i = 0; i < prvky.length; i++) {
	            //for (int j = 0; j < prvky[i].length; j++) {
	                  //writer.write(prvky[i][j]+" ";
	        	writer.write(prvky[i]+" ");
	            //}
	            //this is the code that you change, this will make a new line between each y value in the array
	            writer.write("\n");   // write new line
	        }
	        writer.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	/* End Write Array to TXT File */
	
	
	/* Write Array to TXT File */
	public static void writeArrayToTXT1(List<Object> prvky, String filename) {
		
		System.out.println(" We are here !!! ");
		try {
	        FileWriter writer = new FileWriter(filename, true);
	        for (int i = 0; i < prvky.size(); i++) {
	            //for (int j = 0; j < prvky[i].length; j++) {
	                  //writer.write(prvky[i][j]+" ";
	        	writer.write(prvky.get(i)+" ");
	            //}
	            //this is the code that you change, this will make a new line between each y value in the array
	            writer.write("\n");   // write new line
	        }
	        writer.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	/* End Write Array to TXT File */
	
	
	
	
	

}
