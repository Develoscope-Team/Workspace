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
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/jsfiles.jsp"></jsp:include>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="/form/common/navbar.jsp"></jsp:include>
<body onafterprint="printP()" id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;"
	class="print-content-only quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed subheader-enabled aside-enabled aside-static page-loading">
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">
							<!-- begin::Card-->
							<div class="card card-custom overflow-hidden">
								<div class="card-body p-0">
									<!-- begin: Invoice-->
									<!-- begin: Invoice header-->
									<div class="row py-8 px-9 px-md-0" id="header">
										<div class="col-md-10 offset-1">
											<div class="row text-info">
												<img id="logo" alt="Logo"
													src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/src.png"
													class="logo-default max-h-100px" />
												<div class="col-md-8 text-center">
													<h1 class="font-weight-bolder" style="font-size: 40px;">SHREE
														RAJENDRA CLINIC</h1>
													<div class="text-right">
														<h1>Dr. Rakesh F. Bafna</h1>
														<p style="font-size: 18px">B.H.M.S(Reg No. 27450)</p>
													</div>
													<h3>पोयनाड : भाजी मार्केट गल्ली</h3>
													<h3 class="ml-2 font-weight-bolder">7775999536 |
														9822786831(Whatsapp)</h3>
												</div>
											</div>
											<div class="border-bottom bg-info w-100"></div>
											<div class="border-bottom bg-info w-100"></div>
											<div class="border-bottom bg-info w-100"></div>
										</div>
									</div>
									<div class="col-md-12 mb-10 text-center text-info">
										<h1 class="font-weight-bolder"
											style="font-size: 35px; face: Arial">Invoice Receipt</h1>
									</div>
									<div id="name" class="col-md-10 mb-10 offset-1 ">
										<span class="d-flex justify-content-between align-items-baseline">
											<div class="d-flex justify-content-start" style="font-size: 20px;">
												<h2	class="pl-0 pr-4 font-weight-bold text-info text-uppercase">
												</h2>
												<h2 class="font-weight-bold" id="receipt_no"></h2>
											</div>
										<div class="d-flex justify-content-start" style="font-size: 20px;">
												<h2	class="pl-0 pr-4 ml-10 font-weight-bold text-info text-uppercase">Date:
												</h2>
												<h2 class="font-weight-bold" id="date1">__/__/____</h2>
											</div>
										</span>
									</div>
									<div class="col-md-10 offset-1 <!-- ml-20 mr-20 --> mb-10 "
										style="font-size: 20px;">
										<table class="table">
											<thead>
												<tr>
													<th style="text-align: center; font-size: 15px;"
														scope="col">#</th>
													<th style="text-align: center; font-size: 15px;"
														scope="col">Invoice Id</th>
													<th
														style="text-align: center; font-size: 15px; column-width: 400px;"
														scope="col">Invoice Date</th>
													<th
														style="text-align: center; font-size: 15px; column-width: 400px;"
														scope="col">Last Paid Date</th>
													<th style="text-align: center; font-size: 15px;"
														scope="col">Clinic Fee</th>
													<th style="text-align: center; font-size: 15px;"
														scope="col">Paid</th>
													<th style="text-align: center; font-size: 15px;"
														scope="col">To Be Paid</th>

												</tr>
											</thead>
											<tbody class="table_body ">
											</tbody>
										</table>
										<div class="col-md-11 text-right " style="font-size: 20px">
											<label>Thanks</label>
										</div>
										<div class="col-md-11 text-right" style="font-size: 20px">
											<img id="logo" alt="Logo"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/sign.png"
												class="logo-default max-h-80px" />
										</div>
										<div class="col-md-12 text-right" style="font-size: 20px;">
											<label>Dr.Rakesh Bafna</label>
										</div>
									</div>

								</div>
							</div>
							<!-- end::Card-->
						</div>
						<!--end::Container-->
					</div>
					<!--end::Entry-->
				</div>

			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script>
var basePath='<%=basePath%>';    
var base='<%=base%>';  
  window.print();  
 var date = new Date();
	var today = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
	$('#date1').text(today);
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const noofincoixes = urlParams.get('noofincoixes');
for(var i = 0; i < noofincoixes; i++){
	  var html = '';
	  html += '<tr>'
 
     html += '<td><input type="text" class="form-control sr No d-flex flex-column-fluid" id="id-' + i +'" name="id" style="background-color:#FFFFFF; border:0px; width: 80px; font-size: 18px; text-align:center"></td>';
 	 html += ' <td><input type="text" class="form-control Invoice Id d-flex flex-column-fluid" id="invoiceId-' + i +'" name="invoiceId" style="background-color:#FFFFFF; border:0px; width: 80px; font-size: 18px; text-align:center" disabled></td>';
	 html += ' <td><input type="text" class="form-control Invoice Date" id="invoiceDate-' + i +'" name="invoiceDate"  style="background-color:#FFFFFF; border:0px; font-size: 18px; " disabled></td>';
	 html += ' <td><input type="text" class="form-control Last Paid Date" id="lastPaidDate-' + i +'" name="lastPaidDate"  style="background-color:#FFFFFF; border:0px; font-size: 18px; " disabled></td>';
	 html += ' <td><input type="text" class="form-control Clinic Fee d-flex flex-column-fluid" id="clinicFee-' + i +'" name="clinicFee" style="background-color:#FFFFFF; border:0px; font-size: 18px; text-align:center" disabled></td>';
	 html += ' <td><input type="text" class="form-control Paid d-flex flex-column-fluid" id="paid-' + i +'" name="paid" style="background-color:#FFFFFF; border:0px; font-size: 18px; text-align:center" disabled></td>';
	 html += ' <td><input type="text" class="form-control To Be Paid d-flex flex-column-fluid" id="toBePaid-' + i +'" name="toBePaid" style="background-color:#FFFFFF; border:0px; font-size: 18px; text-align:center" disabled></td>';
	 html += '</tr>';
	  $('.table_body').append(html);
} 
var print = urlParams.get('patient_name');
var p = print.split(",");
for(var i = 0 ; i < noofincoixes ; i++)
{
if (p[i] != "") {
	var a = p[i];
	$.ajax({
		url : base + "/dssAPI/dfapi/getPaymentDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"invoice_id": a},
		success:function(data)
 	{
			const row = data.find(d => d.invoice_id == a);
			data.forEach((row)=> {
				if(a == row.invoice_id )
				{								 
					   $('#id-' + i).val(i+1);
					    $('#invoiceId-' + i).val(row.invoice_id);
						$('#invoiceDate-' + i).val(row.payment_date);
						$('#clinicFee-' + i).val(row.invoice_total);
						$('#paid-' + i).val(row.paid_amount);
						$('#toBePaid-' + i).val(row.balance_amount);
				}
			});
 	}
	});	
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getInvoiceDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"invoice_id": a},
		success:function(data)
 	{
			const row = data.find(d => d.invoice_id == a);
			data.forEach((row)=> {
				if(a == row.invoice_id )
				{								 
						$('#lastPaidDate-' + i).val(row.paid_date);
				}
			});
 	}
	});	
}
}

function printP()
{
	var url = "form-wizard.jsp";

	window.location.assign(url);
	}

</script>

</body>
</html>
<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>