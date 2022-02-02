
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
<style>
table.a {
	table-layout: auto;
	width: 870px;
}
</style>

<jsp:include page="../common/cssfiles.jsp"></jsp:include>

<jsp:include page="../common/header.jsp"></jsp:include>
<body onafterprint="printP()" id="kt_body"
style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-77.jpeg)"
	class="print-content-only quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed subheader-enabled aside-enabled aside-static page-loading">

	<!--begin::Container-->
	<div class="d-flex flex-row flex-column-fluid container">
		<!--begin::Content Wrapper-->
		<div class="main d-flex flex-column flex-row-fluid">
			<div class="content flex-column-fluid" id="kt_content">
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
													style="font-size: 35px;">SHREE RAJENDRA CLINIC</h1>

												<div class="text-right mt-0" style="font-size: 35px;">

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
												class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Name:
											</h3>
											<h3 class="font-weight-bold" id="patient_name"></h3>
											
										</div>
										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Age:
											</h3>
											<h3 class="font-weight-bold" id="age"></h3>
										</div>
										
										

										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Date:
											</h3>
											<h3 class="font-weight-bold" id="date">5/3/2021</h3>
											
										</div>
									</span>
									

								</div>
								<div  class="col-md-10 offset-1">
									<span
										class="d-flex justify-content-between align-items-baseline">

										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Patient Code:
											</h3>
											<h3 class="font-weight-bold" id="patient_code"></h3>
											
										</div>
										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 ml-25 font-weight-bold text-muted text-uppercase">Gender:
											</h3>
											<h3 class="font-weight-bold" id="gender"></h3>
										</div>
										

										<div class="d-flex justify-content-start ">
											<h3
												class="pl-0 pr-4 mr-7 font-weight-bold text-muted text-uppercase ">Weight:
											</h3>
											<h3 class="font-weight-bold" id="weight"></h3>
											
										</div>
									</span>
									

								</div>

								<!-- <div class="d-flex justify-content-start ">
									<div class="d-flex justify-content-start col-md-7  offset-1" >
										<h4
											class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Patient
											Code:</h4>
										<h4 class="font-weight-bold" id="patient_code"></h4>
										</div>
										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Gender:
											</h3>
											<h3 class="font-weight-bold" id="gender"></h3>
										</div>
										<div class="d-flex justify-content-start">
											<h3
												class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Weight:
											</h3>
											<h3 class="font-weight-bold" id="weight"></h3>
										</div>
										
									
									
								</div> -->
							<div class=" col-md-10  offset-1" style="border: 1px solid black;"></div>
							
							<div class="col-md-10 offset-1">

											<div class=" px-8 mt-3 px-md-0" id="complaint">
											<div class="row">
											<h3 class="ml-3">Complaints:</h3><h3 class="ml-3" id="complaints_desc"></h3>
											</div>
											
											<div class="row">
											<h3 class="ml-3">Diagnosis:</h3><h3 class="ml-3" id="diagnosis_desc"></h3>
											
											
											
											<h3 class="ml-3"></h3>,<h3 class="ml-3" id="other_complaints"></h3>
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
															class="pt-1 pb-9 pl-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 18px; border-bottom: 1px solid black; " >type</th>
														<th
															class="pt-1 pb-9 pl-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 18px; border-bottom: 1px solid black;">Med. Name</th>
														<th
															class="pt-1 pb-9  font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 18px; border-bottom: 1px solid black;">Dose</th>
														<th
															class="pt-1 pb-9  font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 18px; border-bottom: 1px solid black;">Times</th>
														<th
															class="pt-1 pb-9  pr-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 18px; border-bottom: 1px solid black;">Qty</th>
															<th
															class="pt-1 pb-9  pr-0 font-weight-bolder text-muted font-size-lg text-uppercase text-center"
															style="font-size: 18px; border-bottom: 1px solid black;">Remark</th>
													</tr>
												</thead>
												<tbody id="mTbl" style="font-size: 20px; ">

												</tbody>
											</table>
										</div>
									

									</div>
									<!-- <div class="col-md-3  text-right" style="border-left: 1px solid black;">

										<div id="heightWeight">
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="age_name"></p>
												<p class="font-weight-bolder" id="age"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="gender_name"></p>
												<p class="font-weight-bolder" id="gender"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="weight_name"></p>
												<p class="font-weight-bolder" id="weight"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="temp_name"></p>
												<p class="font-weight-bolder" id="temp"></p>
											</div>
										</div>

										<div id="vital">
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="blood_sugar_text"></p>
												<p class="font-weight-bolder"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="blood_sugar_name_f"></p>
												<p class="font-weight-bolder" id="blood_sugar_f"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="blood_sugar_name_p"></p>
												<p class="font-weight-bolder" id="blood_sugar_p"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="blood_sugar_name_r"></p>
												<p class="font-weight-bolder" id="blood_sugar_r"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="blood_pressure_name"></p>
												<p class="font-weight-bolder" id="blood_pressure"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="pulse_name"></p>
												<p class="font-weight-bolder" id="pulse"></p>
											</div>
											<div
												class="d-flex h3 align-items-baseline justify-content-between">
												<p class="w-50 font-weight-bold" id="hb_name"></p>
												<p class="font-weight-bolder" id="hb"></p>
											</div>
										</div>

										<div
											class="d-flex h3 align-items-baseline justify-content-between">
											<h6 class="w-50 font-weight-bolder" id="kco_name"></h6>
											<p class="font-weight-bold" id="kco_value"></p>
										</div>
										<div
											class="d-flex h3 align-items-baseline justify-content-between">
											<h6 class="w-50 font-weight-bolder" id="allergy_name"></h6>
											<p class="font-weight-bold" id="allergy_value"></p>
										</div>

									</div> -->

								
								</div>
								
								<div class="col-md-10 offset-1">

											
											<div class="row">
											<h3 class="ml-3 mr-2 font-weight-bolder" id="temp_name">Temp:</h3><h3 class=" mr-5" id="temp"></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder" id="blood_sugar_text">Suger-</h3><h3 class=" " ></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder"  id="blood_sugar_name_f">Fasting:</h3><h3 class=" mr-5" id="blood_sugar_f"></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder" id="blood_sugar_name_p">Post Meal:</h3><h3 class=" mr-5" id="blood_sugar_p" ></h3>
											<h3 class="ml-3 mr-2 font-weight-bolder" id="blood_pressure_name">BP:</h3><h3 class="ml-3 mr-5" id="blood_pressure"></h3>
											
											
											
											
											</div>
											
											<div class="row">
											<h3 class="ml-3 mr-2 font-weight-bolder" id="pulse_name">Pulse:</h3><h3 class=" mr-5" id="pulse"></h3>
											<h3 class="ml-3 mr-2 font-weight-bolder" id="hb_name">HB:</h3><h3 class=" mr-5" id="hb"></h3>
											
											<h3 class="ml-3 mr-2 font-weight-bolder" id="kco_name">K/C/O:</h3><h3 class=" mr-5" id="kco_value" ></h3>
											<h3 class="ml-3 mr-2 font-weight-bolder" id="allergy_name">Allergy:</h3><h3 class=" mr-5" id="allergy_value" ></h3>
											
											</div>
											</div>
											</br>
								
								
								
								
								
								 <div class="row advice">
        <div class="col-7 ml-10">
        <div class="advice  h3 ml-20 mt-2 col-md-12" id="kco">
										<h6 class="font-weight-bolder" style="font-size: 18px;"
											id="advice_name"></h6>
										<p class="font-weight-bold mt-5" style="font-size: 18px;"
											id="advice"></p>
									</div>
									<div class="col-md-8 ml-2 mt-3 text-center">
										<h4>> फेर तपासणी  - <span class="mr-2 " id="re_visit"></span>दिवसांनी</h4>
									</div>
        </div>
         <div class="col-4 ml-10">
         <div class=" text-center" style="font-size: 25px">
										<label>Thanks</label>
									</div>
									<div class=" text-center ml-2" style="font-size: 25px">
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
								<div class="col-md-12  text-center mt-8">
									<div class="row justify-content-center">
										<h3 class="font-weight-bolder">वेळ :</h3>
										<h3>
											<span id="time">सकाळी ९ ते १.३०</span> <span>सायं. ४
												ते ८ वाजता.</span>
										</h3>
									</div>
									<h3 id="notice">दवाखाना रविवारी सुद्धा चालू राहील</h3>

								</div>


							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	<!--end::Content-->
	</div>
	<!--begin::Content Wrapper-->

	<!--end::Container-->
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';

	 	/*  window.print();  */
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

		$.urlParam = function(name) {
			var results = new RegExp('[\?&]' + name + '=([^&#]*)')
					.exec(window.location.href);
			return results[1] || 0;
		}

		var patient_code = $.urlParam('code');
		var re_visit = $.urlParam('re_visit');

		var print = $.urlParam('print');
		var p = print.split("$");

		if (p[0] != "true") {
			$('#logo').hide();
		}

		if (p[1] != "true") {
			$('#header').hide();
		}

		if (p[2] != "true") {
			$('#vital').hide();
		}

		if (p[3] != "true") {
			$('#heightWeight').hide();
		}

		if (p[4] != "true") {
			$('#complaint').hide();
		}

		if (p[5] != "true") {
			$('#kco').hide();
		}

		if (p[6] != "true") {
			$('#allergy').hide();
		}

		if (p[7] != "true") {

			$('#notice').hide();
		}

		var timeNotice = $.urlParam('timeNotice');
		var tn = timeNotice.split("$");

		$('#complaint').hide();

		$('#re_visit').append(re_visit).val();
		var visit_id;

		$
				.ajax({
					url : base + "/dssAPI/dfapi/getWizardFormData",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						"patient_code" : patient_code,
						"flag" : 1
					},
					success : function(data) {

						console.log(data);

						var row = data[0];
						if (row != null) {
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
																'<tr class="font-weight-boldest  text-danger" style="font-size: 18px;"><td class="pt-7 px-5  text-center" style="border-bottom: 1px solid black;"><div>'
																		+ m.type
																		+ '</div></td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.medicineName
																		+ '</div></td><td class=" pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.dose
																		+ '</td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.time
																		+ '</td><td class=" pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.qty
																		+ '</td><td class=" pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.remark
																		
																		+ '</td></tr>');
											} else {

												$('#mTbl')
														.append(
																'<tr class="font-weight-boldest  text" style="font-size: 18px;"><td class=" pt-7 px-5 text-center" style="border-bottom: 1px solid black;"><div>'
																		+ m.type
																		+ '</div></td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.medicineName
																		+ '</div></td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.dose
																		+ '</td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.time
																		+ '</td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
																		+ m.qty
																		+ '</td><td class="pt-7 text-center" style="border-bottom: 1px solid black;">'
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

								complaints_desc = row.complaints_desc.replace(
										'*', '');

								/* $('#cTbl')
										.append(
												'<tr class="font-weight-bolder h4" style="font-size: 20px;" ><td class="pt-7 px-5">'
														+ complaints_desc
																.replace('*',
																		',')
														+ '</td><td class="pt-7 pl-10" id="isDiagnosis">'
														+ row.diagnosis_desc
														+ '</td></tr><tr class="font-weight-bolder h4" style="font-size: 20px;"><td class="pt-7 px-5">'
														+ row.other_complaints
														+ '</td><td class="pt-7"></td></tr>'); */
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

							if (sugar.f != "" || sugar.p != "") {

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

					}
				});

		if (p[8] != "true") {
			
			$('#diagnosis_name').hide();
			$('#isDiagnosis').hide();
		}

		function printP() {
			var url = "fees-collection.jsp" + '?pcode=' + patient_code
					+ '&vid=' + visit_id;

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