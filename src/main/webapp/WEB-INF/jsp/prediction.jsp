<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NN Prediction</title>
<script src='assets/js/plotly-latest.min.js'></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/tf.min.js"></script>
<!--  <script src="https://cdn.plot.ly/plotly-1.2.0.min.js"></script> -->
<!-- <script src="assets/js/generators.js"></script> -->
<script src="assets/js/model.js"></script>
</head>

<body onload="Init()">
	<h1>Time Series Prediction</h1>

	${predOP} ${signalPref.getSignalValue()}

	<table>
		<tbody>
			<tr>
				<td>
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<div class="navbar-header">
								<a class="navbar-brand" href="#">SignalPrediction@NeuralNetwork</a>
							</div>
							<ul class="nav navbar-nav">
								<li onclick="setTabActive(event, 'Dataset')"><a href="#">Dataset</a></li>
								<li onclick="setTabActive(event, 'Neural Network')"><a
									href="#">Neural Network</a></li>
								<li onclick="setTabActive(event, 'Prediction')"><a href="#">Prediction</a></li>
							</ul>
						</div>
					</nav>
				</td>
			</tr>
			<tr>
				<td>
					<div id="Dataset" class="container">
						<table width="100%">
							<tr>
								<td>
									<table width="100%">
										<tr>
											<td width="60%" align="left">
												<table width="100%">
													<tr>
														<td width="10px"><b>&nbsp;N-Items:&nbsp;</b></td>
														<td width="120px"><input
															class="form-control input-sm" id="n-items" type="text"
															size="1" value="500"></td>
														<td width="120px"><b>&nbsp;&nbsp;&nbsp;Window
																Size:&nbsp;</b></td>
														<td width="100px"><input
															class="form-control input-sm" id="window-size"
															type="text" size="1" value="12"></td>
														<td width="180px" align="center"><button
																type="button" class="btn btn-primary"
																onclick="initDataset()">Generate Data...</button></td>
													</tr>
												</table>
											</td>
											<td width="40%" align="right">
												<form class="md-form">
													<div class="file-field">
														<div class="btn btn-primary btn-sm float-left">
															<span>select *.csv data file</span> <input type="file"
																id="input-data">
														</div>
													</div>
												</form>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="100%" id="dataset"><hr />
									<table width="50%">
										<tr>
											<td align="left"><button type="button"
													class="btn btn-primary" onclick="onInputDataClick()">Input
													Data</button></td>
											<td align="right"><button type="button"
													class="btn btn-primary" onclick="onSMAClick()">Simple
													Moving Average</button></td>
										</tr>
									</table>
									<hr />
									<div id="data" style="overflow-y: scroll; max-height: 300px;"></div>
								</td>
							</tr>
							<tr>
								<td width="100%" id="graph-plot"><hr />
									<div id="graph" style="width: 100%; height: 350px;"></div></td>
							</tr>
						</table>
					</div>
					<div id="Neural Network" class="container">
						<table width="100%">
							<tr>
								<td>
									<button type="button" class="btn btn-primary"
										onclick="onTrainClick()">Train Model...</button>
									<hr />
									<div class="progress">
										<div id="training_pg" class="progress-bar" role="progressbar"
											aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
											style="width: 0%"></div>
									</div>
									<hr />
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%" height="100%">
										<tr>
											<td width="80%"><div id="train_set"
													style="overflow-x: scroll; overflow-y: scroll; max-width: 900px; max-height: 300px;"></div></td>
											<td>
												<table width="100%" class="table">
													<tr>
														<td><label>Size (%):</label> <input
															class="form-control input-sm" id="n-items-percent"
															type="text" size="1" value="50"></td>
													</tr>
													<tr>
														<td><label>Epochs:</label> <input
															class="form-control input-sm" id="n-epochs" type="text"
															size="1" value="200"></td>
													</tr>
													<tr>
														<td><label>Learning Rate:</label> <input
															class="form-control input-sm" id="learning-rate"
															type="text" size="1" value="0.01"></td>
													</tr>
													<tr>
														<td><label>Hidden Layers:</label> <input
															class="form-control input-sm" id="hidden-layers"
															type="text" size="1" value="4"></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td><hr />
												<div id="nn_log"
													style="overflow-x: scroll; overflow-y: scroll; max-width: 900px; max-height: 250px;"></div></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div id="Prediction" class="container">
						<table width="100%">
							<tr>
								<td><button type="button" class="btn btn-primary"
										onclick="onPredictClick()">Predict</button>
									<hr /></td>
							</tr>
							<tr>
								<td><div id="pred-res"
										style="overflow-x: scroll; overflow-y: scroll; max-height: 300px;"></div></td>
							</tr>
							<tr>
								<td id="graph-pred"><hr />
									<div id="graph" style="height: 300px;"></div></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<div>
		<h4>Native Signal Diagram</h4>

		<div id='myDiv11'>
			<!-- Plotly chart will be drawn inside this DIV -->
		</div>
	</div>


	<div>
		<h4>Signal Trand Diagram</h4>

		<div id='myDiv12'>
			<!-- Plotly chart will be drawn inside this DIV -->
		</div>
	</div>


	<div>
		
		<div id='myDiv13'>
			<!-- Plotly chart will be drawn inside this DIV -->
		</div>
	</div>

 
 <div>
		<div id='myDiv122'>
			<!-- Plotly chart will be drawn inside this DIV -->
		</div>
	</div>


	<script type="text/javascript">
 
 var nativeSignal = [];
 var nativeSignal1 = [];
 
 var dataIteration1 = [];
 
 var forecast = [];
 var predValues = [];
 var predIndex = [];
 
 var i = 0; 

		var input_dataset = [], result = [];
		   var data_raw = []; var sma_vec = [];
		   
		  function ComputeSMA(time_s, window_size)
		  {
		       var r_avgs = [], avg_prev = 0;
		       for (let i = 0; i <= time_s.length - window_size; i++)
		       {
		       	  var curr_avg = 0.00, t = i + window_size;
		            for (let k = i; k < t && k <= time_s.length; k++)
		                 curr_avg += time_s[k]['price'] / window_size;

		            r_avgs.push({ set: time_s.slice(i, i + window_size), avg: curr_avg });

		            avg_prev = curr_avg;
		       }

		       return r_avgs;
		  }

		  function GenerateDataset(size)
		  { 
		      var dataset = [];
		      var dt1 = new Date(), dt2 = new Date();

		      dt1.setDate(dt1.getDate() - 1);
		      dt2.setDate(dt2.getDate() - size);

		      var time_start = dt2.getTime();
		      var time_diff = new Date().getTime() - dt1.getTime();

		      let curr_time = time_start;
		      for (let i = 0; i < size; i++, curr_time+=time_diff) {
		         var curr_dt = new Date(curr_time);
		         var hours = Math.floor(Math.random() * 100 % 24);
		         var minutes = Math.floor(Math.random() * 100 % 60);
		         var seconds = Math.floor(Math.random() * 100 % 60);
		         dataset.push({ id: i + 1, price: nativeSignal[i], 
		  	  timestamp: curr_dt.getFullYear() + "-" + ((curr_dt.getMonth() > 9) ? curr_dt.getMonth() : ("0" + curr_dt.getMonth())) + "-" + 
		                ((curr_dt.getDate() > 9) ? curr_dt.getDate() : ("0" + curr_dt.getDate())) + " [" + ((hours > 9) ? hours : ("0" + hours)) + 
		  		":" + ((minutes > 9) ? minutes : ("0" + minutes)) + ":" + ((seconds > 9) ? seconds : ("0" + seconds)) + "]" });
		      }

		      return dataset;
		  }

		   function Init() {
		      initTabs('Dataset'); initDataset();
		      document.getElementById("n-items").value = nativeSignal.length;
		      document.getElementById("window-size").value = "12";
		      document.getElementById('input-data').addEventListener('change', readInputFile, false);
		   }

		   function initTabs(tab) {
		      var navbar = document.getElementsByClassName("nav navbar-nav");
		      navbar[0].getElementsByTagName("li")[0].className += "active";
		      document.getElementById("dataset").style.display = "none";
		      document.getElementById("graph-plot").style.display = "none";
		      
		      setContentView(tab);
		   }

		   function setTabActive(event, tab) {
		      var navbar = document.getElementsByClassName("nav navbar-nav");
		      var tabs = navbar[0].getElementsByTagName("li");
		      for (var index = 0; index < tabs.length; index++)
		           if (tabs[index].className == "active") 
		               tabs[index].className = "";

		      if (event.currentTarget != null) {
		          event.currentTarget.className += "active";
		      }

		      var callback = null;
		      if (tab == "Neural Network") {
		          callback = function () { 
		             document.getElementById("train_set").innerHTML = getSMATable(1); 
		          }
		      }

		      setContentView(tab, callback);
		   }

		   function setContentView(tab, callback) {
		      var tabs_content = document.getElementsByClassName("container");
		      for (var index = 0; index < tabs_content.length; index++)
		           tabs_content[index].style.display = "none";

		      if (document.getElementById(tab).style.display == "none")
		          document.getElementById(tab).style.display = "block";

		      if (callback != null) {
		          callback();
		      }
		   }

		   function readInputFile(e) {
		      var file = e.target.files[0];
		      var reader = new FileReader();
		      reader.onload = function(e) {
		          var contents = e.target.result;
		          document.getElementById("input-data").value = "";
		          parseCSVData(contents);
		      };
		      reader.readAsText(file);
		   }  
		 
		   function parseCSVData(contents) {
		      data_raw = []; sma_vec = [];
		      var rows = contents.split("\n");

		      var params = rows[0].split(",");
		      var size = parseInt(params[0].split("=")[1]);
		      var window_size = parseInt(params[1].split("=")[1]);
		 
		      document.getElementById("n-items").value = size.toString();
		      document.getElementById("window-size").value = window_size.toString();

		      for (var index = 1; index < size + 1; index++) {
		          var cols = rows[index].split(",");
		          data_raw.push({ id: cols[0], timestamp: cols[1], price: cols[2] });
		      }

		      sma_vec = ComputeSMA(data_raw, window_size);
		      onInputDataClick();
		   }

		   function initDataset() {

		      var n_items = parseInt(document.getElementById("n-items").value);
		      var window_size = parseInt(document.getElementById("window-size").value);

		      data_raw = GenerateDataset(n_items);
		      sma_vec = ComputeSMA(data_raw, window_size);

		      onInputDataClick();
		   }

		   async function onTrainClick() { 

		      var inputs = sma_vec.map(function(inp_f) { 
		          return inp_f['set'].map(function(val) { return val['price']; })});
		      var outputs = sma_vec.map(function(outp_f) { return outp_f['avg']; });

		      var n_epochs     = parseInt(document.getElementById("n-epochs").value);
		      var window_size  = parseInt(document.getElementById("window-size").value);
		      var lr_rate      = parseFloat(document.getElementById("learning-rate").value);
		      var n_hl         = parseInt(document.getElementById("hidden-layers").value);
		      var n_items      = parseInt(document.getElementById("n-items-percent").value);

		      var callback = function(epoch, log) {
		          var log_nn = document.getElementById("nn_log").innerHTML;
		          log_nn += "<div>Epoch: " + (epoch + 1) + " Loss: " + log.loss + "</div>";
		          document.getElementById("nn_log").innerHTML = log_nn;
		          document.getElementById("training_pg").style.width = ((epoch + 1) * (100 / n_epochs)).toString() + "%";
		       	  document.getElementById("training_pg").innerHTML = ((epoch + 1) * (100 / n_epochs)).toString() + "%";
		      }

		      result = await trainModel(inputs, outputs, 
			n_items, window_size, n_epochs, lr_rate, n_hl, callback);

		      alert('Your model has been successfully trained...');
		   }

		   function onPredictClick(view) {
		      var inputs = sma_vec.map(function(inp_f) { 
			return inp_f['set'].map(function (val) { return val['price']; }); });
		      var outputs = sma_vec.map(function(outp_f) { return outp_f['avg']; });

		      var n_items = parseInt(document.getElementById("n-items-percent").value);

		      var outps = outputs.slice(Math.floor(n_items / 100 * outputs.length), outputs.length);

		      var pred_vals = Predict(inputs, n_items, result['model']);
              predValues = pred_vals;
              for(var k = 0; k < predValues.length; k ++){
            	  predIndex.push(k);
              }
              
              
              var data121 = [{
        		  z: [predValues,predValues],
        		  
        		  type: 'heatmap',
  			    hoverongaps: false
        		}];

        		var layout121 = {
        		  title: 'Signal Spectrogram Plot'
        		};

        		Plotly.newPlot('myDiv13', data121, layout121);
        		
        		var data28 = [
  		  		  {
  		  		    x:  predIndex,
  		  		    y: pred_vals,
  		  		    type: 'scatter'
  		  		  }
  		  		];

  		  		Plotly.newPlot('myDiv122', data28);
		  	  
		  	  
		      var data_output = ""; 
		      for (var index = 0; index < pred_vals.length; index++) {
		           data_output += "<tr><td>" + (index + 1) + "</td><td>" + 
			      outps[index] + "</td><td>" + pred_vals[index] + "</td></tr>";              
		      }

		      document.getElementById("pred-res").innerHTML = "<table class=\"table\"><thead><tr><th scope=\"col\">#</th><th scope=\"col\">Real Value</th> \
			<th scope=\"col\">Predicted Value</th></thead><tbody>" + data_output + "</tbody></table>";

		      var window_size  = parseInt(document.getElementById("window-size").value);

		      var timestamps_a = data_raw.map(function (val) { return val['timestamp']; });
		      var timestamps_b = data_raw.map(function (val) { 
			return val['timestamp']; }).splice(window_size, data_raw.length);

		      var timestamps_c = data_raw.map(function (val) { 
			return val['timestamp']; }).splice(window_size + Math.floor(n_items / 100 * outputs.length), data_raw.length);

		      var sma = sma_vec.map(function (val) { return val['avg']; });
		      var prices = data_raw.map(function (val) { return val['price']; });

		      var graph_plot = document.getElementById('graph-pred');
		      Plotly.newPlot( graph_plot, [{ x: timestamps_a, y: prices, name: "Series" }], { margin: { t: 0 } } );
		      Plotly.plot( graph_plot, [{ x: timestamps_b, y: sma, name: "SMA" }], { margin: { t: 0 } } );
		      Plotly.plot( graph_plot, [{ x: timestamps_c, y: pred_vals, name: "Predicted" }], { margin: { t: 0 } } );
		   }

		   function getInputDataTable() {
		      var data_output = ""; 
		      for (var index = 0; index < data_raw.length; index++)
		      {
		           data_output += "<tr><td>" + data_raw[index]['id'] + "</td><td>" + 
			    data_raw[index]['timestamp'] + "</td><td>" + data_raw[index]['price'] + "</td></tr>";
		      }

		      return "<table class=\"table\"><thead><tr><th scope=\"col\">#</th><th scope=\"col\">Timestamp</th> \
			<th scope=\"col\">Feature</th></thead><tbody>" + data_output + "</tbody></table>";
		   }

		   function getSMATable(view) {
		      var data_output = "";
		      if (view == 0) {
		          for (var index = 0; index < sma_vec.length; index++)
		          {
		               var set_output = "";
		               var set = sma_vec[index]['set'];
		               for (var t = 0; t < set.length; t++) {
		                   set_output += "<tr><td width=\"30px\">" + set[t]['price'] + 
			             "</td><td>" + set[t]['timestamp'] + "</td></tr>";
		               }
		  
		               data_output += "<tr><td width=\"20px\">" + (index + 1) + 
		     	        "</td><td>" + "<table width=\"100px\" class=\"table\">" + set_output + 
				  "<tr><td><b>" + "SMA(t) = " + sma_vec[index]['avg'] + "</b></tr></td></table></td></tr>";
		          }

		          return "<table class=\"table\"><thead><tr><th scope=\"col\">#</th><th scope=\"col\">Time Series</th>\
			   	</thead><tbody>" + data_output + "</tbody></table>";
		      }

		      else if (view == 1) {
		          var set = sma_vec.map(function (val) { return val['set']; });
		        
		          for (var index = 0; index < sma_vec.length; index++)
		          {
		               data_output += "<tr><td width=\"20px\">" + (index + 1) + 
		     	        "</td><td>[ " + set[index].map(function (val) { 
				    return (Math.round(val['price'] * 10000) / 10000).toString(); }).toString() + 
					" ]</td><td>" + sma_vec[index]['avg'] + "</td></tr>";
		          }

		          return "<table class=\"table\"><thead><tr><th scope=\"col\">#</th><th scope=\"col\">\
		             Input</th><th scope=\"col\">Output</th></thead><tbody>" + data_output + "</tbody></table>";
		      }
		   }

		   function onInputDataClick() {
		      document.getElementById("dataset").style.display = "block";
		      document.getElementById("graph-plot").style.display = "block";
		      document.getElementById("data").innerHTML = getInputDataTable();

		      var timestamps = data_raw.map(function (val) { return val['timestamp']; });
		      var prices = data_raw.map(function (val) { return val['price']; });

		      var graph_plot = document.getElementById('graph');
		      Plotly.newPlot( graph_plot, [{ x: timestamps, y: prices, name: "Stocks Prices" }], { margin: { t: 0 } } );
		   }

		   function onSMAClick() {
		      document.getElementById("data").innerHTML = getSMATable(0);

		      var sma = sma_vec.map(function (val) { return val['avg']; });
		      var prices = data_raw.map(function (val) { return val['price']; });

		      var window_size = parseInt(document.getElementById("window-size").value);

		      var timestamps_a = data_raw.map(function (val) { return val['timestamp']; });
		      var timestamps_b = data_raw.map(function (val) { 
			return val['timestamp']; }).splice(window_size, data_raw.length);

		      var graph_plot = document.getElementById('graph');
		      Plotly.newPlot( graph_plot, [{ x: timestamps_a, y: prices, name: "Series" }], { margin: { t: 0 } } );
		      Plotly.plot( graph_plot, [{ x: timestamps_b, y: sma, name: "SMA" }], { margin: { t: 0 } } );
		   }
		   
		   
		   
		   <c:forEach items="${trandGraph}" var="nativeSignalVal" >
		   
		   i = i +1;
		  		xValue = ${nativeSignalVal};
		  		nativeSignal.push (xValue);
		  		dataIteration1.push(i);
		  </c:forEach>
		  
		  <c:forEach items="${signalFreqwVibr}" var="nativeSignalVal" >
		   
		   i = i +1;
		  		xValue = ${nativeSignalVal};
		  		nativeSignal1.push (xValue);
		  		dataIteration1.push(i);
		  </c:forEach>


		  <c:forEach items="${trandGraph}" var="trandVal" >

		  i = i +1;
		  		xValue = ${trandVal};
		  		forecast.push (xValue);
		  		dataIteration1.push(i);
		  </c:forEach>





		   var data26 = [
		  	  {
		  	    x: dataIteration1,
		  	    y: nativeSignal1,
		  	    type: 'scatter'
		  	  }
		  	];

		  	Plotly.newPlot('myDiv11', data26);
		  	
		  	
		  	var data27 = [
		  		  {
		  		    x: dataIteration1,
		  		    y: forecast,
		  		    type: 'scatter'
		  		  }
		  		];

		  		Plotly.newPlot('myDiv12', data27);
		  		
		  		
		  		
	
	
 </script>
</body>
</html>