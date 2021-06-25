<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<script src='assets/js/plotly-latest.min.js'></script>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <h1>CNC Milling Machine Vibrodiagnostic Analysis is working success now!!!! </h1>
   
   <h1> Native Signal Diagram </h1>
    <div id='myDiv11'>
    </div>
    
    
    <h1> Acceleration[m/s^2]-  Y axes Vs Time[ms] X - Axes Spectrum </h1>
    <div id='myDiv8'>
    </div>

   <div>
   <canvas id='sampleVis' width=1900 height=420></canvas><br>
	<canvas id='magnitudeVis' width=1900 height=420></canvas><br>
	<canvas id='phaseVis' width=1900 height=320></canvas>
	<canvas id='amplitudeVis' width=1900 height=420></canvas><br>
	<canvas id='velocityVis' width=1900 height=420></canvas><br>
	<canvas id='accelerationVis' width=1900 height=420></canvas><br>
	
	<h1> Acceleration[m/s^2]-  Y axes Vs Frequency[Hz] X - Axes Spectrum </h1>
    <div id='myDiv311'><!-- Plotly chart will be drawn inside this DIV -->
    </div>
    
    <h1> Autocorrelated Signal </h1>
    <div id='myDiv232'><!-- Plotly chart will be drawn inside this DIV -->
    </div>
    
    
    <h1> Power Spectrum Diagram (Magnitude[DB] / Frequency[Hz]) </h1>
    <div id='myDiv555'><!-- Plotly chart will be drawn inside this DIV -->
    </div>
    
    
    <!-- <h1> Power Spectrum Diagram (Amplitude / Frequency[Hz]) </h1>
    <div id='myDiv551'>
    </div> -->
    
    <div>
     <h1> Signal 3D Vizualization Diagram </h1>
     <div id='myDiv121'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     </div>
   
   </div>
    
    
   	<script type="text/javascript">
	var data1 = [];
	var fftj = [];
	var dataIteration1 = [];
	var spectrum = [];
	var acorr1 = [];
	var freqwSpektrum = [];
	var powerSpektr = [];
	
	var freqwSpektrum1 = [];
	var powerSpektr1 = [];
	var acceleration1 = [];
	var velocity1 = [];
	var signalAmplitude1 = [];
	
	var freqwSpektrum22 = [];
	var powerSpektr22 = [];
	
	var i = 0;
	
	
	
	
<c:forEach items="${frekwSpektrum2}" var="dataPoint122" >	
    
    i = i +1;
	   xValue = ${dataPoint122};
	 freqwSpektrum22.push (xValue);
		//dataIteration1.push(i);
		
   </c:forEach>
   
   
   <c:forEach items="${powerSpectr1}" var="dataPoint133" >	
   
     i = i +1;
 	   xValue = ${dataPoint133};
 	powerSpektr22.push (xValue);
 		//dataIteration1.push(i);
 		
    </c:forEach>
	
	
	
<c:forEach items="${amplitude}" var="dataPoint17" >	
    
    i = i +1;
	   xValue = ${dataPoint17};
	   signalAmplitude1.push (xValue);
	   dataIteration1.push(i);
		
   </c:forEach>	
<c:forEach items="${velocity}" var="dataPoint16" >	
    
    i = i +1;
	   xValue = ${dataPoint16};
	   velocity1.push (xValue);
	   dataIteration1.push(i);
		
   </c:forEach>
   
