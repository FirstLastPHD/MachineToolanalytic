<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<!-- Tady pridat predikce, treba Bajesova predikce  -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='assets/js/plotly-latest.min.js'></script>
<script src="assets/js/Chart.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
</head>
<body>
<h1> Plot Axes Page Working success..... </h1>


<h4> Condition Monitoring 3D Vizualization </h4>

<div id="graphs">
  <!--<canvas width="400" height="250" class="graph" data-options='{"showLines": true}' data-renderizado=false
  		  data-labels='["January","February","March","April","May","June","July"]'
          data-datasets='[{"label":"My First dataset","fill":false,"lineTension":0.1,"backgroundColor":"rgba(75,192,192,0.4)","borderColor":"rgba(75,192,192,1)","borderCapStyle":"butt","borderDash":[],"borderDashOffset":0.0, "borderJoinStyle":"miter","pointBorderColor":"rgba(75,192,192,1)","pointBackgroundColor":"#fff", "pointBorderWidth":1,"pointHoverRadius":5,"pointHoverBackgroundColor":"rgba(75,192,192,1)","pointHoverBorderColor":"rgba(220,220,220,1)","pointHoverBorderWidth":2,"pointRadius":5, "pointHitRadius":10,"data":[65, 59, 80, 0, 56, 55, 40]}]'></canvas>-->
</div>
<input type="button" value="Add Data" id="adicionar">


<div id='myDiv321' ><!-- Plotly chart will be drawn inside this DIV --></div>
  <!-- <script src=https://cdn.plot.ly/plotly-latest.min.js></script>-->
<div id="mydiv"></div>                  
                            

<script type="text/javascript">
<!--Vzito z: https://stackoverflow.com/questions/39104292/best-way-of-create-delete-restyle-graph-dynamically-with-plotly-js -->
var axesMatrixData = [];
var traces = [];
var dataIteration = [];
var i = 0;
var signalNodeName = [];


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


changeGraph(3)

var data321 = [{
    z: axesMatrixData,
    type: 'surface',
    colorscale: 'Jet',
 }];



var layout321 = {
 title: 'Condition monitoring node Selected Nodes',
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
Plotly.newPlot('myDiv321', data321, layout321);


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


</script>

</body>
</html>