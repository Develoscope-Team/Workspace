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
	<jsp:include page="/form/common/header.jsp"></jsp:include>
				
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
				
				
				<!--end::Header-->


				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
<div
							class="container d-flex align-items-stretch justify-content-between"">
							<div class="col-xl-12 offset-xl-0 ">
									<div class="col-xl-12 offset-xl-0 ">
										<div class="example mb-10">
											<div class="example-preview">

						<div class="card card-custom">
					<div class="card-body p-0">
						<!--begin::Invoice-->
						<div class="row justify-content-center pt-3 px-3 pt-md-5 px-md-0">
							<div class="col-md-12">
								<!-- begin: Invoice header-->
								<div class="row py-4 px-4 px-md-0" id="header">
									<div class="col-md-10 offset-1">
										<!-- <div class="row " style="color:#132072"> -->
										<div class="row text-info">
											<img id="logo" alt="Logo"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/src.png"
												class="logo-default max-h-120px" />
											<div class="col-md-7 text-center">

												<h1 class="font-weight-bolder text-right"
													style="font-size: 38px;">SHREE RAJENDRA CLINIC</h1>

												<div class="text-right mt-0" style="font-size: 38px;">

													<h2>Dr. Rakesh F. Bafna</h2>
													<h3>B.H.M.S(Reg No. 27450)</h3>

												</div>
												<h4>पोयनाड : भाजी मार्केट गल्ली</h4>
												<h4 class="ml-2 font-weight-bolder">7775999536 |
													9822786831(Whatsapp)</h4>
											</div>
										</div>

										<!-- <div class="border-bottom bg-info " style="border: 1px solid black;"></div> -->
										<div class=" col-md-12" style="border: 1px solid black;"></div>
										

									</div>
								</div>
								<div id="name" class="col-md-10 offset-1">
									<span
										class="d-flex justify-content-between align-items-baseline">

										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bolder text-muted text-uppercase">Name:
											</h3>
											<h3 class="font-weight-bolder" id="patient_name"></h3>
											
										</div>
										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bolder text-muted text-uppercase" id="age_name">Age:
											</h3>
											<h3 class="font-weight-bolder" id="age"></h3>
										</div>
										
										

										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bolder text-muted text-uppercase">Date:
											</h3>
											<h3 class="font-weight-bolder" id="date">5/3/2021</h3>
											
										</div>
									</span>
									

								</div>
								<div  class="col-md-10 offset-1">
									<span
										class="d-flex justify-content-between align-items-baseline">

										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bolder text-muted text-uppercase">Patient Code:
											</h3>
											<h3 class="font-weight-bolderer" id="patient_code"></h3>
											
										</div>
										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 ml-25 font-weight-bolder text-muted text-uppercase" id="gender_name">Gender:
											</h3>
											<h3 class="font-weight-bolder" id="gender"></h3>
										</div>
										

										<div class="d-flex justify-content-start ">
											<h3
												class="pl-0 pr-4 mr-7 font-weight-bolder text-muted text-uppercase " id="weight_name">Weight:
											</h3>
											<h3 class="font-weight-bolder" id="weight"></h3>
											
										</div>
									</span>
									

								</div>

								
							<div class=" col-md-10  offset-1" style="border: 1px solid black;"></div>
							
							<div class="col-md-10 offset-1">

											<div class=" px-8 mt-3 px-md-0" id="complaint">
											<div class="row">
											<h3 class="ml-3 font-weight-bold">Complaints:</h3><h3 class="ml-3" id="complaints_desc"></h3>
											</div>
											
											<div class="row">
											<h3 class="ml-3 font-weight-bold">Diagnosis:</h3><h3 class="ml-3" id="diagnosis_desc"></h3>
											
											
											
											<h3 class="ml-3 font-weight-bold"></h3>,<h3 class="ml-3" id="other_complaints"></h3>
											</div>
											
												
											</div>
											</div>
							
							<br />
							<div class=" col-md-10  offset-1" style="border: 1px solid black;"></div>
							<br />
							
							
								<div class="row  pb-10   offset-1 " > 
									<div class="col-md-11 ">
										<div class="table-responsive">
											<table class="table ">
												<thead>
													<tr >
														<th
															class="pt-0 pb-5 pl-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 20px; border-bottom: 1px solid black; " >type</th>
														<th
															class="pt-0 pb-5 pl-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 20px; border-bottom: 1px solid black;">Med. Name</th>
														<th
															class="pt-0 pb-5  font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 20px; border-bottom: 1px solid black;">Dose</th>
														<th
															class="pt-0 pb-5  font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 20px; border-bottom: 1px solid black;">Times</th>
														<th
															class="pt-0 pb-5  pr-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 20px; border-bottom: 1px solid black;">Qty</th>
															<th
															class="pt-0 pb-5  pr-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 20px; border-bottom: 1px solid black;">Remark</th>
													</tr>
												</thead>
												<tbody id="mTbl" style="font-size: 20px; ">

												</tbody>
											</table>
										</div>
									

									</div>
									

								
								</div>
								
								<div class="col-md-10 offset-1">

											
											<div class="row">
											<h3 class="ml-3 mr-2 font-weight-bolder" id="temp_name"></h3><h3 class=" mr-5" id="temp"></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder"  id="blood_sugar_text"></h3><h3 class=" " ></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder" id="blood_sugar_name_f"></h3><h3 class=" mr-5" id="blood_sugar_f"></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder" id="blood_sugar_name_p"></h3><h3 class=" mr-5" id="blood_sugar_p" ></h3>
											<h3 class="ml-3 mr-2 font-weight-bolder"  id="blood_pressure_name"></h3><h3 class="ml-3 mr-5" id="blood_pressure"></h3>
											
											
											
											
											</div>
											
											<div class="row">
											<h3 class="ml-3 mr-2 font-weight-bolder" id="pulse_name"></h3><h3 class=" mr-5" id="pulse"></h3>
											<h3 class="ml-3 mr-2 font-weight-bolder"  id="hb_name"></h3><h3 class=" mr-5" id="hb"></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder" id="kco_name"></h3><h3 class=" mr-5" id="kco_value" ></h3>
											<h3 class="ml-3 mr-2 font-weight-bolder" id="allergy_name"></h3><h3 class=" mr-5" id="allergy_value" ></h3>
											
											</div>
											</div>
											</br>
								
								 <div class="row advice">
        <div class="col-7 ml-10">
        <div class="advice  h3 ml-20 mt-2 col-md-12" id="kco">
										<h6 class="font-weight-bolder" style="font-size: 20px;"
											id="advice_name"></h6>
										<h6 class="font-weight-bold mt-5" style="font-size: 20px;"
											id="advice"></h6>
									</div>
									<div class="col-md-8 ml-2 mt-3 text-center font-weight-bold " style="font-size: 20px;">
										<p>> फेर तपासणी   - <span class="mr-2 " id="re_visit"></span>दिवसांनी</p>
									</div>
        </div>
         <div class="col-4 ml-10">
         <div class=" text-center" style="font-size: 27px">
										<label>Thanks</label>
									</div>
									<div class=" text-center ml-2" style="font-size: 27px">
										<img id="logo" alt="Logo"
											src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/sign.png"
											class="logo-default max-h-80px" />
									</div>
									<div class=" text-center" style="font-size: 25px;">
										<label>Dr.Rakesh Bafna</label>
									</div>
        </div>
        </div>
							</div>
							<div class="col-md-10 " style="border-top: 1px solid black;">

							<!--end: Invoice body-->

							<div class="row footer1">
								<div class="col-md-12  text-center mt-3  style="font-size: 26px;"">
									<div class="row justify-content-center  ">
										<h2 class="font-weight-bold ">वेळ :</h2>
										<h2>
											<span id="time">सकाळी ९ ते १.३०</span> <span>सायं. ४
												ते ८ वाजता.</span>	
										</h2>
										</div>
									
									<div class="  ">
											<h2   id="notice">दवाखाना रविवारी सुद्धा चालू राहील</h2>
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

						<!--end::Container-->
					</div>
				</div>
				</div>
				</div>
				</div>
				</div>
				</div>
				<!--end::Entry-->

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
	
	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';

	 	  window.print(); 
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();

		today = yyyy + '-' + mm + '-' + dd;

		$.ajax({
			url : base + "/dssAPI/dfapi/getNoticeDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {

				console.log(data);
				var row = data[0];

				if (row.till_date >= today) {

					$('#notice').text(row.notice_desc);

				}

			}
		});

 
 const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const patient_code = urlParams.get('patient_code');
	const re_visit = urlParams.get('visitId');
	const prescription_id = urlParams.get('prescription_id');
	const patient_name = urlParams.get('patient_name');
	const re_visit_days = urlParams.get('re_visit_days');
	

		$('#re_visit').append(re_visit_days).val();
		var visit_id;

		var visit_id;

		$
				.ajax({
					url : base + "/dssAPI/dfapi/getWizardData",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						"patient_code" : patient_code
											},
					success : function(data) {
						
					 const row = data.find(d => d.patient_code == patient_code);
						data.forEach((row)=> {
							
					
						if (row.visit_id == re_visit)
							{ 
								
							$('#patient_name').text(row.patient_name);
							$('#patient_code').text(row.patient_code);

							let date = new Date(row.date);
							$('#date').text(
									date.getDate() + "-"
											+ (date.getMonth() + 1) + "-"
											+ date.getFullYear());

							const parsedData = JSON
									.parse(row.prescription_desc);

							parsedData
									.forEach(function(m, i) {

										if (m.isPrintable == 'Y') {
											if (m.is_special == 'Y') {

												$('#mTbl')
												.append(
														'<tr class="font-weight-boldest  text-danger" style="font-size: 18px;"><td class="pt-7 px-5 " style="border-bottom: 1px solid black;"><div>'
																+ m.type
																+ '</div></td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.medicineName
																+ '</div></td><td class=" pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.dose
																+ '</td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.time
																+ '</td><td class=" pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.qty
																+ '</td><td class=" pt-7 text-center" colspan="6" style="border-bottom: 1px solid black;">'
																+ m.remark
																+ '</td></tr>');
									} else {

										$('#mTbl')
												.append(
														'<tr class="font-weight-boldest  text" style="font-size: 18px;"><td class=" pt-7 px-5" style="border-bottom: 1px solid black;"><div>'
																+ m.type
																+ '</div></td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.medicineName
																+ '</div></td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.dose
																+ '</td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.time
																+ '</td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																+ m.qty
																+ '</td><td class=" pt-7 text-center" colspan="6" style="border-bottom: 1px solid black;">'
																+ m.remark
																+ '</td></tr>');
									}
								} else {

								}


									});

							if (row.complaints_desc != ''
									|| row.other_complaints != ''
									|| row.diagnosis_desc != '') {

								$('#complaint').show();
                             
								$('#complaints_desc').append(row.complaints_desc);
								$('#diagnosis_desc').append(row.diagnosis_desc);
								$('#other_complaints').append(row.other_complaints);

								///other_details		
								complaints_desc = row.complaints_desc.replace(
										'*', '');

							
							}

							if (row.age != '') {
								$('#age_name').text('Age :');
								$('#age').text(row.age);
							}

							if (row.gender != '' && row.gender != 'null') {
								$('#gender_name').text('Gender :');
								$('#gender').text(
										row.gender.charAt(0).toUpperCase()
												+ row.gender.slice(1));
							}

							if (row.weight != '') {
								$('#weight_name').text('Weight :');
								$('#weight').text(row.weight + "kg.");
							}

							if (row.temperature != '') {
								$('#temp_name').text('Temp :');
								$('#temp').text(row.temperature + "°F.");
							}

							if (row.special_advise != "") {
								$('#advice_name').text('Advice :');
								var advice = row.special_advise.replaceAll('*',
										'*');
								$('#advice').text(advice);
							}
							if (row.kco != "") {
								$('#kco_name').text('K/C/O :');
								$('#kco_value').text(row.kco);
							}

							if (row.allergy != "") {
								$('#allergy_name').text('Allergy :');
								$('#allergy_value').text(row.allergy);
							}

							if (row.notice != "") {
								$('#notice_name').text('Notice :');
								$('#notice_value').text(row.notice);
							}

							const sugar = JSON.parse(row.sugar);

							if (sugar.f != "" && sugar.p != "") {

								$('#blood_sugar_text').text("Sugar -");

								$('#blood_sugar_name_f').text("Fasting :");
								$('#blood_sugar_f').text(sugar.f + "mg/dL.");

								$('#blood_sugar_name_p').text("Post Meal :");
								$('#blood_sugar_p').text(sugar.p + "mg/dL.");

							} else if (sugar.r != "") {

								$('#blood_sugar_text').text("Sugar -");
								$('#blood_sugar_name_r').text("Random :");
								$('#blood_sugar_r').text(sugar.r + "mg/dL.");

							}

							const blood_pressure = JSON
									.parse(row.blood_pressure);

							if (blood_pressure.s != ''
									|| blood_pressure.d != '') {
								$('#blood_pressure_name').text('BP :');
								$('#blood_pressure').text(
										blood_pressure.s + '/'
												+ blood_pressure.d + "mmHg.");
							}

							if (row.hb != '') {
								$('#hb_name').text('HB :');
								$('#hb').text(row.hb + " gm/dL.");
							}

							if (row.pulse != '') {
								$('#pulse_name').text('Pulse :');
								$('#pulse').text(row.pulse + "b/min.");
							}

							visit_id = row.visit_id;
						}
					 }) 
					}
				});

		
		function printP() {
			var url = "index.jsp" ;

			window.location.assign(url);
		}  
	</script>

	<script type="text/JavaScript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.print/1.6.0/jQuery.print.js"></script>

</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>