<c:forEach items="${acceleration}" var="dataPoint15" >	
    
    i = i +1;
	   xValue = ${dataPoint15};
	   acceleration1.push (xValue);
	   dataIteration1.push(i);
		
   </c:forEach>
   
	<c:forEach items="${frekwSpektrum1}" var="dataPoint111" >	
    
    i = i +1;
	   xValue = ${dataPoint111};
	 freqwSpektrum1.push (xValue);
		dataIteration1.push(i);
		
   </c:forEach>
   
   
   var i = 0;
   <c:forEach items="${powerSpectr1}" var="dataPoint121" >	
   
     i = i +1;
 	   xValue = ${dataPoint121};
 	powerSpektr1.push (xValue);
 		dataIteration1.push(i);
 		
    </c:forEach>
    
    
    <c:forEach items="${frekwSpektrum}" var="dataPoint11" >	
    
      i = i +1;
  	   xValue = ${dataPoint11};
  	 freqwSpektrum.push (xValue);
  		dataIteration1.push(i);
  		
     </c:forEach>
     
     
     var i = 0;
     <c:forEach items="${powerSpectr}" var="dataPoint12" >	
     
       i = i +1;
   	   xValue = ${dataPoint12};
   	powerSpektr.push (xValue);
   		dataIteration1.push(i);
   		
      </c:forEach>
      
	
       var i = 0;
	     <c:forEach items="${calculateFrequencyVibr}" var="dataPoint1" >	
	     
	       i = i +1;
	   	   xValue = ${dataPoint1};
	   		data1.push (xValue);
	   		dataIteration1.push(i);
	   		
	      </c:forEach>
	      
	      
	      <c:forEach items="${fft}" var="fftVal" >
	      
	      i = i +1;
	  		xValue = ${fftVal};
	  		fftj.push (xValue);
	  		dataIteration1.push(i);
	     </c:forEach> 
	     
	     <c:forEach items="${ac1}" var="ac1Val" >
	      
	      i = i +1;
	  		xValue = ${ac1Val};
	  		acorr1.push (xValue);
	  		dataIteration1.push(i);
	     </c:forEach>  
	      
	      
	     var data8 = [
			  {
			    x: dataIteration1,
			    y: acceleration1,
			    type: 'scatter'
			  }
			];

			Plotly.newPlot('myDiv8', data8);
			
			
	      var data = [
			  {
			    x: dataIteration1,
			    y: data1,
			    type: 'scatter'
			  }
			];

			Plotly.newPlot('myDiv11', data);
			
			
			var data232 = [
				  {
				    x: dataIteration1,
				    y: acorr1,
				    type: 'scatter'
				  }
				];

				Plotly.newPlot('myDiv232', data232);	
			
			
		var data311 = [
				  {
					  x: freqwSpektrum1,
					  y: powerSpektr1,
				    type: 'scatter'
				  }
				];

		Plotly.newPlot('myDiv311', data311);
		
		
		
		/*var data551 = [
			  {
				  x: freqwSpektrum22,
				  y: powerSpektr22,
			    type: 'scatter'
			  }
			];

	Plotly.newPlot('myDiv551', data551);*/
		
		
		var data555 = [
			  {
			    x: freqwSpektrum,
			    y: powerSpektr,
			    type: 'scatter'
			  }
			];

			Plotly.newPlot('myDiv555', data555);	
		
		
	
			//freqwSpektrum = [];
			//var powerSpektr = [];
		
		var data3233 = [{
			z: [powerSpektr1,powerSpektr1],
			x: dataIteration1,
		    y: freqwSpektrum1 ,
		    type: 'surface',
	        colorscale: 'Jet'
		}];
		
		
		
		var layout1233 = {
				title: 'Signal 3D Vizualization',
				autosize: false,
				width: 1500,
				height: 1000,
				margin: {
				l: 65,
			    r: 50,
				b: 65,
			    t: 90,
			}
				};
		Plotly.newPlot('myDiv121', data3233, layout1233);
			
			
			
		
	/* Calculate Velocity and acceleration */
	/* Calculate Distacsies in Timeseries */
	
	var distancies = [];
	var velocity = [];
	var acceleration = [];
	var magnitude = [];
	
	CalculateDistancies( data1, distancies )
	/* Dulezita hodnota cas time behem ktereho chi merit zrychleni */
	CalculateVelocity( velocity, distancies, 2 )
	
	CalculateAcceleration(acceleration, velocity, 2 )
	
	/* Calculate Distancies in TimeSeries */
	function CalculateDistancies( data1, distancies ) {
		// Calculate distancies ( I think so that is good )
		try {
		for(let i = 0 ; i < data1.length; i++) 
			distancies[i] = data1[i] - data1[i+1]
		}catch(err) {}
		
		return distancies	
	}
	
