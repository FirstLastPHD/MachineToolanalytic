<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page isELIgnored="false"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Machines Analytic</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="assets/css/normalize.min.css">
<link rel="stylesheet"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="assets/css/themify-icons.css">
<link rel="stylesheet"
	href="assets/css/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="assets/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="assets/css/chartist.min.css"
	rel="stylesheet">
<link
	href="assets/css/jqvmap.min.css"
	rel="stylesheet">

<link
	href="assets/css/weather-icons.css"
	rel="stylesheet" />
<link
	href="assets/css/fullcalendar.min.css"
	rel="stylesheet" />

<style>

.traffic-chart {
	min-height: 335px;
}




.highcharts-figure, .highcharts-data-table table {
	min-width: 360px;
	max-width: 800px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 0 auto;
}

#container {
	height: 400px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.chx_tbl{
  
  width:100px;

}
</style>

<style type="text/css" media="screen">
.cvsEg {
	position: relative; /* positioned to parent bottom menus */
	display: block; /* must have for position canvas elements */
	margin: 20px auto;
	padding: 0;
	background-color: lightyellow;
	border: 1px solid black;
}

.text_01 .captionHolder {
	margin-left: 2em;
	font-family: "Arial";
	font-size: 11px;
}

canvas {
	border: solid 1px red;
}
</style>


<script src="assets/js/highcharts.js"></script>
<script src="assets/js/exporting.js"></script>
<script src="assets/js/modules/export-data.js"></script>
<script src="assets/js/modules/accessibility.js"></script>

<link rel="stylesheet" type="text/css" href="assets/css/jquery.jqChart.css" />
<link rel="stylesheet" type="text/css" href="assets/styles.css" />
<script src="assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.jqChart.min.js" type="text/javascript"></script>
<script src="assets/js/Spectrogram-1v00.js" type="text/javascript"></script>
<script src="assets/js/IndexNested.js" type="text/javascript"></script>
<script src="assets/js/fft.js" type="text/javascript"></script>
<script src='assets/js/plotly-latest.min.js'></script>

</head>

