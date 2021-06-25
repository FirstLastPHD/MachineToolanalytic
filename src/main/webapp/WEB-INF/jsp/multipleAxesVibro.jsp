<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Multiple Axes VibroDiagnostic</title>
<script src='assets/js/plotly-latest.min.js'></script>
<script src="assets/js/Chart.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
</head>
<body>
<h1> Multiple Axses Vibrodiagnostic working success ... </h1>

<div id="graphs">
<h1> Native Signal </h1>
  <!--<canvas width="400" height="250" class="graph" data-options='{"showLines": true}' data-renderizado=false
  		  data-labels='["January","February","March","April","May","June","July"]'
          data-datasets='[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0, "borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff", "pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[65, 59, 80, 0, 56, 55, 40]}]'></canvas>-->
</div>
<input type="button" value="Show Graph" id="adicionar">


  <!-- <script src=https://cdn.plot.ly/plotly-latest.min.js></script>-->
<div id="mydiv"></div>  



<div id="graphs1">
<h1> Vibrodiagnostic  </h1>
 <h2>Y Axes - Acceleration[m/s^2] Vs. X Axes - Freq[Hz] </h2>
 
<!--  <h1> Result Graph from all series PCA1 </h1>
 <div id='myDiv44' >
 </div> 
 
 <h1> Result Graph from all series PCA2 </h1>
 <div id='myDiv45' >
 </div> --> 
 
 <h1> Result Graph for All Signals </h1>
 <div id='myDiv48' >
 </div> 
 
 <!--<canvas width="400" height="250" class="graph" data-options='{"showLines": true}' data-renderizado=false
  		  data-labels='["January","February","March","April","May","June","July"]'
          data-datasets='[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0, "borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff", "pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[65, 59, 80, 0, 56, 55, 40]}]'></canvas>-->
</div>
<input type="button" value="Show Graph" id="adicionarVibro">


 <div class="card-body">
	<h4> Condition Monitoring 3D Vizualization </h4>
		 <div id='myDiv2000' ></div> 
		
		<div id='myDiv3000' ><!-- Plotly chart will be drawn inside this DIV --></div>
                    
      </div>

<div id="mydiv1"></div> 


<div id="graphs2">

<h1> Vibrodiagnostic  </h1>
<h2>Y Axes - Magnitude[DB]  Vs. X Axes - Freq[Hz] </h2>


<!--  -<h1> Result Graph from all series PCA1 </h1>
 <div id='myDiv46' >
 </div> 
 
 <h1> Result Graph from all series PCA2 </h1>
 <div id='myDiv47' >
 </div> -->
 
 
 <h1> Resulting Graph </h1>
 <div id='myDiv49' >
 </div>
 
 
 
 
 
<!--<canvas width="400" height="250" class="graph" data-options='{"showLines": true}' data-renderizado=false
  		  data-labels='["January","February","March","April","May","June","July"]'
          data-datasets='[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0, "borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff", "pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[65, 59, 80, 0, 56, 55, 40]}]'></canvas>-->
</div>
                             
<input type="button" value="Show Graph" id="adicionarVibro1">
                
<div id="mydiv3"></div> 

 <div class="card-body">
	<h4> Condition Monitoring 3D Vizualization </h4>
		 <div id='myDiv1000' ></div> 
		
		<div id='myDiv300' ><!-- Plotly chart will be drawn inside this DIV --></div>
                    
      </div>


<div id="graphs3">

<h1> Vibrodiagnostic Vibro Acceleration </h1>
<h2> AC </h2>
<!--<canvas width="400" height="250" class="graph" data-options='{"showLines": true}' data-renderizado=false
  		  data-labels='["January","February","March","April","May","June","July"]'
          data-datasets='[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0, "borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff", "pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[65, 59, 80, 0, 56, 55, 40]}]'></canvas>-->
</div>
<input type="button" value="Show Graph" id="adicionarVibro2">
<div id="mydiv4"></div> 



<div id="graphs4">

<h1> Vibrodiagnostic VibroVelocity  </h1>
<h2> Vibro Velocity </h2>

<h1> Resulting Graph </h1>
 <div id='myDiv50' >
 </div>
 
 <div class="card-body">
	<h4> Vibro Velocity  3D Vizualization </h4>
		 <div id='myDiv1001' ></div> 
		
		<div id='myDiv301' ><!-- Plotly chart will be drawn inside this DIV --></div>
                    
      </div>
      
      
<!--<canvas width="400" height="250" class="graph" data-options='{"showLines": true}' data-renderizado=false
  		  data-labels='["January","February","March","April","May","June","July"]'
          data-datasets='[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0, "borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff", "pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[65, 59, 80, 0, 56, 55, 40]}]'></canvas>-->
</div>
<input type="button" value="Show Graph" id="adicionarVibro3">
<div id="mydiv5"></div> 
                            

