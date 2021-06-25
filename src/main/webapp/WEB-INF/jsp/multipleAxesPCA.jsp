<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Multiple Axes PCA</title>
<script src='assets/js/plotly-latest.min.js'></script>
<script src="assets/js/Chart.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/highcharts.js"></script>
<script src="assets/js/exporting.js"></script>

</head>
<body>
  <h1> Multiple Axes PCA Calculating working success...</h1>
  <h4> Condition Monitoring 3D Vizualization </h4>

<div id="graphs">
  <!--<canvas width="400" height="250" class="graph" data-options='{"showLines": true}' data-renderizado=false
  		  data-labels='["January","February","March","April","May","June","July"]'
          data-datasets='[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0, "borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff", "pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[65, 59, 80, 0, 56, 55, 40]}]'></canvas>-->
</div>
<input type="button" value="Add Data" id="adicionar">

  <!-- <script src=https://cdn.plot.ly/plotly-latest.min.js></script>-->
<div id="mydiv"></div> 


<!--  Traffic  -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="box-title">Traffic</h4>
							</div>
							<div class="row">
								<div class="col-lg-8">
									<div class="card-body">
										<!-- <canvas id="TrafficChart"></canvas>   -->

										<div id="container"></div>


										<!--<div id="traffic-chart" class="traffic-chart"></div>-->
									</div>
								</div>
								<div class="col-lg-4">
									<div class="card-body">
										<div id="jqChart" style="width: 450px; height: 300px;">
											<!--<canvas id=canvas width=100 height=100></canvas>-->
										</div>
										<!-- /.card-body -->
									</div>
								</div>
								<!-- /.row -->
								<div class="card-body"></div>
							</div>

						</div>
						<!-- /# column -->
					</div>
					<!--  /Traffic -->
					
					<div class="clearfix"></div>  
					
	<div class="card-body">
                     
                       <h5> PCA Component1 </h5>
                     <div id='myDivPCA1'><!-- Plotly chart will be drawn inside this DIV -->
                     </div>
                    
                    </div>
                    
                    
                    <div class="card-body">
                       <h5> PCA Component2 </h5>
                     <div id='myDivPCA2'><!-- Plotly chart will be drawn inside this DIV -->
                     </div>
                    </div>	
                    
                    
   <div class="card-body">
					<h4> Anomalies State 3D Vizualization </h4>
					<div id='myDiv4' ><!-- Plotly chart will be drawn inside this DIV --></div>
                    
                    </div>
                    <!-- -------- -->                 			               
                            

<script type="text/javascript">
<!--Vzito z: https://stackoverflow.com/questions/39104292/best-way-of-create-delete-restyle-graph-dynamically-with-plotly-js -->
var axesMatrixData = [];
var traces = [];
var dataIteration = [];
var i = 0;
var signalNodeName = [];

var dataPCA1 = [];
var dataPCA2 = [];

var dataPCAN1 = [];
var dataPCAN2 = [];
var anomaliesMatrix = [];


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

// PCA Receiving  

 <c:forEach items="${pcaNative11}" var="dataNPoint1" >	
   	xValue = ${dataNPoint1};
   dataPCAN1.push (xValue);
</c:forEach>
      
<c:forEach items="${pcaNative12}" var="dataNPoint2" >	
 	xValue = ${dataNPoint2};
 	dataPCAN2.push (xValue);
</c:forEach>
    
<c:forEach items="${pca11}" var="dataPoint1" >	
   xValue = ${dataPoint1};
   dataPCA1.push (xValue);
</c:forEach>
      
<c:forEach items="${pca12}" var="dataPoint2">
     yValue = ${dataPoint2};
     i = i+1;
     dataIteration.push(i);
     dataPCA2.push(yValue);	
</c:forEach> 

// End PCA Receiving

// Metrix Final Object Anomalies

<c:forEach items="${metrixFinalObject1}" var="anomaliesPoint" >	
xValue = ${anomaliesPoint};
anomaliesMatrix.push (xValue);
</c:forEach>

// End Metrix Final Object Anomalies

for( var k = 0; k < axesMatrixData[0].length;k++){
k= k+1;
dataIteration.push(k);
}


changeGraph(3)

function changeGraph(graphType) {
    var traces = [];
    var graph_types = [];
    var myDiv = document.getElementById("mydiv");
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
  
	});

	function createGraph (canvas, labels, datasets, options) {
		Chart.Line(canvas,{
	    data:{labels: labels, datasets: datasets},
	    options:options
	  });
	}
	
	
	// Taaky to je mozne schovat to nekam do souboru
	
	Highcharts.chart('container', {
	
	
    chart: {
        type: 'scatter',
        zoomType: 'xy'
    },
    title: {
        text: 'Machine Tool Anomalies Detection Graph'
    },
    subtitle: {
        text: 'Anomalies'
    },
    xAxis: {
        title: {
            enabled: true,
            text: 'PCA1'
        },
        startOnTick: true,
        endOnTick: true,
        showLastLabel: true
    },
    yAxis: {
        title: {
            text: 'PCA2'
        }
    },
    legend: {
        layout: 'vertical',
        align: 'left',
        verticalAlign: 'top',
        x: 100,
        y: 70,
        floating: true,
        backgroundColor: Highcharts.defaultOptions.chart.backgroundColor,
        borderWidth: 1
    },
    plotOptions: {
        scatter: {
            marker: {
                radius: 5,
                states: {
                    hover: {
                        enabled: true,
                        lineColor: 'rgb(100,100,100)'
                    }
                }
            },
            states: {
                hover: {
                    marker: {
                        enabled: false
                    }
                }
            },
            tooltip: {
                headerFormat: '<b>{series.name}</b><br>',
                pointFormat: '{point.x} , {point.y} '
            }
        }
    },
    
    series: [{
        name: 'Principal Component1',
        color: 'rgba(223, 83, 83, .5)',
        data: dataPCA1

    }, {
        name: 'Principal Component2',
        color: 'rgba(119, 152, 191, .5)',
        data: dataPCA2
    }]
});
	
	
	
	var dataPCA = [
		  {
		    x: dataIteration,
		    y: dataPCAN1,
		    type: 'scatter'
		  }
		];

		Plotly.newPlot('myDivPCA1', dataPCA);
		
		
		var dataPCA2 = [
			  {
			    x: dataIteration,
			    y: dataPCAN2,
			    type: 'scatter'
			  }
			];

			Plotly.newPlot('myDivPCA2', dataPCA2);
			
			
			var data3233 = [{
		           z: anomaliesMatrix,
		           type: 'surface',
		           colorscale: 'Jet'
		        }];
		
		
		  
		var layout1233 = {
		  title: 'Condition monitoring node',
		  autosize: false,
		  width: 1800,
		  height: 1000,
		  margin: {
		    l: 65,
		    r: 50,
		    b: 65,
		    t: 90,
		  }
		};
		Plotly.newPlot('myDiv4', data3233, layout1233);		
			
	



</script>
</body>
</html>