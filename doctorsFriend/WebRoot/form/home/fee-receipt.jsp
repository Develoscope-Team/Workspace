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

<jsp:include page="../common/header.jsp"></jsp:include>

<style type="text/css" media="print">
@page {
	size: A4 landscape;
}
</style>

<body onafterprint="printP()" id="kt_body"
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
													src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/gif/src.png"
													class="logo-default max-h-100px"  />

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
										<h1 class="font-weight-bolder" style="font-size: 35px;">Fee
											Receipt</h1>
									</div>

									<div id="name" class="col-md-9 mb-20 offset-1 ">
										<span
											class="d-flex justify-content-between align-items-baseline">

											<div class="d-flex justify-content-start"
												style="font-size: 20px;">
												<h2
													class="pl-0 pr-4 font-weight-bold text-info text-uppercase">Receipt
													No:</h2>
												<h2 class="font-weight-bold" id="receipt_no"></h2>
											</div>

											<div class="d-flex justify-content-start"
												style="font-size: 20px;">
												<h2
													class="pl-0 pr-4 font-weight-bold text-info text-uppercase">Date:
												</h2>
												<h2 class="font-weight-bold" id="date1">__/__/____</h2>
											</div>
										</span>

									</div>
									<div class="row py-9 px-8 id=body">

										<div class="col-md-10 ml-20 mr-20 mb-40 "
											style="font-size: 20px;">

											<p class="">
												Received amount of <span
													class="amount font-weight:500 font-decoration:underline mr-3">
													... </span>Rs. from Mr/Mrs <span
													class="received_by font-weight:500 font-decoration:underline">
													... </span> for the Consultation fees against-invoice no: <span
													class="invoice_no font-weight:500 font-decoration:underline">
													__________________ </span> Invoice Amount: <span
													class="invoice_amt font-weight:500 font-decoration:underline">
													__________________ </span> rs. Payment mode:<span
													class="payment_mode font-weight:500 font-decoration:underline">
													__________________ </span> Balance Amount: <span
													class="balance_amt font-weight:500 font-decoration:underline">
													__________________ </span> rs. & other charges___________.

											</p>

											<div class="col-md-10 text-right" style="font-size: 20px">
												<label>Thanks</label>
											</div>
											<div class="col-md-10 text-right" style="font-size: 20px">
												<img id="logo" alt="Logo"
													src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/gif/sign.png"
													class="logo-default max-h-80px" />
											</div>
											<div class="col-md-11 text-right" style="font-size: 20px;">
												<label>Dr.Rakesh Bafna</label>
											</div>
										</div>

									</div>

									<!-- end: Invoice action-->
									<!-- end: Invoice-->
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

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const patient_code = urlParams.get('patient_code');
const vid = urlParams.get('vid');

$.ajax({
	url : base + "/dssAPI/dfapi/getPaymentDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {
		"visit_id": vid
		},
	success:function(data)
    {
		
		 const row = data.find(d => d.visit_id ==vid); 
		 
		
		 $('#receipt_no').text(row.receipt_no);
		 $('#date1').text(row.payment_date);
		 $('.amount').text(row.paid_amount);
		 $('.invoice_no').text(row.invoice_id);
		 $('.payment_mode').text(row.payment_mode);
		 $('.invoice_amt').text(row.invoice_total);
		 $('.balance_amt').text(row.balance_amount);
    }
    
});	
$.ajax({
	url : base + "/dssAPI/dfapi/getPatientDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {
		"patient_code": patient_code
		},
	success:function(data)
    {
		 const row = data.find(d => d.patient_code ==patient_code); 
		
		$('.received_by').text(row.patient_name);
		
    }
    
});	

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