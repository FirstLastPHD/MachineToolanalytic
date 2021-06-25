<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<title>Machine Tool Calculate Anomalies</title>


<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Machines Analytic  - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/device.css">
    
      
<style type="text/css">
body {
  background-color: #fff;
   background-image:
   linear-gradient(90deg, transparent 79px, #abced4 79px, #abced4 81px, transparent 81px),
   linear-gradient(#eee .1em, transparent .1em);
   background-size: 100% 1.2em;
}
.tableK {
background-color: #ccc;}

</style>
</head>
<body>
	
	   <!--  <br>
	<div style="text-align: center">-->
		
		 <div class="card">
         <div class="card-body">
         
		<h4 style="text-align: center"><strong>Select Machine Tool From Device List</strong><br> </h4><br>
			<h4 style="text-align: center"><strong> You can choose data range between  1: and  "${dbRecords}" </strong></h4>
			
			 </div>
               </div>
               
			
			 <div class="content">
			     <div class=" col-md-6" >
			     
			     <div class="tableK">
			 
			  <form:form method="POST" action="device.html" modelAttribute="devicePref">

                 <table class="table table-striped" >
                 
                 <tr>
                    <td><b>Select Range From:</b></td>
                    
                    <td><form:input type="text" path="startRange"  /></td>
                 </tr>
                 
                 <!--  <tr>
                    <td><b>Select Range To:</b></td>
                    <td><form:input type="text" path="endRange" /></td>
                 </tr>-->
                 
                 
                 <tr>
                    <td><b>Choose Machine Tool :</b></td>
                     <td><form:select path="dev_id0" items="${deviceOptions}"/></td>
                   </tr>
                   
                   
                 <tr>
                    <td><b>Choose Machine State :</b></td>
                     <td><form:select path="dev_stat" items="${machineStOptions}"/></td>
                 </tr>
                 
                 
                 <tr>
                     <td><b>Records Count:</b></td>
                     <td><form:select path="recordCount" items="${dbRecordOptions}"/></td>
                   </tr>
                   
                    
                   
                 <tr>
                 <td><input type="submit" value="Get Machine Tool"></td>
                 </tr>
                  </table>
               </form:form>
               
               </div>
               </div>
               </div>
               
	

</body>
</html>