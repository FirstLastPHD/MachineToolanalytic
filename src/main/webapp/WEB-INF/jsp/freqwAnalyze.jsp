<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AnalysisSpectral</title>

<script src='assets/js/plotly-latest.min.js'></script>


</head>
<body>
 <h1> Analysis  Spectral</h1>
 
 <div class="card-body">
								<h4 class="box-title">Signales:</h4>

									<form:form method="POST" action="prediction.html" modelAttribute="signalPref">

                                           <table class="table table-bordered">
                                                 
                                                  <tr>
                                                    <td><form:select path="prediction_operations" items="${predictionOption}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><form:select path="signalName" items="${SignalVOption4}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><form:select path="dev_id0" items="${SignalVOption1}"/></td>
                                                  </tr>
                                                  
                                                  
                                                  <tr>
                                                    <td><form:select path="txDt_From" items="${SignalVOption2}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><form:select path="txDt_To" items="${SignalVOption3}"/></td>
                                                  </tr>
                                                  
                                 
                                                    <tr>
                                                      <td><input type="submit" value="Calculate Prediction"></td>
                                                     </tr>
                                                </table>
                                             </form:form>
                                          </div>
                                          
 <!-- Write Single Node to CSV File  -->
  <div class="card-body">
								<h4 class="box-title">Write Node to File:</h4>

										<form:form method="POST" action="singleNodeCSV.html" modelAttribute="signalPref">

                                 <table class="table table-bordered">
								<tr>
                                                 <tr>
                                                    <td><form:select path="signalName" items="${SignalVOption4}"/></td>
                                                  </tr>
                                                  
                                                  
                                                  <td><form:select path="dev_id0" items="${SignalVOption1}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><form:select path="txDt_From" items="${SignalVOption2}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><form:select path="txDt_To" items="${SignalVOption3}"/></td>
                                                  </tr>
                                                   <!--  <tr>
                                                   <td>Node<form:select  path="signalValues" items="${signalFullNodeOptions}"/></td>
                                                   </tr> -->
                                                  
                                                  <tr>
                                                 
                                                    <td><form:select path="signal_writing_operations" items="${writingNodeOptions}"/></td>
                                                  </tr>
                   
                                                    <tr>
                                                      <td><input type="submit" value="Write Signal..." onclick="messageFunction()"></td>
                                                     </tr>
                                                </table>
                                             </form:form>
                                          </div>
 <h1> Signal Name:  </h1>
 <h3>${signalPref.signalName}</h3>
  <h1> Device: </h1>
 <h3>${signalPref.dev_id0}</h3>
  <h1> Timestamp From:  </h1>
 <h3>${signalPref.txDt_From}</h3>
 <h1> Timestamp To: </h1>
 <h3>${signalPref.txDt_To}</h3>


<br/>	
<!--<canvas id="canvas" width="320" height="120" style="border:1px solid #999;">-->

   <canvas id='sampleVis' width=1800 height=420></canvas><br>
	<canvas id='magnitudeVis' width=1800 height=420></canvas><br>
	<canvas id='phaseVis' width=1800 height=320></canvas>

      
   
   
   <div>
     <h1> Native Signal Diagram </h1>
     
     <div id='myDiv11'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     
     <h3> maxV : ${maxValue}</h3>
     <h3> minV : ${minValue}</h3>
     <h3> meanV : ${mean1}</h3>
       
       
     </div>
     
     
     <div>
     <h1> Signal Amplitude </h1>
     
     <div id='myDiv133A'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     
     </div>
     
	
 <div>
     <h1> FFT Diagram </h1>
     <div id='myDiv12'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     
     <h3> maxV : ${maxFFTValue} Hz</h3>
     <h3> minV : ${minFFTValue} Hz</h3>
     <h3> meanV : ${meanFFT1} Hz</h3>
</div>
     
     
     <div>
     <h1> STFT Power Spectrum Diagram [DB(Y-axes)/HZ(X-axes)] </h1>
     <div id='myDiv12A'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     
     
     </div>
     
     
     <div>
     <h1> PSD Diagram [DB(Y-axes)/HZ(X-axes)]) </h1>
     <div id='myDiv12B'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     
     
     </div>
     
     
     
      <div>
     <h1> Magnitude Diagram </h1>
     
     <div id='myDiv13'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     </div>
     
     
     
     <div>
     <h1> Phase Diagram </h1>
     
     <div id='myDiv14'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     </div>
     
     
      <div>
     <h1> Frekw Power Spectro Diagram </h1>
     
     <div id='myDiv15'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     </div>
     
     
      <div>
     <h1> Power Spectral Density Diagram </h1>
     <div id='myDiv23'><!-- Plotly chart will be drawn inside this DIV -->
      <div id='myDiv24'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
   </div>
   
   
   
     <div>
     <h1> STFT </h1>
     
     <div id='myDiv16'><!-- Plotly chart will be drawn inside this DIV -->
     
      </div>
     </div>
   
   
   <div>
     <h1> Signal 3D Vizualization Diagram </h1>
     <div id='myDiv1'><!-- Plotly chart will be drawn inside this DIV -->
     
     </div>
     </div>
   </div>
     
     
    <script>
   
    var nativeSignal = [];
  
    var fftj = [];
   var  magnitude =new Array();
    
    var magGraphData = new graphFormatData_t();
    var amplitude = [];
    
    var dataIteration1 = [];
    var magSTFT = [];
    var psdV = [];
    var i = 0; 
    var sfft = [];
    