/* End Calculate Distancies */
	
/* Calculate Velocity */
  
  function CalculateVelocity( velocity, distancies, time ) {
		// Calculate distancies ( I think so that is good )
		try {
		for(let i = 0 ; i < distancies.length; i++) 
			velocity[i] = (distancies[i]-distancies[i+2])/time;
		}catch(err) {}
		
		return velocity	
	}

/* End Calculate Velocity */

 /* Calculate Acceleration */
 
 function CalculateAcceleration(acceleration, velocity, time ) {
		// Calculate distancies ( I think so that is good )
		try {
		for(let i = 0 ; i < velocity.length; i++) 
			acceleration[i] =  (velocity[i]-velocity[i+2])/time;
		}catch(err) {}
		
		return acceleration	
	}
 
 /* End Calculate Acceleration */
 
 
	/* DFT */	
	
	var complex_t = function(real, imag)
	{
		this.real = real;
		this.imag = imag;
		return this;
	}

	// Discrete Fourier Transform
	// much slower than an FFT, but also considerably shorter
	// and less complex (no pun intended!) - result the same
	// returns an array of complex values
	function dft( complexArray )
	{
		var nSamples = complexArray.length;
		var result = [];
		
		for (var outIndex=0; outIndex<nSamples; outIndex++)
		{
			var sumReal=0, sumImag=0;
			for (var inIndex=0; inIndex<nSamples; inIndex++)
			{
				var angle = 2 * Math.PI * inIndex * outIndex / nSamples;
				var cosA = Math.cos(angle);
				var sinA = Math.sin(angle);
				//sumReal += complexArray[inIndex].real*Math.cos(angle) + complexArray[inIndex].imag*Math.sin(angle);
				//sumImag += -complexArray[inIndex].real*Math.sin(angle) + complexArray[inIndex].imag*Math.cos(angle);
				sumReal += complexArray[inIndex].real*cosA + complexArray[inIndex].imag*sinA;
				sumImag += -complexArray[inIndex].real*sinA + complexArray[inIndex].imag*cosA;
			}
			result.push( new complex_t(sumReal, sumImag) );
		}
		return result;
	}


	function graphFormatData_t()
	{
		this.margins = {left:0,top:0,right:0,bottom:0};
		this.graphTitle = '';
		this.xAxisLabel = '';
		this.yAxisLabel = '';
		this.windowWidth = ''; //0.0107;
		this.xAxisFirstTickLabel = '';
		this.xAxisLastTickLabel = '';
		return this;
	}


	/*
		Code is incomplete. Amongst other short-comings, Y axis labels are not applied (note from 4th May 2017 - enhzflep )
	*/
	function drawGraph(canvasElem, data, normalize, formatData)
	{
		var can = canvasElem, ctx = can.getContext('2d');
		let width=can.width, height=can.height;
		ctx.strokeStyle = '#ecf6eb';
		ctx.fillStyle = '#313f32';
		ctx.fillRect(0,0,width,height);
		
		var margins = {left:52, top:24, right:8, bottom:24};		// left, top, right, bottom
		
		var drawWidth = width - (margins.left+margins.right);
		var drawHeight = height - (margins.top+margins.bottom);
		var lineWidth = ctx.lineWidth;
		ctx.lineWidth = 0.5;
		ctx.strokeRect( margins.left, margins.top, drawWidth, drawHeight);
		ctx.lineWidth = lineWidth;
		
		// draw/label axis
		//
		//
		let numHorizDivs = 10;
		let numVertDivs = 10;
		{
			var strokeStyle = ctx.strokeStyle;
			
			ctx.strokeStyle = '#FFFFFF';
			
			let y = height - margins.bottom;
			var x = margins.left;
			var dx = drawWidth / numHorizDivs;
			
			ctx.beginPath();
			for (var i=0; i<numHorizDivs+1; x+=dx,i++)
			{
				ctx.moveTo(x,y);
				ctx.lineTo(x,y+4);
			}
			y = margins.top;
			let dy = drawHeight / numVertDivs;
			x = margins.left;
			for (var i=0; i<numVertDivs+1; y+=dy,i++)
			{
				ctx.moveTo(x,y);
				ctx.lineTo(x-4,y);
			}
			ctx.stroke();
			ctx.strokeStyle = strokeStyle;
		}
		
		//
		// draw the grid lines
		//
		{
			var lineDash = ctx.getLineDash();
			ctx.setLineDash([2, 2]);
			x = margins.left + dx;
			var y = margins.top;
			var dx = drawWidth / numHorizDivs;
			i = 0;
			ctx.lineWidth = 0.5;
			ctx.beginPath();
			for (var i=0; i<numHorizDivs-1; x+=dx,i++)
			{
				ctx.moveTo(x,y);
				ctx.lineTo(x,y+drawHeight);
			}
			
			let dy = drawHeight / numVertDivs;
			y = margins.top+dy;
			x = margins.left;
			for (var i=0; i<numVertDivs-1; y+=dy,i++)
			{
				ctx.moveTo(x,y);
				ctx.lineTo(x+drawWidth,y);
			}
			ctx.stroke();
			ctx.setLineDash(lineDash);
		}
		
		//
		// plot the actual data
		//
		{
			var mMin=data[0], mMax=data[0], i, n;
			if (normalize != 0)
				for (i=0,n=data.length; i<n; i++)
				{
					if (data[i] < mMin) mMin = data[i];
					if (data[i] > mMax) mMax = data[i];
				}
			else
			{
			/*
				mMin = mMax = data[0];
				data.forEach( function(elem){if (elem<mMin) mMin=elem; if (elem>mMax) mMax = elem;} );
				var tmp = mMax;
				if (Math.abs(mMin) > mMax)
					tmp = Math.abs(mMin);
				mMax = tmp;
				mMin = -tmp;
			*/	
				mMin = -2;
				mMax = 2;
			}
			
			let strokeStyle = ctx.strokeStyle;
			ctx.strokeStyle = '#ffffff';
			ctx.moveTo(0,margins.top + drawHeight/2);
			ctx.beginPath();
			for (i=0,n=data.length; i<n; i++)
			{
				var x = (i*drawWidth) / (n-1);
				var y = drawHeight * (data[i]-mMin) / (mMax-mMin);
				
				ctx.lineTo(x+margins.left,height-margins.bottom-y);//y+margins.top);
//				ctx.lineTo(x+margins.left,y+margins.top);
			}
			ctx.stroke();
			ctx.strokeStyle = strokeStyle;
			ctx.closePath();		
		}
		
		
		if (formatData != undefined)
		{
			//label the graph
			if (formatData.graphTitle != undefined)
			{
				ctx.font = '12px arial';
				var titleText = formatData.graphTitle;
				ctx.fillStyle = '#ffffff';
				ctx.fillText(titleText, margins.left, (margins.top+12)/2);
			}
			
			// x-axis first tick label
			if (formatData.xAxisFirstTickLabel != undefined)
			{
				ctx.font = '10px arial';
				ctx.fillText(formatData.xAxisFirstTickLabel, margins.left, can.height-margins.bottom+10*1.5);
			}

			// x-axis label
			if (formatData.xAxisLabel != undefined)
			{
				var xAxisText = formatData.xAxisLabel; //'1.1 msec/div';
				ctx.font = '12px arial';
				var axisTextWidth = ctx.measureText(xAxisText).width;
				var drawWidth = can.width - margins.left - margins.right;
				var axisPosX = (drawWidth - axisTextWidth) / 2;
				ctx.fillText(xAxisText, margins.left+axisPosX, can.height-margins.bottom+10*1.5);
			}
			
			// x-axis last tick label
			if (formatData.xAxisLastTickLabel != undefined)
			{
				var tickText = formatData.xAxisLastTickLabel;
				ctx.font = '10px arial';
				var textSize = ctx.measureText(tickText);
				var posX = can.width - margins.right - textSize.width;
				ctx.fillText(tickText, posX, can.height-margins.bottom+10*1.5);
			}
		}
		else
		{
		//	console.log("No format data present");
		}
	}


	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function byId(id){return document.getElementById(id)}

	window.addEventListener('load', onDocLoaded, false);

	var samples = data1;
	//var samples = acceleration;
	var complexSamples = [];

	function rad2deg(rad)
	{
		return rad * (180/Math.PI);
	}

	function onDocLoaded(evt)
	{
		// create and graph some samples
		fillSampleBuffer();
		var sampleGraphData = new graphFormatData_t();
		    sampleGraphData.graphTitle = 'Samples (50 per unit of time)';
			sampleGraphData.xAxisFirstTickLabel = '0';
			sampleGraphData.xAxisLastTickLabel = '10';
			sampleGraphData.xAxisLabel = 'time';
			
		var sampleGraphData1 = new graphFormatData_t();
		    sampleGraphData1.graphTitle = 'Acceleration(m/s^2) ';
			sampleGraphData1.xAxisFirstTickLabel = '0';
			sampleGraphData1.xAxisLastTickLabel = '[ms]';
			sampleGraphData1.xAxisLabel = 'time';
			
		var sampleGraphData2 = new graphFormatData_t();
		    sampleGraphData2.graphTitle = 'Velocity ';
			sampleGraphData2.xAxisFirstTickLabel = '0';
			sampleGraphData2.xAxisLastTickLabel = '[ms]';
			sampleGraphData2.xAxisLabel = 'time';	
		
		drawGraph( byId('velocityVis'), velocity, false, sampleGraphData2);
		drawGraph( byId('accelerationVis'), acceleration, false, sampleGraphData1);
		drawGraph( byId('sampleVis'), samples, false, sampleGraphData);

		// make a complex array from these samples - the real part are the samples' values
		// the complex part is all 0
		samples.forEach( function(sampleReal, index, srcArray){ complexSamples[index] = new complex_t(sampleReal, 0); } );
		
		// do an fft on them
		var fftSamples = dft( complexSamples );

		// compute and graph the magnitude
		// Calculate Spectrum
		//Float[] spectrum = new Float[fftsize / 2];

        //for (int i = 0; i < fftsize / 2; i++)
       //{
         //spectrum[i] = Math.sqrt(rp[i] * rp[i] + ip[i] * ip[i]);
       //}
        // Vzito z: https://stackoverflow.com/questions/46521950/how-to-convert-signal-from-time-domain-to-frequency-domain-with-java
     
		fftSamples.forEach( 
							function(complexValue, index) 
							{ 
								magnitude[index] = Math.sqrt( (complexValue.real*complexValue.real) + (complexValue.imag*complexValue.imag) );
								//magnitude[index] =2* Math.sqrt( (complexValue.real*complexValue.real) + (complexValue.imag*complexValue.imag) )/2;
								//magnitude[index] = Math.sqrt(complexValue.real*complexValue.real + complexValue.imag*complexValue.imag);
							} 
						);

		var magGraphData = new graphFormatData_t();
			magGraphData.graphTitle = 'Magnitude[dB] (#samples - normalized)';
			magGraphData.xAxisFirstTickLabel = '0';
			magGraphData.xAxisLastTickLabel = '50';
			magGraphData.xAxisLabel = 'freq';
		drawGraph( byId('magnitudeVis'), magnitude, true, magGraphData);
		
		
		var amplitude = [];
		//Vzito z: https://www.developer.com/java/spectrum-analysis-using-java-complex-spectrum-and-phase-angle/
		//Real(F) = S(n=0,N-1)[x(n)*cos(2Pi*F*n)]
		//Imag(F) = S(n=0,N-1)[x(n)*sin(2Pi*F*n)]

		//ComplexAmplitude(F) = Real(F) - j*Imag(F) 
		fftSamples.forEach( 
				function(complexValue, index) 
				{ 
					amplitude[index] = complexValue.real- index*complexValue.imag;
					//amplitude[index] = complexValue.real- complexValue.imag;
					
				} 
			);
		
		var magGraphData3 = new graphFormatData_t();
		magGraphData3.graphTitle = 'Amplitude (#samples - normalized)';
		magGraphData3.xAxisFirstTickLabel = '0';
		magGraphData3.xAxisLastTickLabel = ' ';
		magGraphData3.xAxisLabel = 'freq';
	drawGraph( byId('amplitudeVis'), amplitude, true, magGraphData3);
		
		
		
		// compute and graph the phase
		var phase = [];
		fftSamples.forEach( 
							function(complexValue, index) 
							{ 
								phase[index] = rad2deg( Math.atan2(complexValue.imag, complexValue.real) ); 
							} 
						);

		var phaseGraphData = new graphFormatData_t();
			phaseGraphData.graphTitle = 'Phase (-PI <--> PI)';
			phaseGraphData.xAxisFirstTickLabel = '0';
			phaseGraphData.xAxisLastTickLabel = '50';
			phaseGraphData.xAxisLabel = 'freq';
		drawGraph( byId('phaseVis'), phase, true, phaseGraphData);
	}

	function fillSampleBuffer()
	{
		var time = 0;
		//var deltaTime = 1 / 50.0;
		var deltaTime = 1 ;
		var sampleNumber = 0;
		var length = samples.lenght;
		//for (sampleNumber=0; sampleNumber<500; sampleNumber++)
		for (sampleNumber=0; sampleNumber<length; sampleNumber++)	
		{
			time = sampleNumber * deltaTime;
			var curSample = Math.sin(2.0 * Math.PI * 15.0 * time) + Math.sin(2.0 * Math.PI * 20.0 * time);
			samples.push(curSample);
		}
	}
		     
	/* END */
	
	/* Function Autocorelation */
	
	
	
	/* End Function Autocorelation */
	
	(function () {
		const canvas=document.createElement('canvas');
		canvas.id = 'canvas';
		canvas.width=window.innerWidth;
		canvas.height=window.innerHeight;
		canvas.style.background="#000";
		
		document.body.appendChild(canvas);
		
		const context = canvas.getContext('2d'),
		
		
      
		PI =Math.PI;
		beta = 5;
		var messageYPos=[],
		    carrierYPos=[],
		    amYPos=[],
		    fmYPos=[],
		    t=0;
		    pocet=0,
		    height = canvas.height;
		    
             
		var message=new MessageSignal();
		var carrier=new CarrierSignal();
		
		var yAxisArr = [];


        let x = 0;
        let gridSize = 10,
            frameCount = 60,
            canvastimeInterval = 1 / canvas.width,
            numberOfAnglesInInterval = 60000;
        var sinW = new Object();
        sinW.wavelength = 1;
        sinW.amplitude = canvas.height / 2 - 5 * gridSize;
        sinW.frequency = 1000;
        sinW.interval = 1 / sinW.frequency;
        sinW.anglesInInterval = (sinW.interval / numberOfAnglesInInterval);

        
		
		function drawSignals(t){
			DisplaySignalTable();
			message.drawMessageSignal(t);
			carrier.drawCarrierSignal(t);
			AmplitudeModulation(message.messageSignal,carrier.carrierSignal,t, amYPos,(3*canvas.height/4)-(canvas.height/4)/2);
			FrequencyModulation(message.messageSignal,carrier.carrierSignal,t, fmYPos,(canvas.height)-(canvas.height/4)/2);
		}
		function DisplaySignalTable(){
			
			context.beginPath();
			context.fillStyle="#fff";
			context.font = "16px Arial";
			context.fillText('m(t)', 10,16);
			context.fillText('c(t)',10, (canvas.height/4)+16);
			context.fillText('am(t)',10, (2*canvas.height/4)+16);
			context.fillText('fm(t)',10, (3*canvas.height/4)+16);
			context.closePath();
		}
		
		// Message Signal Function 
		function MessageSignal(){
			this.messageSignal = new Signal(30, 20);
		}
		MessageSignal.prototype.drawMessageSignal=function(t){
			this.messageSignal.drawSignal(t,messageYPos,(canvas.height/4)-(canvas.height/4)/2);
		};
		
		//Carrier Signal function
		function CarrierSignal(){
			this.carrierSignal=new Signal(30, 200)
		}
		
		CarrierSignal.prototype.drawCarrierSignal=function(t){
			this.carrierSignal.drawSignal(t,carrierYPos,(2* canvas.height/4)-(canvas.height/4)/2);
		};
		
		//Apmlitude Modulates Signal
		function AmplitudeModulation(message, carrier, t, amArr, yOffset){
			let tempMessageValue=message.amplitude*Math.cos(2*PI*message.frequency*t);
			let y=(carrier.amplitude+tempMessageValue)*Math.cos(2*PI*carrier.frequency*t);
			amArr.unshift(y);
			for(let i = 0; i< amArr.length; i++){
				context.beginPath();
				context.fillStyle="#D5DA23";
				context.arc(i,yOffset-amArr[i],2,0,2*PI);
				context.fill();
				context.closePath();
				if(amArr.length > canvas.width){
					amArr.pop();
				}
				
			}
		}
		
		//Frequency Modulation function 
		function FrequencyModulation(message, carrier, t, amArr, yOffset){
			
			let tempMessageValue=beta*Math.sin(2*PI*message.frequency*t);
			
			let y=(carrier.amplitude)*Math.cos(2*PI*carrier.frequency*t+tempMessageValue);
			amArr.unshift(y);
			for(let i = 0; i< amArr.length; i++){
				context.beginPath();
				context.fillStyle="#D5DA23";
				context.arc(i,yOffset-amArr[i],2,0,2*PI);
				context.fill();
				context.closePath();
				if(amArr.length > canvas.width){
					amArr.pop();
				}
				
			}
			
		}
		// Signal function
		function Signal(amp, freq){
			this.amplitude=amp;
			this.frequency=freq;
		}
		Signal.prototype.drawSignal = function(t,arr,yOffset){
		    let y=this.amplitude*Math.cos(2 * PI*this.frequency*t);	
		    arr.unshift(y);
		    for(let i=0; i<arr.length; i++){
		    	context.beginPath();
		    	context.fillStyle="#fff";
		    	context.arc(i,yOffset-arr[i],2,0,2*PI);
		    	context.fill();
		    	context.closePath();
		    	if(arr.length > canvas.width){
		    		arr.pop();
		    	}
		    }
		};
		// Here we have Input data generating 
		function loop(){
			
			
			while(pocet < data1.length){	
			context.clearRect(0,0,canvas.width, canvas.height);
			
			//x[i] = (Math.PI * i / n) * size;
			//y[i] = Math.sin(4 * data1[component][i] * size) + Math.sin(20 * data1[component][i] * size);
		     t+=(PI/180)/100;
			//t+=height/2+ sinW.amplitude * Math.sin(data1[pocet]/sinW.frequency);
			//t+=Math.sin(4*data1[pocet]*data1.length) +Math.sin(20 * data1[pocet]*data1.length);
			
			drawSignals(t);
			pocet=pocet+1;
			
			
			requestAnimationFrame(loop);
			
			}
			
		}
		loop();
		
		
	})();
	
	
	
	 </script>
	 
	 
</body>
</html>