<body>
	
	<!-- Left Panel -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp"><img src="images/dash.png"
						alt="dash">Dashboard </a></li>
					<li class="menu-title">Operations</li>
					<!-- /.menu-title -->
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img src="images/write.png"
						alt="dash">Write data to file
					</a>
						<ul  class="sub-menu children dropdown-menu">
							<li>
							<!-- <a
								href="allNodesCSV.html">CSV all nodes</a>
								</li> -->
								<form:form method="POST" action="allNodesCSV.html" modelAttribute="signalPref" >

                                 <table  class="table table-bordered">
								<tr>
                                                 
                                                  <td><form:select path="dev_id0" items="${machineToolOptions}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td ><form:select path="txDt_From" items="${timeFromOptions}" style="width:50%"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><form:select path="txDt_To" items="${timeToOptions}" style="width:50%"/></td>
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
                                    </li>
							<!--  <li><i class="fa fa-id-badge"></i><a
								href="singleNodeCSV.html">CSV single node</a></li>-->
				
						</ul></li>
					
					

					<li class="menu-title">Extras</li>
					<!-- /.menu-title -->
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-glass"></i>Pages
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="menu-icon fa fa-sign-in"></i><a
								href="page-login.jsp">Login</a></li>
							<li><i class="menu-icon fa fa-sign-in"></i><a
								href="page-register.jsp">Register</a></li>
							<li><i class="menu-icon fa fa-paper-plane"></i><a
								href="pages-forget.jsp">Forget Pass</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="./"><img src="images/logo.png"
						alt="Logo"></a> <a class="navbar-brand hidden" href="./"><img
						src="images/menu.png" alt="Logo"></a> <a id="menuToggle"
						class="menutoggle"><img src="images/menu.png"
						alt="menu"></a>
				</div>
			</div>
			<div class="top-right">
				<div class="header-menu">
					<div class="header-left">
						<button class="search-trigger">
							<i class="fa fa-search"></i>
						</button>
						<div class="form-inline">
							<form class="search-form">
								<input class="form-control mr-sm-2" type="text"
									placeholder="Search ..." aria-label="Search">
								<button class="search-close" type="submit">
									<i class="fa fa-close"></i>
								</button>
							</form>
						</div>

						<div class="dropdown for-notification">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="notification" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="fa fa-bell"></i> <span class="count bg-danger">3</span>
							</button>
							<div class="dropdown-menu" aria-labelledby="notification">
								<p class="red">You have 3 Notification</p>
								<a class="dropdown-item media" href="#"> <i
									class="fa fa-check"></i>
									<p>Server #1 overloaded.</p>
								</a> <a class="dropdown-item media" href="#"> <i
									class="fa fa-info"></i>
									<p>Server #2 overloaded.</p>
								</a> <a class="dropdown-item media" href="#"> <i
									class="fa fa-warning"></i>
									<p>Server #3 overloaded.</p>
								</a>
							</div>
						</div>

						<div class="dropdown for-message">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="message" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="fa fa-envelope"></i> <span class="count bg-primary">4</span>
							</button>
							<div class="dropdown-menu" aria-labelledby="message">
								<p class="red">You have 4 Mails</p>
								<a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/1.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Jonathan Smith</span> <span
											class="time float-right">Just now</span>
										<p>Hello, this is an example msg</p>
									</div>
								</a> <a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/2.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Jack Sanders</span> <span
											class="time float-right">5 minutes ago</span>
										<p>Lorem ipsum dolor sit amet, consectetur</p>
									</div>
								</a> <a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/3.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Cheryl Wheeler</span> <span
											class="time float-right">10 minutes ago</span>
										<p>Hello, this is an example msg</p>
									</div>
								</a> <a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/4.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Rachel Santos</span> <span
											class="time float-right">15 minutes ago</span>
										<p>Lorem ipsum dolor sit amet, consectetur</p>
									</div>
								</a>
							</div>
						</div>
					</div>

					<div class="user-area dropdown float-right">
						<a href="#" class="dropdown-toggle active" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <img
							class="user-avatar rounded-circle" src="images/admin.jpg"
							alt="User Avatar">
						</a>

						<div class="user-menu dropdown-menu">
							<a class="nav-link" href="#"><i class="fa fa- user"></i>My
								Profile</a> <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications
								<span class="count">13</span></a> <a class="nav-link" href="#"><i
								class="fa fa -cog"></i>Settings</a> <a class="nav-link" href="#"><i
								class="fa fa-power -off"></i>Logout</a>
						</div>
					</div>

				</div>
			</div>
		</header>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<!-- Widgets  -->
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-1">
										<i class="pe-7s-config"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												$<span class="count">23569</span>
											</div>

											<h4 class="box-title">Machines</h4>


											<h3>Machine Tools:</h3>
											

												<table>
													<tr>
														<td><b>Device:</b></td>

														<td>${device_id}</td>
													</tr>

												</table>
										


											<div class="stat-heading">Revenue</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-2">
										<i class="pe-7s-stopwatch"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count">3435</span>
											</div>
											<div class="stat-heading">Time Period</div>
											<h4 class="box-title">From</h4>

												<table>
													<tr>
														<td>${timestampFrom}</td>
													</tr>
												</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-3">
										<i class="pe-7s-alarm"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count">349</span>
											</div>
											<div class="stat-heading">Time Period To</div>
											<h2 class="box-title">To</h2>

												<table class="1">
													<tr>
														<td><b>Time Period To:</b></td>
														<td>${timestamoTo}</td>
													</tr>
													
												</table>
											

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-4">
										<i class="pe-7s-share"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count">2986</span>
											</div>
											<div class="stat-heading">Machine State</div>
											
													<h3>${dev_state}</h3>

														



										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Widgets -->
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
					<!-- Orders -->
					

							<div class="row">
							
							   <div class="col-lg-12">
							    <div class="card" style="margin-left: 15px;  ">
							   <div class="card-body">
								<h4 class="box-title">Signales</h4>

									<form:form method="POST" action="signal.html" modelAttribute="signalPref">

                                           <table class="table table-bordered">
                                                 <tr>
                                                   <td><b>Choose Machine Signal:</b></td>
                                                    <td><form:select path="signalName" items="${signalOptions}"/></td>
                                                 </tr>
                                                  
                                                  <tr>
                                                    <td><b>Machine Tool:</b></td>
                                                    <td><form:select path="dev_id0" items="${machineToolOptions}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><b>TimeStamp To:</b></td>
                                                    <td><form:select path="txDt_From" items="${timeFromOptions}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><b>Timestamp From:</b></td>
                                                    <td><form:select path="txDt_To" items="${timeToOptions}"/></td>
                                                  </tr>
                                                  
                                                  
                                                  <tr>
                                                    <td><b>Signal Operations:</b></td>
                                                    <td><form:select path="signal_operations" items="${signalOperationsOptions}"/></td>
                                                  </tr>
                   
                                                    <tr>
                                                      <td><input type="submit" value="Calculate Anomalies" onclick="messageFunction()"></td>
                                                     </tr>
                                                </table>
                                             </form:form>
                                          </div>
                                          
                                        <div class="card-body">
								<h4 class="box-title">Signal Table </h4>

									<form:form method="POST" action="multipleAxes.html" modelAttribute="signalPref">
									
									<!--<form:checkboxes path="signalName" items="${signalOptions}"/>-->  

                                           <table  class="table table-bordered">
                                                 <tr class="chx_tbl">
                                                   <!-- <td><b>Choose Machine Signal:</b></td> -->
                                                    <!--<td><form:select path="signalName" items="${signalOptions}"/></td>-->
                                                    <td class="chx_tbl" ><form:checkboxes path="signalName" items="${signalOptions}"/></td>
                                                 </tr>
                                                  
                                                  <tr>
                                                    <!-- <td><b>Machine Tool:</b></td> -->
                                                    <td><form:select path="dev_id0" items="${machineToolOptions}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <!--<td><b>TimeStamp To:</b></td>-->
                                                    <td><form:select path="txDt_From" items="${timeFromOptions}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <!-- <td><b>Timestamp From:</b></td> -->
                                                    <td><form:select path="txDt_To" items="${timeToOptions}"/></td>
                                                  </tr>
                                                  
                                                  
                                                  <tr>
                                                    <!-- <td><b>Signal Operations:</b></td> -->
                                                    <td><form:select path="signal_operations" items="${chooseAxesSignalOperations}"/></td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td><form:select path="signal_writing_operations" items="${writingMAxesOptions}"/></td>
                                                  </tr>
                   
                                                    <tr>
                                                      <td><input type="submit" value="Calculate Anomalies" onclick="messageFunction()"></td>
                                                     </tr>
                                                </table>
                                             </form:form>
                                          </div>   
							    
							
							    <div class="card-body">
					             <h4> Condition Monitoring 3D Vizualization </h4>
					             <div id='myDiv1' ><!-- Plotly chart will be drawn inside this DIV --></div>
                    
                                </div>
                                
                           </div>
                           </div>
                           </div>
					        <div class="clearfix"></div>

					
					
					
                    <!-- -------- -->
                    
                    </div>
                    
                    
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
                    
                     <div>
                       <h5> PCA Component1 FFT </h5>
                     <div id='myDivPCAFFT1'><!-- Plotly chart will be drawn inside this DIV -->
                     </div>
                     <h3> maxV : ${maxFFT1Value} Hz</h3>
                     <h3> minV :${minFFT1Value} Hz</h3>
                     <h3> meanV: ${meanFFT11} Hz</h3>
                    </div>
                    
                    <div>
                       <h5> PCA Component2 FFT </h5>
                     <div id='myDivPCAFFT2'><!-- Plotly chart will be drawn inside this DIV -->
                     </div>
                     
                     <h3> maxV : ${maxFFT2Value} Hz</h3>
                     <h3> minV :${minFFT2Value} Hz</h3>
                     <h3> meanV: ${meanFFT21} Hz</h3>
                     
                    </div>
                    
                    
                    <h5> PCA1 Spectrogram </h5>
                    <div id='myDiv2'><!-- Plotly chart will be drawn inside this DIV --></div>
                    
                    <div id='myDiv3'><!-- Plotly chart will be drawn inside this DIV --></div>
                    
	                 </div>
	                 
	                 
	                
	                 
	                 
	                 
	                 <div class="card-body">
					<h4> Anomalies State 3D Vizualization </h4>
					<div id='myDiv4' ><!-- Plotly chart will be drawn inside this DIV --></div>
                    
                    </div>
                    <!-- -------- -->
                    
                    
                    <div class="card-body">
                    <h4> Anomalies State Spectrogram </h4>
                    <div id='myDiv5'><!-- Plotly chart will be drawn inside this DIV --></div>
                    </div>
                    
                    <div class="card-body">
                    <div id='myDiv6'><!-- Plotly chart will be drawn inside this DIV --></div>
                    </div>
	               
	
					
				</div>
				<!-- .animated -->
			</div>
			<!-- /.content -->
			<div class="clearfix"></div>
			<!-- Footer -->
			<footer class="site-footer">
				<div class="footer-inner bg-white">
					<div class="row">
						<div class="col-sm-6">Copyright &copy; 2020 TMC</div>
						<div class="col-sm-6 text-right">
							Designed by <a href="https://tajmac-zps.cz">Tajmac-zps</a>
						</div>
					</div>
				</div>
			</footer>
			<!-- /.site-footer -->
		</div>
		<!-- /#right-panel -->

		<!-- Scripts -->
		<script
			src="assets/js/jquery.min.js"></script>
		<script
			src="assets/js/popper.min.js"></script>
		<script
			src="assets/js/bootstrap.min.js"></script>
		<script
			src="assets/js/jquery.matchHeight.min.js"></script>
		<script src="assets/js/main.js"></script>

		<!--  Chart js -->
		<script
			src="assets/js/Chart.bundle.min.js"></script>

		<!--Chartist Chart-->
		<script
			src="assets/js/chartist.min.js"></script>
		<script
			src="assets/js/chartist-plugin-legend.min.js"></script>

		<script
			src="assets/js/jquery.flot.min.js"></script>
		<script
			src="assets/js/jquery.flot.pie.min.js"></script>
		<script
			src="assets/js/jquery.flot.spline.min.js"></script>

		<script
			src="assets/js/jquery.simpleWeather.min.js"></script>
		<script src="assets/js/init/weather-init.js"></script>

		<script src="assets/js/moment.min.js"></script>
		<script
			src="assets/js/fullcalendar.min.js"></script>
		<script src="assets/js/init/fullcalendar-init.js"></script>

		<!--Local Stuff-->
		<!--Local Stuff-->
		