<script type="text/javascript">
<!--Vzito z: https://stackoverflow.com/questions/39104292/best-way-of-create-delete-restyle-graph-dynamically-with-plotly-js -->
var axesMatrixData = [];
var traces = [];
var dataIteration = [];
var i = 0;
var signalNodeName = [];

var axesVibroData = [];
var axesVibroData1 = [];
var freqwSpectrum = [];
var autocorrelation11 = [];

var vibroVelocity1 = [];
var resVelocityRMS1 = [];

//vibroVelocity
//resVelocityRMS

//var pca1 = [];
//var pca2 = [];

//var pca12 = [];
//var pca22 = [];

var resAccelPlot = [];
var resAmplitudePlot = [];
//resAccelRMS
//resAmplRMS




//Vyplnuji Frekwencni spectrum  pro Velocity
<c:forEach items="${vibroVelocity}" var="matrixPoint88" >
xValue = ${matrixPoint88};
vibroVelocity1.push (xValue);

/*traces.push({
    x: xValue,
    y: dataIteration,
    type: graph_types[0]
});*/
</c:forEach>


// Vyplnuji rezultujici signal VibroVelocity vs Freq RMS
<c:forEach items="${resVelocityRMS}" var="matrixVelocity1" >
xValue = ${matrixVelocity1};
resVelocityRMS1.push (xValue);
</c:forEach>

// End Vyplnovani Velocity RMS


// Vyplnuji rezultujici signal Amplitude vs Freq RMS
<c:forEach items="${resAmplRMS}" var="matrixAmpl1" >
xValue = ${matrixAmpl1};
resAmplitudePlot.push (xValue);
</c:forEach>




// Vyplnuji rezultujici signal Acceleration RMS
<c:forEach items="${resAccelRMS}" var="matrixAccel1" >
xValue = ${matrixAccel1};
resAccelPlot.push (xValue);
</c:forEach>


// vyplnuji pCA pro vibrozrychleni

/*<c:forEach items="${pcaNat1}" var="matrixPCA1" >
xValue = ${matrixPCA1};
pca1.push (xValue);
</c:forEach>


<c:forEach items="${pcaNat2}" var="matrixPCA2" >
xValue = ${matrixPCA2};
pca2.push (xValue);
</c:forEach>*/

// End receiving PCA MAtrix pro vybrozrychleni


// vyplnuji pCA pro Ampl vs Freq

/*<c:forEach items="${pcaNat12}" var="matrixPCA11" >
xValue = ${matrixPCA11};
pca12.push (xValue);
</c:forEach>*/


/*<c:forEach items="${pcaNat22}" var="matrixPCA22" >
xValue = ${matrixPCA22};
pca22.push (xValue);
</c:forEach>*/

// End receiving PCA MAtrix pro vybrozrychleni

//Vyplnuji Frekwencni spectrum 
<c:forEach items="${autocorrelation1}" var="matrixPoint23" >
xValue = ${matrixPoint23};
autocorrelation11.push (xValue);

/*traces.push({
    x: xValue,
    y: dataIteration,
    type: graph_types[0]
});*/
</c:forEach>



// Vyplnuji Frekwencni spectrum 
<c:forEach items="${signalFrekwSpectrum}" var="matrixPoint2" >
xValue = ${matrixPoint2};
freqwSpectrum.push (xValue);

/*traces.push({
    x: xValue,
    y: dataIteration,
    type: graph_types[0]
});*/
</c:forEach>

//Vyplnuji Tady maticu signalu pro vibrodiagnostiku
<c:forEach items="${vibrodiagnostics}" var="matrixPoint1" >
xValue = ${matrixPoint1};
axesVibroData.push (xValue);

/*traces.push({
    x: xValue,
    y: dataIteration,
    type: graph_types[0]
});*/
</c:forEach>

//Vyplnuji Tady maticu signalu pro vibrodiagnostiku
<c:forEach items="${vibrodiagnostics1}" var="matrixPoint13" >
xValue = ${matrixPoint13};
axesVibroData1.push (xValue);

/*traces.push({
    x: xValue,
    y: dataIteration,
    type: graph_types[0]
});*/
</c:forEach>


// Vyplnuji Tady maticu signalu
<c:forEach items="${dynamicND1}" var="matrixPoint" >
xValue = ${matrixPoint};
axesMatrixData.push (xValue);

/*traces.push({
    x: xValue,
    y: dataIteration,
    type: graph_types[0]
});*/
</c:forEach>


//signalNode
<c:forEach items="${signalNode}" var="matrixPoint1" >
xxValue = ${matrixPoint1};
signalNodeName.push(xxValue);
</c:forEach>

// End Signal Node

for( var k = 0; k < axesMatrixData[0].length;k++){
k= k+1;
dataIteration.push(k);
}