<c:forEach items="${sfftK}" var="sfftVal" >
    
    i = i +1;
		xValue = ${sfftVal};
		sfft.push (xValue);
		magSTFT.push(i);
   </c:forEach>
   
   
  <c:forEach items="${psdK}" var="psdVal" >
    
    i = i +1;
		xValue = ${psdVal};
		psdV.push (xValue);
   </c:forEach>
   
   
    
    <c:forEach items="${fft}" var="fftVal" >
    
    i = i +1;
		xValue = ${fftVal};
		fftj.push (xValue);
		dataIteration1.push(i);
   </c:forEach>
   
   
   <c:forEach items="${signalFreqwVibr}" var="signalVal" >
   
   i = i +1;
		xValue = ${signalVal};
		nativeSignal.push (xValue);
		
  </c:forEach>
  
  <c:forEach items="${amplitude}" var="amplitudeVal" >
  
  i = i +1;
		xValue = ${amplitudeVal};
		amplitude.push (xValue);
		
 </c:forEach>
 
 
 var samples = nativeSignal;
 
 
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
			
		drawGraph( byId('sampleVis'), samples, false, sampleGraphData);

		// make a complex array from these samples - the real part are the samples' values
		// the complex part is all 0
		samples.forEach( function(sampleReal, index, srcArray){ complexSamples[index] = new complex_t(sampleReal, 0); } );
		
		// do an fft on them
		var fftSamples = dft( complexSamples );

		// compute and graph the magnitude
		
		fftSamples.forEach( 
							function(complexValue, index) 
							{ 
								magnitude[index] = Math.sqrt( (complexValue.real*complexValue.real) + (complexValue.imag*complexValue.imag) );
								//complexVal = Math.sqrt( (complexValue.real*complexValue.real) + (complexValue.imag*complexValue.imag) );
								//magnitude.push(complexVal); 
							} 
						);
   
		
			magGraphData.graphTitle = 'Magnitude (#samples - normalized)';
			magGraphData.xAxisFirstTickLabel = '0';
			magGraphData.xAxisLastTickLabel = '50';
			magGraphData.xAxisLabel = 'freq';
		drawGraph( byId('magnitudeVis'), magnitude, true, magGraphData);
		
		
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
		var deltaTime = 1 / 50.0;
		var sampleNumber = 0;
		
		for (sampleNumber=0; sampleNumber<500; sampleNumber++)
		{
			time = sampleNumber * deltaTime;
			var curSample = Math.sin(2.0 * Math.PI * 15.0 * time) + Math.sin(2.0 * Math.PI * 20.0 * time);
			samples.push(curSample);
		}
	}
   
	
	//If you're just looking for the single largest (sinusoidal) component then scan through the magnitude array until you find the maximum value, and then convert the index of this value to its corresponding frequency, i.e.

	//mag_max = magnitude[0];
	//i_max = 0;
	//for (i = 1; i < N; ++i)
	//{
	    //if (magnitude[i] > mag_max)
	    //{
	       // mag_max = magnitude[i];
	        //i_max = i;
	    //}
	//}	
	//You now have the value of the peak in mag_max and its index in i_max. You can get the frequency like this:

	//f_max = i_max * Fs / N;
	//var magnitudeK = parent.magnitude;
	samples.forEach( function(sampleReal, index, srcArray){ complexSamples[index] = new complex_t(sampleReal, 0); } );
		
		// do an fft on them
		var fftSamples = dft( complexSamples );

		// compute and graph the magnitude
		var magnitudeK = [];
		fftSamples.forEach( 
							function(complexValue, fftj) 
							{ 
								magnitudeK[fftj] = Math.sqrt( (complexValue.real*complexValue.real) + (complexValue.imag*complexValue.imag) );
								//complexVal = Math.sqrt( (complexValue.real*complexValue.real) + (complexValue.imag*complexValue.imag) );
								//magnitude.push(complexVal); 
							} 
						);
		
	  var phaseK = [];
	  
		fftSamples.forEach( 
							function(complexValue, index) 
							{ 
								phaseK[index] = rad2deg( Math.atan2(complexValue.imag, complexValue.real) ); 
							} 
						);
		
		//https://www.electronics-tutorials.ws/accircuits/rms-voltage.html
		var amplitudeK = [];
		fftSamples.forEach( 
				function(complexValue, index) 
				{ 
					amplitudeK[index] = rad2deg( Math.atan2(complexValue.imag, complexValue.real) ); 
				} 
			);
		
		
		var spectrumK = [];
		//for k in 0 to N/2 - 1
		 // spectrum[k] = sqrt(sqr(a[2*k]) + sqr(a[2*k+1]))
		 // https://stackoverflow.com/questions/5010261/power-spectral-density-from-jtransforms-doublefft-1d
		fftSamples.forEach( 
							function(complexValue, index) 
							{ 
								spectrumK[index] =  Math.sqrt(Math.sqrt (complexValue.real*complexValue.real) +Math.sqrt (complexValue.imag*complexValue.imag) ); 
							} 
						);
		
	//var magnitudeK = [40000,45000,75600,4000,8000,900,567570,34000];
	var frekw = [];
	var f_max = 0;
	var mag_max = magnitudeK[0];
	var i_max = 0;
    
	var counter = 0;
	// Spocitat SampleRate
	var sampleRate = 5000;
	var indexFreq = [];
	for(k = 1; k < fftj.length/2-1; k++){
	
		//if(magnitudeK[k] > mag_max ){
			//mag_max = magnitudeK[k];
			//i_max = k;
			//f_max = i_max * sampleRate / fftj.length;
			//frekw[k] = f_max;
			//indexFreq.push(k)
			frekw.push(Math.sqrt(Math.sqrt(fftj[2*k]) + Math.sqrt(fftj[2*k+1])));
		//}
		

	}
	
	
	 
	//for(var j = 0; j < fftj.length; ++j){
		
		
	//}
	var mainMatrixData = [];
	mainMatrixData.push(fftj);
	//mainMatrixData.push(spectrumK);
	//mainMatrixData.push(magnitudeK);
	//mainMatrixData.push(phaseK);
	//mainMatrixData.push(fftj);
	//mainMatrixData.push(spectrumK);
	mainMatrixData.push(fftj);
	
	//mainMatrixData.push(magnitudeK);
	
	
	var data121 = [{
		  z: mainMatrixData,
		  x: dataIteration1,
		  y: magnitudeK,
		  type: 'contour',
		  colorscale: 'Jet',
		}];

		var layout121 = {
		  title: 'Signal Spectrogram Plot'
		};

		Plotly.newPlot('myDiv23', data121, layout121);
		
		
		var data322 = [
			  {
			    z: [fftj],
			    x: dataIteration1,
			    y: magnitudeK,
			    type: 'heatmap',
			    hoverongaps: false
			  }
			];
			Plotly.newPlot('myDiv24', data322);
		
		
     var data23 = [
			  {
			    x: dataIteration1,
			    y: fftj,
			    type: 'scatter'
			  }
			];

			Plotly.newPlot('myDiv12', data23);
			
	
	var data23A = [
				  {
				    x: dataIteration1,
				    y: psdV,
				    type: 'scatter'
				  }
		];

	Plotly.newPlot('myDiv12B', data23A);
			

