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
<%
String session1 = (String) session.getAttribute("login_id");
if (session.getAttribute("login_id") != null) {
 String sessionName = (String) session.getAttribute("login_id");
} else
 response.sendRedirect("../common/login.jsp");
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

table.a {
	table-layout: auto;
	width: 100%;
}
</style>
</head>
<!--end::Head-->
<!--begin::Body-->
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<!--begin::Main-->
	<!--begin::Header Mobile-->

	<!--end::Header Mobile-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			<jsp:include page="/form/common/navbar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/header.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
				<div class="container d-flex align-items-stretch justify-content-between">
					<div class="col-xl-12 offset-xl-1 ">
						<h2	class="d-flex align-items-center text-dark font-weight-bold my-1 mr-10 ml-4">Income	And Expense Statement</h2>
						<div class="col-xl-10  offset-xl-0 ">
							<div class="example mb-10">
								<div class="example-preview">
									<div class="card card-custom">
										<form class="form" id="kt_form_1">
											<div class="card-body">
												<div class="card card-custom gutter-b ">
													<div class="dropdown dropdown-inline ">
														<button type="button1" class="  btn  font-weight-bolder "
															style="float: right;" value="Create Print" id="Print"
															onclick="MyApp.printTable()">
															<i class="icon-2x flaticon2-printer"
																style="color: #f64e60"></i>
														</button>
														<button type="button " class=" btn font-weight-bolder "
															style="float: right;" value="Create PDF" id="PDF"
															onclick="run()">
															<i class=" icon-2x fas fa-file-pdf "
																style="color: #f64e60"></i>
														</button>
														<button
															onclick="dataContentExportExl('card_Report', 'user-data')"
															class="  btn  font-weight-bolder " style="float: right;"
															value="Create Excel" id="Excel">
															<i class=" icon-2x fas fa-file-excel"
																style="color: #f64e60"></i>
														</button>
													</div>
													<div class="card-body" id="card_Report">
														<font size="+3" style="font: serif"><u><center>	Income and Expenses Statement</center></u></font> <br />
														<div class="  ">
															<font size="+2"><u><center>	Date Range: <span class=" " id="finish"></span> To <span
																			class=" " id="finish1"></span>
																	</center></u></font>
														</div>
														<br />
														<table class="table table-responsive"
															style="border: 1px solid black">
															<thead>
																<tr>
																	<th
																		style="text-align: center; border-bottom: 1px solid black; border: 1px solid black"
																		scope="col">Date</th>
																	<th
																		style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
																		scope="col">Sales Inv. No</th>
																	<th
																		style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
																		scope="col">Inv. Amt</th>
																	<th
																		style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
																		scope="col">Payment Mode</th>
																	<th style="text-align: center; border: 1px solid black"
																		scope="col">Payment Date</th>
																	<th
																		style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
																		scope="col">Pur. Inv. No</th>
																	<th
																		style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
																		scope="col">Inv. Amt</th>
																	<th
																		style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
																		scope="col">Payment Mode</th>
																	<th style="text-align: center; border: 1px solid black"
																		scope="col">Payment Date</th>
																</tr>
															</thead>
															<tbody class="table_body">
															</tbody>
															<tfoot>
															<col>
															<colgroup span="4"></colgroup>
															<colgroup span="4"></colgroup>
															<tr>
																<th colspan="9" scope="colgroup"
																	style="text-align: center; border: 1px solid black;"></th>
															</tr>
															<tr>
																<td rowspan="1"
																	style="text-align: center; border: 1px solid black;"></td>
																<th colspan="4" scope="colgroup"
																	style="text-align: center; border: 1px solid black;">Sales
																	Total =<span class="ml-2" id="sales_total"></span>
																</th>
																<th colspan="4" scope="colgroup"
																	style="text-align: center; border: 1px solid black;">Expense
																	Total = <span class="ml-2" id="expn_total"></span>
																</th>
															</tr>
															<tr>
																<td rowspan="1"
																	style="text-align: center; border: 1px solid black;"></td>
																<th colspan="8" scope="colgroup"
																	style="text-align: center; border: 1px solid black;">Profit/Loss
																	=<span class="ml-2" id="pnl"></span>
																</th>
															</tr>
															</tfoot>
														</table>
													</div>
												</div>
												<!--end::Entry-->
											</div>
										</form>
										<!--end::Wrapper-->
									</div>
									<!--end::Page-->
								</div>
							</div>
						</div>
					</div>
				</div>
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
		<!--end::Scrolltop-->
		<jsp:include page="../common/jsfiles.jsp"></jsp:include>
		<script type="text/javascript"
			src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
		<script type="text/javascript"
			src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>
		<script type="text/javascript">
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
    const  from_date = urlParams.get('from_date');
	const till_date = urlParams.get('till_date');
	    var today = new Date(from_date);
		var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();	
	    $('#finish').text(date);
	    var today = new Date(till_date);
		var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();	
     	 $('#finish1').text(date);
     	var sale_amount = 00;	 
    	var expn_amount = 00;	 
    	var html;
    	$.ajax({
    		url : base + "/dssAPI/dfapi/getProfitAndLossDetails",
    		type : "post",
    		dataType : "json",
    		async : false,
    		data : {
    		    "from_date" : from_date,
    		    "till_date" : till_date
    			},
    		success:function(data)
    	    {
    			const row = data.find(d => d.invoice_id != " ");
    			data.forEach((row)=> {
    			var today = new Date(row.invoice_date);
    			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();	
    	     	html +="<tr id= tr-id-2 class= tr-class-2>"
    	        html += "<td style='border-right:1px solid black; border-left:1px solid black'>"+date+"</td>";
    	     	if(row.patient_code > 0)
    	     		{
    	     		sale_amount += parseInt(row.clinic_fee);
    			html += "<td>"+row.invoice_id+"</td>"; 
    			 var clinic_fee = parseInt(row.clinic_fee);
	             html += "<td>"+clinic_fee.toFixed(2)+"</td>";
    	         html += "<td>"+row.payment_mode+"</td>";
    	         var today = new Date(row.paid_date);
    			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();	
    	         html += "<td style='border-right:1px solid black'>"+date+"</td>";
    	         html += "<td></td>"; 
    	         html += "<td></td>";
    	         html += "<td></td>";
    	         html += "<td style='border-right:1px solid black'></td>";
    	      	 html +="</tr>"
    	     		}
    	     	else {
    	     		expn_amount += parseInt(row.clinic_fee);
    	     		     html += "<td></td>"; 
    			         html += "<td></td>";
    			         html += "<td></td>";
    			         html += "<td style='border-right:1px solid black'></td>";
    	     		     html += "<td>"+row.invoice_id+"</td>"; 
    	     		     var clinic_fee = parseInt(row.clinic_fee);
    		             html += "<td>"+clinic_fee.toFixed(2)+"</td>";
    		             html += "<td>"+row.payment_mode+"</td>";
    		             var today = new Date(row.paid_date);
    					var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();	
    		             html += "<td style='border-right:1px solid black'>"+date+"</td>";
    		      	    html +="</tr>"
    	     	}
    			});
    			 $(".table_body").html(html);
    			 $("#sales_total").text((sale_amount).toFixed(2));
    			 $("#expn_total").text((expn_amount).toFixed(2));
    			 $("#pnl").text((sale_amount + expn_amount).toFixed(2));
    		}
    	});	
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
	             style = style + "table {width: 100%;font: 14px Calibri;}";
	             style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
	             style = style + "padding: 1px 2px;text-align: center;}";
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