// Tady nakladam grafy na grafy 
changeGraph(3, axesMatrixData, dataIteration, "mydiv")

changeGraph(3, axesVibroData, freqwSpectrum, "mydiv1")

changeGraph(3, axesVibroData1, freqwSpectrum, "mydiv3")

changeGraph(3, autocorrelation11, dataIteration, "mydiv4")


changeGraph(3, vibroVelocity1, freqwSpectrum, "mydiv5")




function changeGraph(graphType, axesMatrixData, dataIteration, tagHtml ) {
    var traces = [];
    var graph_types = [];
    var myDiv = document.getElementById(tagHtml);
    switch (graphType) {
    case 1:
        graph_types.push("scatter");
        graph_types.push("bar");
        break;
    case 2:
        graph_types.push("bar");
        graph_types.push("bar");
        break;
    default:
        graph_types.push("scatter");
        graph_types.push("scatter");
    }
    //axesMatrixData
    for(var i = 0 ; i < axesMatrixData.length; i ++)
    	{
    	traces.push({
    		x: dataIteration,
            y: axesMatrixData[i],
            type: graph_types[0]
        });
    	
    	}
   /* traces.push({
        x: [1, 2, 3, 4],
        y: [10, 15, 13, 17],
        type: graph_types[0]
    });

    traces.push({
        x: [1, 2, 3, 4],
        y: [16, 5, 11, 9],
        type: graph_types[1]
    });*/

    var layout = {
        width: 1500,
        height: 1500
    };

    Plotly.newPlot(myDiv, traces, layout);
}

$(function () {
	  $('.graph').each(function(index, canvas) {
	    createGraph(
    	canvas, 
      $(canvas).data('labels'), 
      $(canvas).data('datasets'), 
      $(canvas).data('options')
    );
    $(canvas).data('renderizado', true);
	  });
  
  $(document).on('DOMNodeInserted', function(e) {
      if ($(e.target).hasClass('graph')) {
         createGraph(
           e.target, 
           $(e.target).data('labels'), 
           $(e.target).data('datasets'), 
           $(e.target).data('options')
         );
         $(e.target).data('renderizado', true);
      }
  });
  
  $('#adicionar').on('click', function () {

	  for(var k = 0; k < axesMatrixData.length; k++){
		  
		  //$('#graphs').append('<canvas width="400" height="250" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'["January","February","March","April","May","June","July"]\' data-datasets=\'[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff","pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[56, 55, 40, 65, 59, 80, 0]}]\'></canvas>');
		  $('#graphs').append('<canvas width="1900" height="520" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'['+dataIteration.toString()+']\' data-datasets=\'[{"label":"'+signalNodeName[k].toString()+'","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","data":['+ axesMatrixData[k].toString() +']}]\'></canvas>');
	  }
			});
  

$('#adicionarVibro').on('click', function () {

	  for(var k = 0; k < axesVibroData.length; k++){
		  
		  //$('#graphs').append('<canvas width="400" height="250" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'["January","February","March","April","May","June","July"]\' data-datasets=\'[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff","pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[56, 55, 40, 65, 59, 80, 0]}]\'></canvas>');
		  $('#graphs1').append('<canvas width="1900" height="520" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'['+freqwSpectrum.toString()+']\' data-datasets=\'[{"label":"'+signalNodeName[k].toString()+'","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","data":['+ axesVibroData[k].toString() +']}]\'></canvas>');
	  }
			});

	});
	
	
$('#adicionarVibro1').on('click', function () {

	  for(var k = 0; k < axesVibroData1.length; k++){
		  
		  //$('#graphs').append('<canvas width="400" height="250" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'["January","February","March","April","May","June","July"]\' data-datasets=\'[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff","pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[56, 55, 40, 65, 59, 80, 0]}]\'></canvas>');
		  $('#graphs2').append('<canvas width="1900" height="520" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'['+freqwSpectrum.toString()+']\' data-datasets=\'[{"label":"'+signalNodeName[k].toString()+'","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","data":['+ axesVibroData1[k].toString() +']}]\'></canvas>');
	  }
			});
			
$('#adicionarVibro2').on('click', function () {

	  for(var k = 0; k < autocorrelation11.length; k++){
		  
		  //$('#graphs').append('<canvas width="400" height="250" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'["January","February","March","April","May","June","July"]\' data-datasets=\'[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff","pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[56, 55, 40, 65, 59, 80, 0]}]\'></canvas>');
		  $('#graphs3').append('<canvas width="1900" height="520" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'['+dataIteration.toString()+']\' data-datasets=\'[{"label":"'+signalNodeName[k].toString()+'","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","data":['+ autocorrelation11[k].toString() +']}]\'></canvas>');
	  }
			});	