var data23A = [
				  {
				    x: dataIteration1,
				    y: sfft,
				    type: 'scatter'
				  }
				];

				Plotly.newPlot('myDiv12A', data23A);
				
var data133A = [
					  {
					    x: dataIteration1,
					    y: amplitude,
					    type: 'scatter'
					  }
					];

					Plotly.newPlot('myDiv133A', data133A);
			
			
 var data24 = [
				  {
				    x: dataIteration1,
				    y: magnitudeK,
				    type: 'scatter'
				  }
				];

				Plotly.newPlot('myDiv13', data24);
				
var data25 = [
					  {
					    x: dataIteration1,
					    y: phaseK,
					    type: 'scatter'
					  }
					];

					Plotly.newPlot('myDiv14', data25);

					
var data26 = [
						  {
						    x: dataIteration1,
						    y: samples,
						    type: 'scatter'
						  }
						];

						Plotly.newPlot('myDiv11', data26);
						
var data27 = [
							  {
							    x: dataIteration1,
							    y: spectrumK ,
							    type: 'scatter'
							  }
							];

							Plotly.newPlot('myDiv15', data27);
			
			
var data323 = [{
				z: [fftj,fftj],
				x: dataIteration1,
			    y: magnitudeK,
				type: 'surface'
			}];
						
						
						  
var layout123 = {
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
			Plotly.newPlot('myDiv1', data323, layout123);
			
			

var data212 = [{
				  z: [sfft,sfft],
				  x:dataIteration1,
				  y:fftj,
				  type: 'contour',
				  colorscale: 'Jet',
				}];

				var layout212 = {
				  title: 'Signal Spectrogram Plot'
				};

				Plotly.newPlot('myDiv16', data212, layout212);
			
			
			
			
	
	</script> 
</body>
</html>