<script type="text/javascript"> 
function messageFunction(){
	 alert(" Please wait some time, when calculation wil be complete... ");
}

</script>		
		
<script type="text/javascript">
		
//Html5 canvas
  var data1 = [];
  var data2 = [];
  
  var dataN1 = [];
  var dataN2 = [];
  
  var data3 = [];
 
  var data11 = [];
  var data12 = [];
  var timestamps = [];
  var i = 0; 
  var dataIteration = [];
  var fftPCA1 = [];
  var fftPCA2 = [];
  
  /* Try get a timestamp values Dostat Timestampy */
  
    <c:forEach items="${fftPC1}" var="dataNPoint1" >	
		xValue = ${dataNPoint1};
		fftPCA1.push (xValue);
  </c:forEach>
  
  
  <c:forEach items="${fftPC2}" var="dataNPoint2" >	
	xValue = ${dataNPoint2};
	fftPCA2.push (xValue);
</c:forEach>
  
  
    
       <c:forEach items="${pcaNative1}" var="dataNPoint1" >	
   		xValue = ${dataNPoint1};
   		dataN1.push (xValue);
      </c:forEach>
      
      
      <c:forEach items="${pcaNative2}" var="dataNPoint2" >	
 		xValue = ${dataNPoint2};
 		dataN2.push (xValue);
    </c:forEach>
    
    
  
       <c:forEach items="${pca1}" var="dataPoint1" >	
   		xValue = ${dataPoint1};
   		data1.push (xValue);
      </c:forEach>
      
     <c:forEach items="${pca2}" var="dataPoint2">
     		yValue = ${dataPoint2};
     		i = i+1;
     		dataIteration.push(i);
     	    data2.push(yValue);	
     </c:forEach> 
     
     for (var  i = 0; i < data2.length; i++){
    	 data3.push([data1[i],data2[i]]);
     }
 
  
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
        data: data1

    }, {
        name: 'Principal Component2',
        color: 'rgba(119, 152, 191, .5)',
        data: data2
    }]
});


