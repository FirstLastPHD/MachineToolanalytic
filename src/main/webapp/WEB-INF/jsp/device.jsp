<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page isELIgnored="false" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/device.css">

   
<script src="assets/js/highcharts.js"></script>
<script src="assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.jqChart.min.js" type="text/javascript"></script>
<script src="assets/js/Spectrogram-1v00.js" type="text/javascript"></script>
<script src="assets/js/IndexNested.js" type="text/javascript"></script>
<script src="assets/js/fft.js" type="text/javascript"></script>

</head>

<body>
    <!-- Left Panel -->
   
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                   
                </div>
            </div>
            
        </header>
        </div>
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
                                            <div class="stat-text">$<span class="count">23569</span></div>
                                            
                                            
                                            <h4 class="stat-heading"> Data Range From: </h4>
                                            <h4 class="stat-heading"> ${deviceFrom}</h4>
                                            <h4 class="stat-heading"> Data Range To: </h4>
                                            <h4 class="stat-heading"> ${deviceFrom + 30000} </h4>
                                            <!-- <h4 class="stat-heading">${deviceTo}</h4> -->
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        
                                             
                                              
                 <form:form method="POST" action="spectrogram.html" modelAttribute="timeStampPref">

                 <table  class="table table-bordered">
                 <tr >
                    <td ><b>Choose Machine Tool :</b></td>
                     <td ><form:select path="dev_id0" items="${deviceMsrOptions}"/></td>
                   </tr>
                   
                    <tr>
                     <td><b>Range From:</b></td>
                     <td><form:select path="msr_txdt" items="${timeStampFromOptions}"/></td>
                   </tr>
                   
                   <tr>
                     <td><b>Range To:</b></td>
                     <td><form:select path="msr_txdt" items="${timeStampToOptions}"/></td>
                   </tr>
                   
                   <tr>
                     <td><b>PCA Calculating:</b></td>
                     <td><form:select path="pcaState" items="${pcaStateOptions}"/></td>
                   </tr>
                   
                   <tr>
                     <td><b>Device State:</b></td>
                     <td><form:select path="dev_state" items="${machineStateOptions}"/></td>
                   </tr>
                   
                 <tr>
                 <td><input type="submit" value="Calculate Anomalies" onclick="messageFunction()"></td>
                 </tr>
                  </table>
               </form:form>
                                             
                                     
                    </div>

                  

                </div>
                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="card-body">
                                        
                                         <div id="container"></div>
                     
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card-body">
                                     <div id="jqChart" style="width: 450px; height: 300px;">
                                       
                                    </div> <!-- /.card-body -->
                                </div>
                            </div> <!-- /.row -->
                            <div class="card-body"></div>
                        </div>
                       
                    </div><!-- /# column -->
                </div>
                <!--  /Traffic -->
                <div class="clearfix"></div>
                <!-- Orders -->
                <div class="orders">
                   
                </div>
                
                
                
                
               
            <!-- /#add-category -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2020 Amature
                    </div>
                    <div class="col-sm-6 text-right">
                        Designed by <a href="https://os.zps.cz">TM</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /.site-footer -->
    </div>


   <script type="text/javascript">
   function messageFunction(){
		 alert(" Please wait some time, when calculation wil be complete... ");
	 }
   </script>
    
    <script type="text/javascript">

//Html5 cancas
  var data1 = [];
  var data2 = [];
  var data3 = [];
 
  var data11 = [];
  var data12 = [];
  var timestamps = [];
  var i = 0; 
    
  /* Try get a timestamp values Dostat Timestampy */
  
    
  
  
       <c:forEach items="${pca1}" var="dataPoint1" >	
   		xValue = ${dataPoint1};
   		data1.push (xValue);
      </c:forEach>
      
     <c:forEach items="${pca2}" var="dataPoint2">
     		yValue = ${dataPoint2};
     		i = i+1;
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







</script>


</body>
</html>