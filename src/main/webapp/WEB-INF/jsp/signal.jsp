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
<script src='assets/js/dspUtils-14.js'></script>
</head>
<body>

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
<h1> Calculating signal working now !!! </h1>
<h3>${signalPref.signalName}</h3>
<h3>${signalPref.dev_id0}</h3>
<h3>${signalPref.txDt_From}</h3>
<h3>${signalPref.txDt_To}</h3>


    <canvas id='sampleVis' width=1900 height=420></canvas><br>
	<canvas id='magnitudeVis' width=1900 height=420></canvas><br>
	<canvas id='phaseVis' width=1900 height=320></canvas>

	<div>
    <h1> Native Signal Diagram </h1>
    <div id='myDiv11'><!-- Plotly chart will be drawn inside this DIV -->
    </div>
    
    <h3> maxV : ${maxValue}</h3>
     <h3> minV : ${minValue}</h3>
     <h3> meanV : ${mean1}</h3>
     
    </div>
    
    <!-- <div>
    <h1> Signal Amplitude Diagram </h1>
    <div id='myDiv111'>
    </div>
    </div>-->
    
    
    
    <div>
     <h1> FFT Diagram </h1>
     <div id='myDiv12'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     
      <h3> maxV : ${maxFFTValue} Hz</h3>
      <h3> minV : ${minFFTValue} Hz</h3>
      <h3> meanV : ${meanFFT1} Hz</h3>
     
     </div>
     
     
     <div>
     <h1> Entrophy Diagram </h1>
     <div id='myDiv13'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     <div>
     <h1> Kovariation Diagram </h1>
     <div id='myDiv14'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     
     <div>
     <h1> LShift Diagram </h1>
     <div id='myDiv15'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     
     <div>
     <h1> Variance Diagram </h1>
     <div id='myDiv16'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     
     <div>
     <h1> Curveature Diagram </h1>
     <div id='myDiv17'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     
     <div>
     <h1> Spikiness Diagram </h1>
     <div id='myDiv18'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     
     <div>
     <h1> RLE Diagram </h1>
     <div id='myDiv19'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     
     
     <div>
     <h1> Trand Diagram </h1>
     <div id='myDiv20'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     <div>
    <h1> 3D Vizualization </h1>
    <div id='myDiv356'><!-- Plotly chart will be drawn inside this DIV -->
    </div>
    
    </div>
    
     
      <div>
     <h1> Spectro Diagram </h1>
     <div id='myDiv21'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     
      <div>
     <h1> Spectro Diagram </h1>
     <div id='myDiv23'><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
    
     
     <div>
     <h1> Violin Diagram </h1>
     <div id="myDiv26"><!-- Plotly chart will be drawn inside this DIV -->
     </div>
     </div>
     
     <div id="myDiv27"><!-- Plotly chart will be drawn inside this DIV -->
     
     <div id="myDiv28"><!-- Plotly chart will be drawn inside this DIV -->
     
     <div id="myDiv29"><!-- Plotly chart will be drawn inside this DIV -->
     
     <div id="myDiv30"><!-- Plotly chart will be drawn inside this DIV -->
     
     <div id="myDiv31"><!-- Plotly chart will be drawn inside this DIV -->
     
     <div id="myDiv32"><!-- Plotly chart will be drawn inside this DIV -->
     
     <div id="myDiv33"><!-- Plotly chart will be drawn inside this DIV -->
     
     <div id="myDiv34"><!-- Plotly chart will be drawn inside this DIV -->
     
    
	<script>
	
	var data1 = [];
	var data2 = [];
	var data3 = [];
	var data4 = [];
	var data5 = [];
	var data6 = [];
	var data7 = [];
	var data8 = [];
	var data9 = [];
	var data10 = [];
	var data11 = [];
	var dataIteration = [];
	var dataIteration1 = [];
	var dataIteration2 = [];
	var dataIteration3 = [];
	var dataIteration4 = [];
	var dataIteration5 = [];
	var dataIteration6 = [];
	var dataIteration7 = [];
	var dataIteration8 = [];
	var dataIteration9 = [];
	var dataIteration10 = [];
	var dataIteration11 = [];
	
	  var i = 0; 
	    
	  /* Try get a timestamp values Dostat Timestampy */
	  
	    
	  
	       var i = 0;
	       <c:forEach items="${calculateFrequencyVibr}" var="dataPoint1" >	
	       
	       i = i +1;
	   		xValue = ${dataPoint1};
	   		data1.push (xValue);
	   		dataIteration.push(i);
	      </c:forEach>
	      
	      
	      
	      <c:forEach items="${fft}" var="fftVal" >
	       
	       i = i +1;
	   		xValue = ${fftVal};
	   		data2.push (xValue);
	   		dataIteration1.push(i);
	      </c:forEach>
	      
	      
	      <c:forEach items="${entropyGraph}" var="entrophyVal" >
	       
	       i = i +1;
	   		xValue = ${entrophyVal};
	   		data3.push (xValue);
	   		dataIteration3.push(i);
	      </c:forEach>
	      
	      
	      <c:forEach items="${kovariationGraph}" var="kovariationVal" >
	       
	       i = i +1;
	   		xValue = ${kovariationVal};
	   		data4.push (xValue);
	   		dataIteration4.push(i);
	      </c:forEach>
	      
	      
	      <c:forEach items="${lShiftGraph}" var="lShiftVal" >
	       
	       i = i +1;
	   		xValue = ${lShiftVal};
	   		data5.push (xValue);
	   		dataIteration5.push(i);
	      </c:forEach>
	      
	      
	      <c:forEach items="${accVarRes}" var="accVarResVal" >
	       
	       i = i +1;
	   		xValue = ${accVarResVal};
	   		data6.push (xValue);
	   		dataIteration6.push(i);
	      </c:forEach>
	      
	      
	      <c:forEach items="${curveaturesGraph}" var="curveaturesVal" >
	       
	       i = i +1;
	   		xValue = ${curveaturesVal};
	   		data7.push (xValue);
	   		dataIteration7.push(i);
	      </c:forEach>
	      
	      
	      
	      <c:forEach items="${spikinessGraph}" var="spikinessVal" >
	       
	       i = i +1;
	   		xValue = ${spikinessVal};
	   		data8.push (xValue);
	   		dataIteration8.push(i);
	      </c:forEach>
	      
	      
	      
	      <c:forEach items="${rleGraph}" var="rleVal" >
	       
	       i = i +1;
	   		xValue = ${rleVal};
	   		data9.push (xValue);
	   		dataIteration9.push(i);
	      </c:forEach>
	      
	      
	      
	      <c:forEach items="${trandGraph}" var="trandVal" >
	       
	       i = i +1;
	   		xValue = ${trandVal};
	   		data10.push (xValue);
	   		dataIteration10.push(i);
	      </c:forEach>
	      
	      
	      var mainMatrixData = [];
	      
	      <c:forEach items="${anomaliesMatrix}" var="matrixPoint" >	
	      
	      	xValue = ${matrixPoint};
	      	mainMatrixData.push (xValue);
	      </c:forEach>
	      
	      
	      <c:forEach items="${signalAmplitude}" var="amplitudeVal" >
	       
	       i = i +1;
	   		xValue = ${amplitudeVal};
	   		data11.push (xValue);
	   		dataIteration11.push(i);
	      </c:forEach>
	      
	      
	      
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
		var magnitude = [];
		fftSamples.forEach( 
							function(complexValue, index) 
							{ 
								magnitude[index] = Math.sqrt( (complexValue.real*complexValue.real) + (complexValue.imag*complexValue.imag) ); 
							} 
						);

		var magGraphData = new graphFormatData_t();
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
		                

	var data = [
		  {
		    x: dataIteration,
		    y: data1,
		    type: 'scatter'
		  }
		];

		Plotly.newPlot('myDiv11', data);
		
		// Amplitude Graph
		//var data21 = [
			  //{
			   // x: dataIteration11,
			   // y: data11,
			   // type: 'scatter'
			  //}
			//];

			//Plotly.newPlot('myDiv111', data21);
		
		
		
		var data23 = [
			  {
			    x: dataIteration1,
			    y: data2,
			    type: 'scatter'
			  }
			];

			Plotly.newPlot('myDiv12', data23);
			
			
			
			var data24 = [
				  {
				    x: dataIteration3,
				    y: data3,
				    type: 'scatter'
				  }
				];

				Plotly.newPlot('myDiv13', data24);
				
				
			var data25 = [
					  {
					    x: dataIteration4,
					    y: data4,
					    type: 'scatter'
					  }
					];

					Plotly.newPlot('myDiv14', data25 );
					
					
	      var data26 = [
						  {
						    x: dataIteration5,
						    y: data5,
						    type: 'scatter'
						  }
						];

						Plotly.newPlot('myDiv15', data26 );
						
						
		var data27 = [
							  {
							    x: dataIteration6,
							    y: data6,
							    type: 'scatter'
							  }
							];

							Plotly.newPlot('myDiv16', data27 );
							
							
	var data28 = [
								  {
								    x: dataIteration7,
								    y: data7,
								    type: 'scatter'
								  }
								];

								Plotly.newPlot('myDiv17', data28 );
								
								
	var data29 = [
									  {
									    x: dataIteration8,
									    y: data8,
									    type: 'scatter'
									  }
									];

									Plotly.newPlot('myDiv18', data29 );
									
									