$(document).ready(function () {
    $('#jqChart').jqChart({
        title: { text: 'Machine Tool Anomalies Detection' },
        animation: { duration: 3 },
        series: [
            {
                title: 'PCA1/PCA2',
                type: 'scatter',
                data: data3,
                markers: {
                    type: 'diamond',
                    size: 8
                }
            },
            /*{
                title: 'Scatter 2',
                type: 'scatter',
                data: data2,
                markers: {
                    type: 'rectangle',
                    size: 8
                }
            }*/
        ]
    });
});



var mainMatrixData = [];

var anomaliesMatrix = [];

var pca1Anomaly = [];
var pca2Anomaly = [];

pca1Anomaly.push(fftPCA1);
pca1Anomaly.push(fftPCA1);

pca2Anomaly.push(fftPCA2);
pca2Anomaly.push(fftPCA2);


<c:forEach items="${signaValues}" var="matrixPoint" >	
	xValue = ${matrixPoint};
	mainMatrixData.push (xValue);
</c:forEach>

<c:forEach items="${metrixFinalObject}" var="anomaliesPoint" >	
xValue = ${anomaliesPoint};
anomaliesMatrix.push (xValue);
</c:forEach>

	
	  
	
	var data323 = [{
	           z: mainMatrixData,
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
	Plotly.newPlot('myDiv1', data323, layout123);
	

	





	
	var data32 = [
		  {
		    z: pca1Anomaly,
		   
		    type: 'heatmap',
		    hoverongaps: false
		  }
		];

		Plotly.newPlot('myDiv2', data32);
		
		
		
		
		var data33 = [{
			  z: pca2Anomaly,
			  type: 'contour',
			  colorscale: 'Jet',
			}];

			var layout1123 = {
			  title: 'PCA2 spectrogram '
			};

			Plotly.newPlot('myDiv3', data33, layout1123);
			
			
// Anomalies Detection Diagrams

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
	

	
	var data324 = [
		  {
		    z: anomaliesMatrix,
		   
		    type: 'heatmap',
		    hoverongaps: false
		  }
		];

		Plotly.newPlot('myDiv5', data324);
		
		
		
		
		var data335 = [{
			  z: anomaliesMatrix,
			  type: 'contour',
			  colorscale: 'Jet',
			}];

			var layout11235 = {
			  title: 'Condition monitoring node spectrogram '
			};

			Plotly.newPlot('myDiv6', data335, layout11235);
			
			
			var dataPCA = [
				  {
				    x: dataIteration,
				    y: dataN1,
				    type: 'scatter'
				  }
				];

				Plotly.newPlot('myDivPCA1', dataPCA);
				
				
				var dataPCA2 = [
					  {
					    x: dataIteration,
					    y: dataN2,
					    type: 'scatter'
					  }
					];

					Plotly.newPlot('myDivPCA2', dataPCA2);
					
					
					
					var dataFFTPCA = [
						  {
						    x: dataIteration,
						    y: fftPCA1,
						    type: 'scatter'
						  }
						];

						Plotly.newPlot('myDivPCAFFT1', dataFFTPCA);
						
						
						var dataFFTPCA2 = [
							  {
							    x: dataIteration,
							    y: fftPCA2,
							    type: 'scatter'
							  }
							];

							Plotly.newPlot('myDivPCAFFT2', dataFFTPCA2);
							
							
							//var data3356 = [{
								 // z: mainMatrixData,
								  //type: 'heatmap',
								  //hoverongaps: true,
								  //colorscale: 'Jet',
								//}];

								//var layout112356 = {
								  //title: 'Condition monitoring node spectrogram '
								//};

								//Plotly.newPlot('myDiv686', data3356, layout112356);		
							
	
</script>
</body>
</html>