<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAFNA";
try {
%>
<html lang="en">
<!--begin::Head-->
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>

<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
</style>
<style>
table.a {
	table-layout: auto;
	width: 100%;
}
</style>
</head>
<!--end::Head-->
<!--begin::Body-->


<body id="kt_body"
style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-77.jpeg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<!--begin::Main-->
	<!--begin::Header Mobile-->
	
	<!--end::Header Mobile-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page ">
			<!--begin::Aside-->
			
      <jsp:include page="/form/common/navbar.jsp"></jsp:include>

			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper "
				id="kt_wrapper">
				<!--begin::Header-->
				
				
				<jsp:include page="/form/common/header.jsp"></jsp:include>
				<!--end::Header-->

<				<!--begin::Content-->
				<div
							class="container d-flex align-items-stretch justify-content-between"">
							<div class="col-xl-12 offset-xl-0 ">
									<div class="col-xl-12 offset-xl-0 ">
										<div class="example mb-10">
											<div class="example-preview">
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														<div class="card-body">
				
				<div class="card card-custom gutter-b ">
				<div class="dropdown dropdown-inline " >
					<button type="button1" class="  btn  font-weight-bolder " style="float:right;"
						value="Create Print" id="Print" onclick="MyApp.printTable()">
						<i class="icon-2x flaticon2-printer" style="color: #f64e60"></i>
					</button>
					<button type="button " class=" btn font-weight-bolder " style="float:right;"
						value="Create PDF" id="PDF" onclick="run()">
						<i class=" icon-2x fas fa-file-pdf " style="color: #f64e60"></i>
					</button>
					<button onclick="dataContentExportExl('card_Report', 'user-data')"
						class="  btn  font-weight-bolder " style="float:right;" value="Create Excel" id="Excel">
						<i class=" icon-2x fas fa-file-excel" style="color: #f64e60"></i>
					</button>
				</div>
		<div class="card-body" id="card_Report">
		<div class="row mb-10">
		<div class="col-6">
		<font size="+2"><u>Name : <span id="patient_name"></span></u></font>
		</div><div class="col-6 text-right">
		<font size="+2"><u>Date : <span id="date1"></span> To <span id="date2"></span> </u></font>
		</div>
		 <br /></div>

			<u><center><font size="+3">Temperature Chart</font> <font size="+2">( ताप मोजमाप तक्ता )</font></center></u>

		
			
			 <br />
			<table class="table" style="border: 1px solid black">
				<thead>
					<tr>

						<th style="text-align: center;" scope="col"><h4>No.</h4><h6>(क्रमांक)</h6></th>
						<th style="text-align: center" scope="col"><h4>Date</h4><h6>(दिनांक)</h6></th>
						<th style="text-align: center;" scope="col"><h4>Time</h4><h6>(वेळ)</h6></th>
						<th style="text-align: center" scope="col"><h4>Temp</h4><h6>(ताप)</h6></th>
						<th style="text-align: center" scope="col"><h4>Medicine</h4><h6>(औषध)</h6></th>

					

						
						
					</tr>
				</thead>
				<tbody class="table_body">
				</tbody>
			</table>
		</div>
	</div>
				<!--end::Entry-->
</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	</div>
	</div>
	</div>
	</div>


				<!--end::Content-->
				<!--begin::Footer-->
				<jsp:include page="../common/footer.jsp"></jsp:include>

				<!--end::Footer-->
			
	<!--end::Main-->
	
	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
				height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2"
					height="10" rx="1" />
						<path
					d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>
	<style>
.alert {
	padding: 20px 40px;
	min-width: 40%;
	position: fixed;
	right: 0;
	top: 10px;
	border-radius: 4px;
	border-left: 8px solid #ffa502;
	overflow: hidden;
	opacity: 0;
	pointer-events: none;
}

.alert.hide {
	animation: hide_slide 1s ease forwards;
}

.alert.showAlert {
	opacity: 1;
	pointer-events: auto;
}

.alert.show {
	animation: show_slide 1s ease forwards;
}

@
keyframes show_slide { 0%{
	transform: translateX(100%);
}

40
%
{
transform
:
translateX(
-10%
);
}
80
%
{
transform
:
translateX(
0%
);
}
100
%
{
transform
:
translateX(
-10px
);
}
}
@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}

