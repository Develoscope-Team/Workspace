<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "BAFNA";
	try {
%>


<jsp:include page="../common/header.jsp"></jsp:include>


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
													src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/src.png"
													class="logo-default max-h-100px" />


												<div class="col-md-8 text-center">
													<h1 class="font-weight-bolder" style="font-size: 42px;">SHREE
														RAJENDRA CLINIC</h1>

													<div class="text-right">

														<h1>Dr. Rakesh F. Bafna</h1>
														<p style="font-size: 20px">B.H.M.S(Reg No. 27450)</p>

													</div>

													<h3>पोयनाड : भाजी मार्केट गल्ली</h3>
													<h3 class="ml-2 font-weight-bolder">7775999536 |
														9822786831(Whatsapp)</h3>
												</div>

											</div>

											<div class="border-bottom bg-info w-100"></div>
											<div class="border-bottom bg-info w-100"></div>
											<div class="border-bottom bg-info w-100"></div>

										
                                  <div class="cert_header text-center" style="margin-top:20px">

										<h1 style="font-size:34px"id="cert_name"></h1>
											
										    
									</div>
									
									<div  id="fit">

										<div class="content font-size-h3">

											<p style="font-size:30px" class="">
												This is to certify that <span style="font-weight:bold" class="setPatient_name"> 
													 </span> age <span style="font-weight:bold" class="setAge"> </span>
												residence <span style="font-weight:bold" class="setResidence">  </span>
												was under my treatment as an OPD patient from Date <span class="setDate"> </span>.
											</p>
											<p style="font-size:30px" class="my-5">
												He / She was suffering from <span class="setComplaint"> </span>
												and was advised to take rest.
											</p>
											<p style="font-size:30px" id="setExtra_content1"></p>
											<p style="font-size:30px" class="">
												Now he is fit to resume normal work from Date <span
													class="setRest_date">  </span>.
											</p>
											

										</div>

									</div>
									<div id="unfit">


										<div class="content font-size-h3">

											<p style="font-size:30px" class="">
												This is to certify that <span style="font-weight:bold" class="setPatient_name">  
													  </span> age <span style="font-weight:bold" class="setAge">  </span>
												residence <span style="font-weight:bold" class="setResidence">  </span>
												is under my treatment as an OPD patient from Date <span style="font-weight:bold" class="setDate">  </span>.
											</p>
											<p style="font-size:30px" class="my-5">
												He / She is suffering from <span  class="setComplaint">  </span>
												and is advised to take rest.
											</p>
											<p style="font-size:30px" id="setExtra_content2"></p>
											
											<p  style="font-size:30px" class="">
												He/She is advised to take rest for <span style="font-weight:bold" class="setRest_days">  </span>
												days or till recovery.
											</p>
                                             
										</div>

									</div>
									
									<div id="ref_letter">

										<div class="content font-size-h3">
                                            <div class="d-flex justify-content-start mt-10" style="font-size: 45px;">
												<h1
													class="pl-0 pr-4 font-weight-bold text-info text-uppercase">Date:
												</h1>
												<h1 class="font-weight-bold" id="date1"></h1>
											</div>
											<h4 style="font-size:30px">Respected Sir / Madam,</h4>

											<h4 style="font-size:30px">
												Dr. <span id="setRef_dr">  </span>.
											</h4>

											</br>

											<p style="font-size:30px" class="">
												Referring here with <span style="font-weight:bold" class="setPatient_name">  </span>
												 complaining of <span style="font-weight:bold"
													class="setComplaint">  </span>, for
												your kind consultation, management and investigation.
											</p>
											<p style="font-size:30px" id="setExtra_content"></p>
											<p style="font-size:30px" class="mt-5">Please examine the patient and do the needful.</p>

										</div>

									</div>
									<div class="cert_footer text-right">

										<div class="col-md-10   mr-20 text-right"  style=" font-size:30px; ">
								            <label>Thanks</label>			
									</div>
									<div class="col-md-10  mr-20 text-right  "  style=" font-size:20px">
                            <img id="logo" alt="Logo" src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/sign.png" 
                                     class="logo-default max-h-80px" />	
								</div>
                                    <div class="col-md-11   text-right  " style=" font-size:30px;">	
									           <label>Dr.Rakesh Bafna</label>
									</div>


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
function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

var cert_code = getParameterByName('cert_code');
var patient_code = getParameterByName('patient_code');
var age = getParameterByName('age');
var date = getParameterByName('date');
var residence = getParameterByName('residence');
var rest_days = getParameterByName('rest_days');
var rest_date = getParameterByName('rest_date');
var ref_dr = getParameterByName('ref_dr');
var extra_content = getParameterByName('extra_content');
var complaint_name = getParameterByName('complaint_name');
var extra_content1 = getParameterByName('extra_content1');


$('#date1').append(date).val;
$('#cert_name').append(cert_code).val;
$('.setPatient_name').append(patient_code).val;
$('.setAge').append(age).val;
$('.setDate').append(date).val;
$('.setResidence').append(residence).val;
$('.setRest_days').append(rest_days).val;
$('.setRest_date').append(rest_date).val;
$('#setRef_dr').append(ref_dr).val;
$('.setComplaint').append(complaint_name).val;
$('#setExtra_content').append(extra_content).val;
$('#setExtra_content1').append(extra_content1).val;
$('#setExtra_content2').append(extra_content1).val;

if(cert_code == 'fit'){
	$('#cert_name').text(' Certificate')
	$('#unfit').hide();
	$('#ref_letter').hide();
	$('#rest_days').hide();
	$('#rest_date').show();
	$('.rest_label').text("Resume Date");
	$('#fit').show();
	$('#not_in_ref').show();
	$('#in_ref').hide();
	$('#in_ref1').show();
	$('#setExtra_content1').show();
	
	
}
if(cert_code == 'unfit'){
	$('#cert_name').text(' Certificate')
	$('#fit').hide();
	
	$('#rest_date').hide();
	$('#rest_days').show();
	$('.rest_label').text("Rest Days");
	$('#unfit').show();
	$('#not_in_ref').show();
	$('#in_ref').hide();
	$('#in_ref1').show();
	$('#setExtra_content2').show();
	$('#ref_letter').hide();
}

if(cert_code == 'ref_letter'){
	$('#cert_name').text('Reference Letter')
	$('#fit').hide();
	$('#unfit').hide();
	$('#not_in_ref').hide();
	$('#in_ref').show();
	$('#ref_letter').show();
	$('#ref').hide();
	$('#ref_letter').show();
	$('#setExtra_content').show();
}
function printP() {
	var url = "index.jsp";

	window.location.assign(url);
}


window.print();
</script>



</body>
</html>






<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>