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
    

</head>
<body>
	<!--  <br>
	<div style="text-align: center">-->
		
		 <div class="card">
         <div class="card-body">
		<h3 style="text-align: center">
			<a href="device.html">Click here to Machine Tool Analytic... </a>(to
			check Machine Tool Analytic ... @RequestMapping("/device"))
		</h3>
		
		</div>
	</div>
		
		
		<h2>Select Machine Tool From Device List<br> </h2><br>
		
		 <div class="content">
		 <div class="col-lg-3 col-md-6">
			
			  <form:form method="GET" action="Index.html" modelAttribute="devicePref">

                 <table class="table table-bordered">
                 <tr>
                    <td><b>Choose Machine Tool :</b></td>
                     <td><form:select path="dev_id0" items="${deviceOptions}"/></td>
                   </tr>
                   
                    
                   
                 <tr>
                 <td><input type="submit" value="Get Machine Tool"></td>
                 </tr>
                  </table>
               </form:form>
		
	</div>
	</div>
	

</body>
</html>