40
%
{
transform
:
translateX(
0%
);
}
80
%
{
transform
:
translateX(
-10%
);
}
100
%
{
transform
:
translateX(
100%
);
}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
	<!--end::Scrolltop-->
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>

	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	var date = new Date();
	var today = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
	var from_date = today;
	var till_date = today;
	
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const patient_name = urlParams.get('patient_name');
	const date1  = urlParams.get('from_date');
	const date2  = urlParams.get('till_date');
	$('#patient_name').text(patient_name);
	$('#date1').text(date1);
	$('#date2').text(date2);
	
	
	 for(var i = 1; i <= 10; i++){
	 	  var html = '';
	 	  html += '<tr>';
	 	  html += '<td >' + i + '</td>';
	 	  html += '<td><input type="text" class="form-control Visit ID d-flex flex-column-fluid" name="visitId" id="visitId-' + i + '" style="background-color:#FFFFFF; border:0px; width: 120px;text-align:center" disabled>  </input></td>';
	 	  html += '<td><input type="text" class="form-control Visit Date d-flex flex-column-fluid" id="visitDate-' + i +'" name="visitDate" style="background-color:#FFFFFF; border:0px; width: 140px " disabled></input></td>';
	 	  html += '<td><input type="text" class="form-control Complaint d-flex flex-column-fluid" name="complaint" id="complaint-' + i + '" style="background-color:#FFFFFF; border:0px; width: 205px " disabled></input></td>';
	 	  html += '<td><textarea class="form-control Diagosis d-flex flex-column-fluid" name="diagnosis" id="diagnosis-' + i + '" style="background-color:#FFFFFF; border:0px; width: 500px; height:100px" disabled></textarea></td>';
	 	  $('.table_body').append(html);
	
	 }
	/* var html;
	$.ajax({
		url : base + "/dssAPI/dfapi/getCityWisePatientCount",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag":1
			},
		success:function(data)
	    {
	 	const row = data.find(d => d.city_desc != '');
			data.forEach((row)=> {
			html +="<tr id= tr-id-2 class= tr-class-2>"
			html += "<td class='text-center'>"+row.city_desc+"</td>"; 
			 html += "<td class='text-center'>"+row.patient_count+"</td>";
	          
	 	       	 html +="</tr>"
				});
			 $(".table_body").html(html);
		}
	   });	 */
	$(document).ready(function(){
		  // Search all columns
		  $('#txt_searchall').keyup(function(){
		    // Search Text
		    var search = $(this).val();

		    // Hide all table tbody rows
		    $('table tbody tr').hide();

		    // Count total search result
		    var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

		    if(len > 0){
		      // Searching text in columns and show match row
		      $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
		        $(this).closest('tr').show();
		      });
		    }else{
		      $('.notfound').show();
		    }
		  });
		});
	$.expr[":"].contains = $.expr.createPseudo(function(arg) {
		   return function( elem ) {
		     return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
		   };
		});
	 
	 var MyApp = new function () {
	     this.printTable = function () {
	         var tab = document.getElementById('card_Report');
	         printHeader:"<h1>Example Table Header<h1>"

	         var style = "<style>";
	             style = style + "table {width: 100%;font: 17px Calibri;}";
	             style = style + "table, th, td {border: solid 1px #000000; border-collapse: collapse;";
	             style = style + "padding: 2px 3px;text-align: center;}";
	             style = style + "</style>";

	         var win = window.open('', '', 'height=700,width=700');
	         win.document.write(style);          //  add the style.
	         win.document.write(card_Report.outerHTML);
	         win.document.close();
	         win.print();
	     }
	 }

	 function run() {
		  var doc = new jsPDF("l",'pt','a3');
		  doc.setFontSize(15);
		    doc.text( '', 10, 15,{
		        align: 'justify'
		    });
		    doc.setFontSize(10);
		  doc.fromHTML($("#card_Report").get(0), 150, 20,{
		    width: 1000,
		    align: 'justify'
		  },function(a) {
		    doc.save("Image.pdf");
		  });
		}

	function dataContentExportExl(memberId, filename = ''){
		    var fourceFileSaveDataUrl;
		    var dataFileType = 'application/vnd.ms-excel';
		    var tableSelect = document.getElementById(memberId);
		    var dataContentSource = tableSelect.innerHTML.replace(/ /g, '%20');
		    
		    // Specify file name
		    filename = filename?filename+'.xls':'export_excel_data.xls';
		    
		    // Create download link element
		    fourceFileSaveDataUrl = document.createElement("a");
		    
		    document.body.appendChild(fourceFileSaveDataUrl);
		    
		    if(navigator.msSaveOrOpenBlob){
		        var blob = new Blob(['\ufeff', dataContentSource], {
		            type: dataFileType
		        });
		        navigator.msSaveOrOpenBlob( blob, filename);
		    }else{
		        // Create a link to the file
		        fourceFileSaveDataUrl.href = 'data:' + dataFileType + ', ' + dataContentSource;
		    
		        // Setting the file name
		        fourceFileSaveDataUrl.download = filename;
		        
		        //triggering the function
		        fourceFileSaveDataUrl.click();
		    }
		}

	
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>



