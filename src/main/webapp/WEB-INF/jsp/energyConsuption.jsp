<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<script src='assets/js/plotly-latest.min.js'></script>
<head>
<meta charset="ISO-8859-1">
<title>Energy Consuption</title>
</head>
<body>

<h1> Energy Consuption is Calculating now !!!</h1>

<div>
    <h1> Native Signal Diagram </h1>
    <div id='myDiv11'><!-- Plotly chart will be drawn inside this DIV -->
    </div>
    
    </div>

	<script>
	var data1 = [];
	var dataIteration1 = [];
	
	
       var i = 0;
	     <c:forEach items="${signalFreqwVibr}" var="dataPoint1" >	
	     
	       i = i +1;
	   	   xValue = ${dataPoint1};
	   		data1.push (xValue);
	   		dataIteration1.push(i);
	   		
	      </c:forEach>
	      
	      
	      var data = [
			  {
			    x: dataIteration1,
			    y: data1,
			    type: 'scatter'
			  }
			];

			Plotly.newPlot('myDiv11', data);
	 </script>
</body>
</html>