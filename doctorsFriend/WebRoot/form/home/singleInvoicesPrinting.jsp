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
<body onafterprint="printP()" id="kt_body"
style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-77.jpeg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<!--begin::Main-->
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
										<span
											class="d-flex justify-content-between align-items-baseline">
											<div class="d-flex justify-content-start" style="font-size: 20px;">
												<h2	class="pl-0 pr-4 font-weight-bold text-info text-uppercase">Invoice	No:</h2>
												<h2 class="font-weight-bold" id="receipt_no"></h2>
											</div>
											<div class="d-flex justify-content-start" style="font-size: 20px;">
												<h2
													class="pl-0 pr-4 ml-10 font-weight-bold text-info text-uppercase">Invoice
													Date:</h2>
												<h2 class="font-weight-bold" id="date1">__/__/____</h2>
											</div>
										</span>
									</div>
									<div class="row py-9 px-8 id=body">
										<div class="col-md-10 offset-1 ml-20 mr-20 mb-40 "
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
											<div class="col-md-11 text-right" style="font-size: 20px">
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
				<!--end::Content-->
				<!--begin::Footer-->
				<jsp:include page="../common/footer.jsp"></jsp:include>
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
	<script>
var basePath='<%=basePath%>';    
var base='<%=base%>';  
 window.print(); 
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const patient_name = urlParams.get('patient_name');
const invoice_id = urlParams.get('invoice_id');
const clinicFee = urlParams.get('clinicFee');
const paid = urlParams.get('paid');
const toBePaid = urlParams.get('toBePaid');
const invoiceDate = urlParams.get('invoiceDate');
const visit_id = urlParams.get('visit_id');

$('#receipt_no').text(invoice_id);
$('#date1').text(invoiceDate);
$('.amount').text(paid);
$('.received_by').text(patient_name);
$('.invoice_no').text(invoice_id);
$('.invoice_amt').text(clinicFee);
$('.balance_amt').text(toBePaid);
 $.ajax({
	url : base + "/dssAPI/dfapi/getPaymentDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {
		"visit_id": visit_id
		},
	success:function(data)
    {
		 const row = data.find(d => d.visit_id == visit_id); 
			$('.payment_mode').text(row.payment_mode);
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