$('#adicionarVibro3').on('click', function () {

	  for(var k = 0; k < vibroVelocity1.length; k++){
		  
		  //$('#graphs').append('<canvas width="400" height="250" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'["January","February","March","April","May","June","July"]\' data-datasets=\'[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff","pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[56, 55, 40, 65, 59, 80, 0]}]\'></canvas>');
		  $('#graphs4').append('<canvas width="1900" height="520" class="graph" data-options=\'{"showLines": true}\' data-renderizado=false data-labels=\'['+freqwSpectrum.toString()+']\' data-datasets=\'[{"label":"'+signalNodeName[k].toString()+'","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0,"borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","data":['+ vibroVelocity1[k].toString() +']}]\'></canvas>');
	  }
			});	

	
	function createGraph (canvas, labels, datasets, options) {
		Chart.Line(canvas,{
	    data:{labels: labels, datasets: datasets},
	    options:options
	  });
	}
/* Plot Acceleration Vs Frekw */
var data324 = [{
        z: axesVibroData,
        y: dataIteration,
        x: freqwSpectrum,
        type: 'surface',
        colorscale: 'Jet',
     }];



var layout124 = {
title: 'Condition monitoring node',
autosize: false,
width: 1800,
height: 1300,
margin: {
 l: 65,
 r: 50,
 b: 65,
 t: 90,
}
};
Plotly.newPlot('myDiv2000', data324, layout124);

var data33 = [{
	 z: axesVibroData,
    y: dataIteration,
    x: freqwSpectrum,
    type: 'contour',
    //type: 'heatmap',
	  colorscale: 'Jet',
	}];

	var layout1123 = {
	  title: '[s/m^2] vs [HZ] spectrogram '
	};

	Plotly.newPlot('myDiv3000', data33, layout1123);
	
	/* End plot vibration spectrum */
/* Plot Magnitude(Amplitude) Vs Freqw Spectrum */	
	var data323 = [{
        z: axesVibroData1,
        y: dataIteration,
        x: freqwSpectrum,
        type: 'surface',
        colorscale: 'Jet',
     }];



var layout123 = {
title: 'Condition monitoring node',
autosize: false,
width: 1800,
height: 1300,
margin: {
 l: 65,
 r: 50,
 b: 65,
 t: 90,
}
};
Plotly.newPlot('myDiv1000', data323, layout123);


var data33 = [{
	 z: axesVibroData1,
     y: dataIteration,
     x: freqwSpectrum,
     type: 'contour',
     //type: 'heatmap',
	  colorscale: 'Jet',
	}];

	var layout1123 = {
	  title: '[DB] vs [HZ] spectrogram '
	};

	Plotly.newPlot('myDiv300', data33, layout1123);
	
	
	
	/*var data344 = [
		  {
			  x: freqwSpectrum,
			  y: pca1,
		    type: 'scatter'
		  }
		];

Plotly.newPlot('myDiv44', data344);



var data345 = [
	  {
		  x: freqwSpectrum,
		  y: pca2,
	    type: 'scatter'
	  }
	];
Plotly.newPlot('myDiv45', data345);	*/
	
	
/*var data346 = [
	  {
		  x: freqwSpectrum,
		  y: pca12,
	    type: 'scatter'
	  }
	];

Plotly.newPlot('myDiv46', data346);*/



/*var data347 = [
{
	  x: freqwSpectrum,
	  y: pca22,
  type: 'scatter'
}
];

Plotly.newPlot('myDiv47', data347);	*/

//resAccelPlot

var data348 = [
	{
		  x: freqwSpectrum,
		  y: resAccelPlot,
	  type: 'scatter'
	}
	];

Plotly.newPlot('myDiv48', data348);	


var data349 = [
	{
		  x: freqwSpectrum,
		  y: resAmplitudePlot,
	  type: 'scatter'
	}
	];

Plotly.newPlot('myDiv49', data349);	


var data350 = [
	{
		  x: freqwSpectrum,
		  y: resVelocityRMS1,
	  type: 'scatter'
	}
	];

Plotly.newPlot('myDiv50', data350);	



/* Vibrovelocity 3d Vizualization */

 var data324 = [{
     z: vibroVelocity1,
     y: dataIteration,
     x: freqwSpectrum,
     type: 'surface',
     colorscale: 'Jet',
  }];



var layout124 = {
title: 'Velocity 3D Vizualization',
autosize: false,
width: 1800,
height: 1300,
margin: {
l: 65,
r: 50,
b: 65,
t: 90,
}
};
Plotly.newPlot('myDiv1001', data324, layout124);


var data35 = [{
	 z: vibroVelocity1,
  y: dataIteration,
  x: freqwSpectrum,
  type: 'contour',
  //type: 'heatmap',
	  colorscale: 'Jet',
	}];

	var layout1125 = {
	  title: '[ms] vs [HZ] spectrogram '
	};

	Plotly.newPlot('myDiv301', data35, layout1125);


</script>
</body>
</html>