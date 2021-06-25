package com.zps.machine.helpers;

public class VibrationCalculation {
	
	
	/* Calculate Distancies in TimeSeries */
	public double[] CalculateDistancies(double[] inputData ) {
		
		double[] distancies = new double[inputData.length];
		// Calculate distancies ( I think so that is good )
		try {
		for(int i = 0 ; i < inputData.length; i++) 
			distancies[i] = inputData[i] - inputData[i+1];
		}catch(Exception e) {}
		
		return distancies;	
	}
/* End Calculate Distancies */
/* Calculate Velocity */
   public double[] CalculateVelocity(double[] distancies, int time) {
	   
	 //Probably /2 means time for exmp /time Calculating Velolcity (distanceS[2]-distanceS[0])/2 == (distanceS[i]-distanceS[i+2])/2
	   double[] velocity = new double[distancies.length];
	   try {
	   for(int i = 0; i < distancies.length; i++) 
			velocity[i] =  (distancies[i]-distancies[i+2])/time;
			//velocity[i] =  (distanceS[i]-distanceS[i+2])/2;
	   }catch(Exception e) {}
	   
	   return velocity;		
   }
 /* End Calculate Velocity */  
 /* Calculate Acceleration */
  public double[] CalculateAcceleration(double[] velocity, int time) {
	  
	  double[] acceleration = new double[velocity.length];
	  try {
	  for(int i = 0; i < velocity.length; i++) 
				acceleration[i] =  (velocity[i]-velocity[i+2])/time;
	  }catch(Exception e) {}
			
	  return acceleration;
	  
  }
  /* End Calculate Velocity */
  /* Calculate Kinetic Energy */
  public double[] CalculateKineticEnergy(double[] velocity) {
	//Kinetic Energy Ek(j) Calculation 0.5*3*POWER(C,2)  3 - is mass
	  double[] ekJ = new double[velocity.length];
	  try {
	  for(int i = 0; i < velocity.length; i++) 
				ekJ[i] =  0.5*3*Math.pow(velocity[i], 2);
	  }catch(Exception e) {}
	  
	  return ekJ;
					
  }
 /* End Calculate kinetic Energy */ 
  
  /* Signal Amplitude calculation */
	public  double[] CalculateAmplitude(double[] tempBuffer) {
		
		double[] amplitudeArr = new double[tempBuffer.length];
		double  amplitude = 0;
		try {
	      for (int j = 0; j < tempBuffer.length; j = j +2 ){
	          if (tempBuffer[j] > tempBuffer[j+1]) {
	              amplitude = amplitude + tempBuffer[j] - tempBuffer[j+1];
	              amplitudeArr[j] = amplitude;
	          }
	          else {amplitude = amplitude + tempBuffer[j + 1] - tempBuffer[j];
	          amplitudeArr[j] = amplitude;
	          }
	      }
	      //amplitude = amplitude / tempBuffer.length * 2;
	      for(int i = 0; i < amplitudeArr.length; i++) {
	    	  amplitudeArr[i] = amplitudeArr[i] / tempBuffer.length*2;
	      }
		}catch(Exception e) {}
		
		return amplitudeArr;
	}
	
	
	
public static double[] CalculateSignalAmplitude( double[] signal) {
		
		//1) Division by N: amplitude = abs(fft (signal)/N), where "N" is the signal length;
		//2) Multiplication by 2: amplitude = 2*abs(fft(signal)/N;
		//3) Division by N/2: amplitude: abs(fft (signal)./N/2);
		//4) Others follow Parseval's theorem: amplitude = abs(fft(signal)./factor), being "factor" equal 1/fs (fs - sampling frequency).
		//Parseval's theorem.  |x(t)| ^2 = |X(f)| ^2 
		double[] amplitude = new double[signal.length];
		for(int i = 0; i < signal.length; i++) {
			//amplitude[i] = Math.abs(signal[i]/signal.length);
			amplitude[i] = Math.abs(signal[i]/signal.length/2);
			//amplitude[i] = 2*Math.abs(signal[i]/signal.length);
		}
		return amplitude;
	}
	
  /* End Signal Amplitude Calculation */

}