var data30 = [
										  {
										    x: dataIteration9,
										    y: data9,
										    type: 'scatter'
										  }
										];

										Plotly.newPlot('myDiv19', data30 );
										
										
var data31 = [
											  {
											    x: dataIteration10,
											    y: data10,
											    type: 'scatter'
											  }
											];

											Plotly.newPlot('myDiv20', data31 );
											
											
											
											
                                          var data32 = [
												  {
												    z: mainMatrixData,
												    type: 'heatmap'
												  }
												];

												Plotly.newPlot('myDiv21', data32);


													
													
													
													
 var data34 = [{
					z: mainMatrixData,
							type: 'contour',
							colorscale: 'Jet',
						}];

					var layout = {
					title: 'Colorscale for Contour Plot'
					};

				Plotly.newPlot('myDiv23', data34, layout);
														
												
														

var data3233 = [{
					z: mainMatrixData,
					
					
					type: 'surface'
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
				Plotly.newPlot('myDiv356', data3233, layout1233);													
															
															
															

			
	
	
	// Violin plot

var data = [{
  type: 'violin',
  y: data2,
  points: 'none',
  box: {
    visible: true
  },
  boxpoints: false,
  line: {
    color: 'black'
  },
  fillcolor: '#8dd3c7',
  opacity: 0.6,
  meanline: {
    visible: true
  },
  x0: "FFT"
}]

var layout = {
  title: "",
  yaxis: {
    zeroline: false
  }
}

Plotly.newPlot('myDiv26', data, layout);

	
	
	


		var data = [{
		  type: 'violin',
		  y: data3,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "entropy"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv27', data, layout);
		
	
	
	
	
	  

		var data = [{
		  type: 'violin',
		  y: data4,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "Kovariation"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv28', data, layout);
		
	
	
 

		var data = [{
		  type: 'violin',
		  y: data5,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "LShift"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv29', data, layout);
		
	
	 

		var data = [{
		  type: 'violin',
		  y: data6,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "acc"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv30', data, layout);
		
	
	
	
	

		var data = [{
		  type: 'violin',
		  y: data7,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "curveatures"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv31', data, layout);
		
	
	

		var data = [{
		  type: 'violin',
		  y: data8,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "spikiness"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv32', data, layout);
		
	
	

		var data = [{
		  type: 'violin',
		  y: data9,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "RLE"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv33', data, layout);
		
	
	
	
	
	
		var data = [{
		  type: 'violin',
		  y: data10,
		  points: 'none',
		  box: {
		    visible: true
		  },
		  boxpoints: false,
		  line: {
		    color: 'black'
		  },
		  fillcolor: '#8dd3c7',
		  opacity: 0.6,
		  meanline: {
		    visible: true
		  },
		  x0: "Trand"
		}]

		var layout = {
		  title: "",
		  yaxis: {
		    zeroline: false
		  }
		}

		Plotly.newPlot('myDiv34', data, layout);
		
			



	</script>
</body>
</html>