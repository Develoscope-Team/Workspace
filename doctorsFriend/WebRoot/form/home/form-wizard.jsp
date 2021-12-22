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
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/css/pages/wizard/wizard-2.css"
	rel="stylesheet" type="text/css" />
<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			<jsp:include page="/form/common/sidebar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/navbar.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">
							<div class="card card-custom">
								<div class="card-body p-0">
									<!--begin: Wizard-->
									<div class="wizard wizard-2" id="kt_wizard"
										data-wizard-state="step-first" data-wizard-clickable="true">
										<!--begin: Wizard Nav-->
										<div
											class="wizard-nav border-right py-8 px-8 py-lg-20 px-lg-10"
											style="flex: 0">
											<!--begin::Wizard Step 1 Nav-->
											<div class="wizard-steps">
												<div class="wizard-step" data-wizard-type="step"
													data-wizard-state="current">
													<div class="wizard-wrapper">
														<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/User.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24" />
																			<path
																		d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
																		fill="#000000" fill-rule="nonzero" opacity="0.3" />
																			<path
																		d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
																		fill="#000000" fill-rule="nonzero" />
																		</g>
																	</svg> <!--end::Svg Icon-->
															</span>
														</div>
														<div class="wizard-label">
															<h3 class="wizard-title">Patient Details</h3>
														</div>
													</div>
												</div>
												<div class="wizard-step" data-wizard-type="step">
													<div class="wizard-wrapper">
														<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/Thunder-move.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24" />
																			<path
																		d="M16.3740377,19.9389434 L22.2226499,11.1660251 C22.4524142,10.8213786 22.3592838,10.3557266 22.0146373,10.1259623 C21.8914367,10.0438285 21.7466809,10 21.5986122,10 L17,10 L17,4.47708173 C17,4.06286817 16.6642136,3.72708173 16.25,3.72708173 C15.9992351,3.72708173 15.7650616,3.85240758 15.6259623,4.06105658 L9.7773501,12.8339749 C9.54758575,13.1786214 9.64071616,13.6442734 9.98536267,13.8740377 C10.1085633,13.9561715 10.2533191,14 10.4013878,14 L15,14 L15,19.5229183 C15,19.9371318 15.3357864,20.2729183 15.75,20.2729183 C16.0007649,20.2729183 16.2349384,20.1475924 16.3740377,19.9389434 Z"
																		fill="#000000" />
																			<path
																		d="M4.5,5 L9.5,5 C10.3284271,5 11,5.67157288 11,6.5 C11,7.32842712 10.3284271,8 9.5,8 L4.5,8 C3.67157288,8 3,7.32842712 3,6.5 C3,5.67157288 3.67157288,5 4.5,5 Z M4.5,17 L9.5,17 C10.3284271,17 11,17.6715729 11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L4.5,20 C3.67157288,20 3,19.3284271 3,18.5 C3,17.6715729 3.67157288,17 4.5,17 Z M2.5,11 L6.5,11 C7.32842712,11 8,11.6715729 8,12.5 C8,13.3284271 7.32842712,14 6.5,14 L2.5,14 C1.67157288,14 1,13.3284271 1,12.5 C1,11.6715729 1.67157288,11 2.5,11 Z"
																		fill="#000000" opacity="0.3" />
																		</g>
																	</svg> <!--end::Svg Icon-->
															</span>
														</div>
														<div class="wizard-label">
															<h3 class="wizard-title">Vital Details</h3>
														</div>
													</div>
												</div>
												<div class="wizard-step" data-wizard-type="step">
													<div class="wizard-wrapper">
														<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:assets/media/svg/icons/Map/Position.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24" />
																			<path
																		d="M19,11 L21,11 C21.5522847,11 22,11.4477153 22,12 C22,12.5522847 21.5522847,13 21,13 L19,13 C18.4477153,13 18,12.5522847 18,12 C18,11.4477153 18.4477153,11 19,11 Z M3,11 L5,11 C5.55228475,11 6,11.4477153 6,12 C6,12.5522847 5.55228475,13 5,13 L3,13 C2.44771525,13 2,12.5522847 2,12 C2,11.4477153 2.44771525,11 3,11 Z M12,2 C12.5522847,2 13,2.44771525 13,3 L13,5 C13,5.55228475 12.5522847,6 12,6 C11.4477153,6 11,5.55228475 11,5 L11,3 C11,2.44771525 11.4477153,2 12,2 Z M12,18 C12.5522847,18 13,18.4477153 13,19 L13,21 C13,21.5522847 12.5522847,22 12,22 C11.4477153,22 11,21.5522847 11,21 L11,19 C11,18.4477153 11.4477153,18 12,18 Z"
																		fill="#000000" fill-rule="nonzero" opacity="0.3" />
																			<circle fill="#000000" opacity="0.3" cx="12" cy="12"
																		r="2" />
																			<path
																		d="M12,17 C14.7614237,17 17,14.7614237 17,12 C17,9.23857625 14.7614237,7 12,7 C9.23857625,7 7,9.23857625 7,12 C7,14.7614237 9.23857625,17 12,17 Z M12,19 C8.13400675,19 5,15.8659932 5,12 C5,8.13400675 8.13400675,5 12,5 C15.8659932,5 19,8.13400675 19,12 C19,15.8659932 15.8659932,19 12,19 Z"
																		fill="#000000" fill-rule="nonzero" />
																		</g>
																	</svg> <!--end::Svg Icon-->
															</span>
														</div>
														<div class="wizard-label">
															<h3 class="wizard-title">Complaints</h3>
														</div>
													</div>
												</div>
												<div class="wizard-step" data-wizard-type="step">
													<div class="wizard-wrapper">
														<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:assets/media/svg/icons/Shopping/Credit-card.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24" />
																			<rect fill="#000000" opacity="0.3" x="2" y="5"
																		width="20" height="14" rx="2" />
																			<rect fill="#000000" x="2" y="8" width="20"
																		height="3" />
																			<rect fill="#000000" opacity="0.3" x="16" y="14"
																		width="4" height="2" rx="1" />
																		</g>
																	</svg> <!--end::Svg Icon-->
															</span>
														</div>
														<div class="wizard-label">
															<h3 class="wizard-title">Prescription</h3>
														</div>
													</div>
												</div>
												<div class="wizard-step" data-wizard-type="step">
													<div class="wizard-wrapper">
														<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\themes\metronic\theme\html\demo5\dist/../src/media/svg/icons\Devices\Printer.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
    																<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
        																<rect x="0" y="0" width="24" height="24" />
        																	<path
																		d="M16,17 L16,21 C16,21.5522847 15.5522847,22 15,22 L9,22 C8.44771525,22 8,21.5522847 8,21 L8,17 L5,17 C3.8954305,17 3,16.1045695 3,15 L3,8 C3,6.8954305 3.8954305,6 5,6 L19,6 C20.1045695,6 21,6.8954305 21,8 L21,15 C21,16.1045695 20.1045695,17 19,17 L16,17 Z M17.5,11 C18.3284271,11 19,10.3284271 19,9.5 C19,8.67157288 18.3284271,8 17.5,8 C16.6715729,8 16,8.67157288 16,9.5 C16,10.3284271 16.6715729,11 17.5,11 Z M10,14 L10,20 L14,20 L14,14 L10,14 Z"
																		fill="#000000" />
        																<rect fill="#000000" opacity="0.3" x="8" y="2"
																		width="8" height="2" rx="1" />
    																</g>
																</svg> <!--end::Svg Icon-->
															</span>
														</div>
														<div class="wizard-label">
															<h3 class="wizard-title">Prescription Print</h3>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--end: Wizard Nav-->
										<!--begin: Wizard Body-->
										<div class="wizard-body py-8 px-8 py-lg-20 px-lg-10">
											<!--begin: Wizard Form-->
											<div class="row">
												<div class="offset-xxl-2 col-xxl-8">
													<form class="form" id="kt_form">
														<!--begin: Wizard Step 1-->
														<div class="pb-5" data-wizard-type="step-content"
															data-wizard-state="current">

															<div class="mb-10 d-flex justify-content-between">
																<h4 class="font-weight-bold text-dark">Patient
																	Details</h4>

																<!-- Button trigger modal-->
																<button type="button" class="btn btn-primary"
																	id="patient_history" data-toggle="modal"
																	data-target="#patientHistory">Patient History</button>

																<!-- Modal-->
																<div class="modal fade" id="patientHistory"
																	tabindex="-1" role="dialog"
																	aria-labelledby="staticBackdrop" aria-hidden="true">
																	<div
																		class="modal-dialog modal-xl modal-dialog-scrollable"
																		role="document">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="history_patient_name"></h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close"
																					onClick='clearPopUp()'>
																					<i aria-hidden="true" class="ki ki-close"></i>
																				</button>
																			</div>
																			<div class="modal-body">
																				<div class="card-body">
																					<table class="table">
																						<thead>
																							<tr>
																								<th style="text-align: center" scope="col">Sr.
																									No</th>
																								<th style="text-align: center" scope="col">Visit
																									Id</th>
																								<th style="text-align: center" scope="col">Visit
																									Date</th>
																								<th style="text-align: center" scope="col">Complaints</th>
																								<th style="text-align: center" scope="col">Diagnosis</th>
																								<th style="text-align: center" scope="col">Action</th>

																							</tr>
																						</thead>
																						<tbody class="table_body">
																						</tbody>
																					</table>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>

																<div class="modal fade" id="prescriptionHistory"
																	tabindex="-1" role="dialog"
																	aria-labelledby="staticBackdrop" aria-hidden="true">
																	<div
																		class="modal-dialog modal-xl modal-dialog-scrollable"
																		role="document">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="history_patient_name"></h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close"
																					onClick='clear_popUp()'>
																					<i aria-hidden="true" class="ki ki-close"></i>
																				</button>
																			</div>
																			<div class="modal-body1">

																				<div id="name" class="col-md-10 offset-1">
																					<span
																						class="d-flex justify-content-between align-items-baseline">

																						<div class="d-flex justify-content-start">
																							<h4
																								class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">PRESCRIPTION
																								ID:</h4>
																							<h4 class="font-weight-bold" id="prescription_id"></h4>
																						</div>

																						<div class="d-flex justify-content-start">
																							<h4
																								class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">PATIENT
																								CODE:</h4>
																							<h4 class="font-weight-bold" id="patient_code1"></h4>
																						</div>
																						<div class="d-flex justify-content-start">
																							<h4
																								class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">Re-Visit
																								Days:</h4>
																							<h4 class="font-weight-bold" id="re_visit_days"></h4>
																						</div>
																					</span> <span
																						class="d-flex justify-content-between align-items-baseline">

																						<div class="d-flex justify-content-start">
																							<h4
																								class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">VISIT
																								ID:</h4>
																							<h4 class="font-weight-bold" id="visit_Id"></h4>
																						</div>

																						<div class="d-flex justify-content-start">
																							<h4
																								class="pl-0 pr-4 font-weight-bold text-muted text-uppercase">VISIT
																								DATE:</h4>
																							<h4 class="font-weight-bold" id="date1"></h4>
																						</div>
																					</span>

																				</div>
																				<div class="row">
																					<div class="col-md-10 offset-1">

																						<div class="row px-10 mt-4 px-md-0"
																							id="complaint_popup">
																							<div class="table-responsive">
																								<table class="table">
																									<thead>
																										<tr>
																											<th
																												class="font-weight-bold h6 text-muted text-uppercase pl-5"
																												id="complaints_name_popup">Complaints</th>
																											<th
																												class="font-weight-bold h6 text-muted text-uppercase"
																												id="diagnosis_name_popup">Diagnosis</th>
																										</tr>
																									</thead>
																									<tbody id="cTbl">

																									</tbody>
																								</table>
																							</div>
																						</div>

																						<div class="row px-10 mt-4 px-md-0">
																							<div class="table-responsive">
																								<table class="table">
																									<thead>
																										<tr>
																											<th
																												class="font-weight-bold h6 text-muted text-uppercase ">
																												type</th>
																											<th
																												class="font-weight-bold h6 text-muted text-uppercase pl-5">
																												Medicine Name</th>
																											<th
																												class="font-weight-bold h6 text-muted text-uppercase">
																												Dose</th>
																											<th
																												class="font-weight-bold h6 text-muted text-uppercase">
																												Times</th>
																											<th
																												class="font-weight-bold h6 text-muted text-uppercase">
																												Qty</th>
																										</tr>
																									</thead>
																									<tbody id="mTbl">

																									</tbody>
																								</table>
																							</div>
																						</div>
																					</div>



																				</div>


																			</div>

																		</div>
																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Date</label> <input type="text"
																			class="form-control form-control-solid form-control-lg"
																			name="date" id="date" />
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Patient Name</label><span class="text-danger">*</span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid form-control-lg"
																				name="patientName" id="patient_name" /> <span
																				class="msg text-danger" id="type1"> </span>
																		</div>
																	</div>

																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Mobile No</label> <input type="number"
																			class="form-control form-control-solid form-control-lg"
																			name="mobileNo" id="mobile_no" /> <span
																			class="msg text-danger" id="type2"> </span>
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Patient Code</label> <input type="text"
																			class="form-control form-control-solid form-control-lg"
																			name="patient_code" id="patient_code" disabled />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Date of Birth </label> <input type="text"
																			class="form-control form-control-solid form-control-lg"
																			placeholder="DD/MM/YYYY" name="dob" id="dob" />
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Age</label><span class="text-danger">*</span> <input
																			type="text"
																			class="form-control form-control-solid form-control-lg"
																			placeholder="YYYY year MM month" name="age" id="age" />

																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Village/City</label> <select name="village"
																			id="village" class="form-control form-control-solid">
																			<option value="" disabled selected hidden>Select
																				Village/City</option>
																		</select>
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Blood Group</label> <select name="bloodGroup"
																			id="blood_group"
																			class="form-control form-control-solid">
																			<option value="" disabled selected hidden>Select
																				Blood Group</option>
																			<option value="o+">O+</option>
																			<option value="a+">A+</option>
																			<option value="b+">B+</option>
																			<option value="ab+">AB+</option>
																			<option value="o-">O-</option>
																			<option value="a-">A-</option>
																			<option value="b-">B-</option>
																			<option value="ab-">AB-</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="row">


																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Gender</label> <select name="gender"
																			id="gender" class="form-control form-control-solid">
																			<option value="" disabled selected hidden>Select
																				Gender</option>
																			<option value="male">Male</option>
																			<option value="female">Female</option>
																			<option value="other">Other</option>
																		</select>
																	</div>
																</div>

															</div>
															<div class="col-xl-6">
																<div class="form-group">
																	<label hidden>Aadhar No</label> <input type="number"
																		class="form-control form-control-solid form-control-lg"
																		name="adhar_no" id="aadhar_no" hidden />
																</div>
															</div>

														</div>
														<!--end: Wizard Step 1-->
														<!--begin: Wizard Step 2-->
														<div class="pb-5 " data-wizard-type="step-content">
															<h4 class="mb-10 font-weight-bold text-dark">Vital
																Details</h4>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Pulse</label> <input type="number"
																			class="form-control form-control-solid form-control-lg"
																			id="pulse" placeholder="ex:- 120" /><span
																			class="msg text-danger" id="type3"> </span>
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group col-xl-12">
																		<label>BP</label>
																		<div
																			class="row justify-content-between align-items-baseline">
																			<!-- <input type="number"
																				class="col-xl-12 form-control form-control-solid form-control-lg"
																				id="blood_pressure" /> -->

																			<input type="number"
																				class="col-xl-5 form-control form-control-solid form-control-lg"
																				id="sbp" placeholder="ex-80" /><span
																				class="msg text-danger" id="type4"> </span> /<input
																				type="number"
																				class="col-xl-5 form-control form-control-solid form-control-lg"
																				id="dbp" placeholder="ex-120" /><span
																				class="msg text-danger" id="type5"> </span>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Weight</label> <input type="number"
																			class="form-control form-control-solid form-control-lg"
																			id="weight" placeholder="ex:-60.00 or 167.0" /><span
																			class="msg text-danger" id="type6"> </span>

																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Height</label> <input type="number"
																			class="form-control form-control-solid form-control-lg"
																			id="height" placeholder="ex:- 167" /><span
																			class="msg text-danger" id="type7"> </span>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>HB</label> <input type="number"
																			class="form-control form-control-solid form-control-lg"
																			id="hb" placeholder="ex:- 14" /><span
																			class="msg text-danger" id="type8"> </span>
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Temp</label> <input type="number"
																			class="form-control form-control-solid form-control-lg"
																			id="temp" placeholder="ex:- 90 or 120" /><span
																			class="msg text-danger" id="type9"> </span>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group col-xl-12">
																		<label>Sugar</label>
																		<div
																			class="row justify-content-between align-items-baseline">
																			<input type="number"
																				class="form-control form-control-solid form-control-lg col-xl-4"
																				id="f" placeholder="Fasting ex-120"
																				placeholder="ex:- 120" /> <span
																				class="msg text-danger" id="type10"> </span><input
																				type="number"
																				class="form-control form-control-solid form-control-lg col-xl-4"
																				id="p" placeholder="Post meal ex-160"
																				placeholder="ex:- 160" /><span
																				class="msg text-danger" id="type11"> </span> <input
																				type="number"
																				class="form-control form-control-solid form-control-lg col-xl-4"
																				id="r" placeholder="Random ex-140"
																				placeholder="ex:- 140" /><span
																				class="msg text-danger" id="type12"> </span>
																		</div>
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Other</label> <input type="text"
																			class="form-control form-control-solid form-control-lg"
																			id="other" />
																	</div>
																</div>
															</div>


														</div>
														<!--end: Wizard Step 2-->
														<!--begin: Wizard Step 3-->
														<div class="pb-5" data-wizard-type="step-content">
															<h4 class="mb-10 font-weight-bold text-dark">Complaints</h4>
															<div class="form-group">
																<label>Complaints</label><select name="complaints_name"
																	id="complaints_name"
																	class="form-control form-control-solid form-control-lg select2"
																	multiple="multiple">

																</select>
															</div>
															<div class="form-group">
																<textarea type="text"
																	class="form-control form-control-solid form-control-lg"
																	rows="3" id="complaints_desc"></textarea>
															</div>
															<div class="form-group">
																<label>Other Complaints</label> <input type="text"
																	class="form-control form-control-solid form-control-lg"
																	name="other_complaints" id="other_complaints" />
															</div>
															<div class="form-group">
																<label>Diagnosis</label> <select name="diagnosis_name"
																	id="diagnosis_name"
																	class="form-control form-control-solid form-control-lg">
																	<option value="" disabled selected hidden>Select
																		Diagnosis</option>
																</select>
															</div>
															<div class="form-group">
																<input type="text"
																	class="form-control form-control-solid form-control-lg"
																	id="diagnosis_desc" />
															</div>


															<div class="form-group">
																<label>K/C/O</label> <input
																	class="form-control form-control-solid form-control-lg"
																	id="kco" />
															</div>

															<div class="form-group">
																<label>Allergy</label> <input
																	class="form-control form-control-solid form-control-lg"
																	id="allergy" />
															</div>

															<!--end::Select-->
														</div>
														<!--end: Wizard Step 3-->
														<!--begin: Wizard Step 4-->
														<div class="pb-5" data-wizard-type="step-content">
															<h4 class="mb-10 font-weight-bold text-dark">Prescription</h4>

															<div class="row">
																<select class="form-control col-4" id="templateList">
																	<option value="" disabled selected hidden>Select
																		Medicine Template</option>
																</select>
																<button type="button" id="addTemplate"
																	class="btn btn-primary col-2 ml-5">Add
																	Template</button>
                                                                <button type="button" id="injectionHistory"
																	class="btn btn-primary col-2 ml-5" id="injectionHistory" data-toggle="modal"
																	data-target="#injection_modal_history">Injection 
																	History</button>
                                                                
															</div>
															<div class="modal fade" id="injection_modal_history"
																	tabindex="-1" role="dialog"
																	aria-labelledby="staticBackdrop" aria-hidden="true">
																	<div
																		class="modal-dialog modal-xl modal-dialog-scrollable"
																		role="document">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="history_patient_name"></h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close"
																					onClick='clearPopUp()'>
																					<i aria-hidden="true" class="ki ki-close"></i>
																				</button>
																			</div>
																			<div class="modal-body">
																				
																					
								<table class="table">
																						<thead>
																							<tr>
																								<th style="text-align: center;" scope="col">Sr.NO</th>
						                                                                        <th style="text-align: center" scope="col">Visit ID</th>
						                                                                        <th style="text-align: center;" scope="col">Visit Date</th>
						                                                                       <th style="text-align: center" scope="col">Injection Details</th>

																							</tr>
																						</thead>
																						<tbody class="table_body_for_injection">
																						</tbody>
																					</table>													
										<!-- <div class="form-group">
											<label class="text-left">Template Name</label><span class="text-danger">*</span>
											<input type="text" class="form-control form-control-solid"
												name="templateName" id="template_name"
												placeholder="Enter Template name" />
										</div>
										<div class="form-group">
											<label>Template Desc</label><span class="text-danger">*</span>
											<input type="text" class="form-control form-control-solid"
												name="templateCode" id="template_code"
												placeholder="Enter Template Code" />
										</div>
									
									
									<button type="button" id="addMedicineMaster"
													class="btn font-weight-bold btn-primary mr-2 text-right">Create template</button> -->
																					
																					
																					
																				
																			</div>

																		</div>
																	</div>
																</div>
															
															
															
															<div class="card-body ">
																<span class="text-danger">double click on
																	Medicine Field to search new medicine</span>
																<table class="table" id="Mtable">
																	<thead>
																		<tr>
																			<th style="text-align: center" scope="col">#</th>
																			<th style="text-align: center" scope="col">Med.
																				Name</th>
																			<th style="text-align: center" scope="col">Type</th>
																			<th style="text-align: center" scope="col">Dose</th>
																			<th style="text-align: center" scope="col">Time</th>
																			<th style="text-align: center" scope="col">Qty</th>
																			<th style="text-align: center" scope="col">Spl</th>
																			<th style="text-align: center" scope="col">Prt</th>
																			<th style="text-align: center" scope="col">Remark</th>
																			<th style="text-align: center" scope="col">Action</th>
																			<th style="text-align: center" scope="col" hidden>Category</th>
																			<!-- <th style="text-align:center" scope="col" hidden>Is_Printable</th> -->
																		</tr>
																	</thead>

																	<tbody class="add_medicine" id="add-medicine"></tbody>


																</table>
															</div>


															<div class="text-right mb-5 mr-22">
																<button type="button" id="add"
																	class="btn font-weight-bold  btn-icon btn-light-success">
																	<i class="la la-plus"></i>
																</button>
																<button type="button" class="btn btn-primary"
																	id="create_template" data-toggle="modal"
																	data-target="#createTemplate">Create Template</button>
																
																</div><div>
																<!-- Button trigger modal-->
																

																<!-- Modal-->
																<div class="modal fade" id="createTemplate"
																	tabindex="-1" role="dialog"
																	aria-labelledby="staticBackdrop" aria-hidden="true">
																	<div
																		class="modal-dialog modal-l modal-dialog-scrollable"
																		role="document">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="history_patient_name"></h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close"
																					onClick='clearPopUp()'>
																					<i aria-hidden="true" class="ki ki-close"></i>
																				</button>
																			</div>
																			<div class="modal-body">
																				<div class="card-body">
																					
																					
										<div class="form-group">
											<label class="text-left">Template Name</label><span class="text-danger">*</span>
											<input type="text" class="form-control form-control-solid"
												name="templateName" id="template_name"
												placeholder="Enter Template name" />
										</div>
										<div class="form-group">
											<label>Template Desc</label><span class="text-danger">*</span>
											<input type="text" class="form-control form-control-solid"
												name="templateCode" id="template_code"
												placeholder="Enter Template Code" />
										</div>
									
									
									<button type="button" id="addMedicineMaster"
													class="btn font-weight-bold btn-primary mr-2 text-right">Create template</button>
																					
																					
																					
																					
																				</div>
																			</div>

																		</div>
																	</div>
																</div>
																
																
															</div>
															
															

															<div class="modal fade" id="medicineModel" tabindex="-1"
																role="dialog" aria-labelledby="staticBackdrop"
																aria-hidden="true">
																<div
																	class="modal-dialog  modal-xl modal-dialog-scrollable"
																	role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="history_patient_name"></h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<i aria-hidden="true" class="ki ki-close"></i>
																			</button>
																		</div>
																		<div class="modal-body">

																			<div
																				class="quick-search quick-search-inline ml-20 w-300px "
																				id="kt_quick_search_inline">
																				<!--begin::Form-->
																				<form method="get" class="quick-search-form">
																					<div class="input-group rounded bg-light">
																						<div class="input-group-prepend">
																							<span class="input-group-text"> <span
																								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/Bafana_OPD/media/svg/icons/General/Search.svg-->
																									<svg xmlns="http://www.w3.org/2000/svg"
																										xmlns:xlink="http://www.w3.org/1999/xlink"
																										width="24px" height="24px" viewBox="0 0 24 24"
																										version="1.1">
															<g stroke="none" stroke-width="1" fill="none"
																											fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24" />
																<path
																											d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
																											fill="#000000" fill-rule="nonzero"
																											opacity="0.3" />
																<path
																											d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
																											fill="#000000" fill-rule="nonzero" />
															</g>
														</svg> <!--end::Svg Icon-->
																							</span>
																							</span>
																						</div>
																						<input type="text" class="form-control h-45px "
																							id="txt_searchall" placeholder="Search..." />
																						<div class="input-group-append">
																							<span class="input-group-text"> <i
																								class="quick-search-close ki ki-close icon-sm text-muted"></i>
																							</span>
																						</div>
																					</div>
																				</form>
																				<!--end::Form-->
																				<!--begin::Search Toggle-->
																				<div id="kt_quick_search_toggle"
																					data-toggle="dropdown" data-offset="0px,1px"></div>
																				<!--end::Search Toggle-->
																				<!--begin::Dropdown-->
																				<div
																					class="dropdown-menu dropdown-menu-left dropdown-menu-lg dropdown-menu-anim-up">
																					<div class="quick-search-wrapper scroll"
																						data-scroll="true" data-height="350"
																						data-mobile-height="200"></div>
																				</div>
																				<!--end::Dropdown-->
																			</div>
																			<br />
																			<div class="col-xl-12">
																				<div class="card card-custom gutter-b">
																					<div class="card-body">
																						<!--begin: Datatable-->
																						<div
																							class="datatable datatable-bordered datatable-head-custom"
																							id="kt_datatable1"></div>
																						<table id="popup_table"></table>
																						<!--end: Datatable-->
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button"
																				class="btn btn-light-primary font-weight-bold"
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>

															<div class="row">
																<label class="col-2">Select Advice</label>
																<div class="form-group col-md-8">
																	<select name="advice_name" id="advice_name"
																		class="form-control form-control-solid form-control-lg select2"
																		multiple="multiple">

																	</select>
																</div>
															</div>
															<div class="row">
																<label class="col-2">Special Advise:</label>
																<div class="form-group mb-1 col-8">
																	<textarea class="form-control" id="special_advise"
																		rows="5"></textarea>
																</div>
															</div>




														</div>
														<!--end: Wizard Step 4-->
														<!--begin: Wizard Step 5-->
														<div class="pb-5" data-wizard-type="step-content">
															<h4 class="mb-10 font-weight-bold text-dark">Prescription
																Print</h4>
															<div class="form-group row">
																<div class="col-9 col-form-label">
																	<div class="checkbox-list">

																		<div class="row">
																			<div class="col-md-4">
																				<label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isHeader" checked /> <span></span>
																					Header
																				</label> <label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isLogo" checked /> <span></span>
																					Logo
																				</label> <label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isVital" checked /> <span></span>
																					Vital Details
																				</label>
																			</div>


																			<div class="col-md-4">
																				<label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isHeightWeight" checked /> <span></span>
																					Height/Weight
																				</label> <label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isDiagnosis" checked /> <span></span>
																					Diagnosis
																				</label> <label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isComplaint" checked /> <span></span>
																					Complaint
																				</label>
																			</div>


																			<div class="col-md-4">
																				<label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isKco" checked /> <span></span>
																					K/C/O
																				</label><label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isAllergy" checked /> <span></span>
																					Allergy
																				</label> <label class="checkbox checkbox-lg"> <input
																					type="checkbox" id="isNotice" checked /> <span></span>
																					Notice
																				</label>


																			</div>
																		</div>


																	</div>
																</div>
															</div>

															<div class="form-group">
																<label>Time</label> <input
																	class="form-control form-control-solid form-control-lg"
																	id="clinicTime" />
															</div>
															<div class="form-group">
																<label>Re-Visit</label> <input
																	class="form-control form-control-solid form-control-lg"
																	id="re_visit" />
															</div>

															<div class="form-group">
																<label>Notice</label> <input
																	class="form-control form-control-solid form-control-lg"
																	id="notice" />
															</div>

														</div>
														<!--end: Wizard Step 5-->
														<!--begin: Wizard Actions-->
														<div
															class="d-flex justify-content-between border-top mt-5 pt-10">
															<div class="mr-2">
																<button type="button"
																	class="btn btn-light-primary font-weight-bolder text-uppercase px-9 py-4"
																	data-wizard-type="action-prev">Previous</button>
															</div>
															<div>
																<button type="submit"
																	class="btn btn-success font-weight-bolder text-uppercase px-9 py-4"
																	id="addFromWizardData" data-wizard-type="action-submit">Submit</button>
																<button type="button"
																	class="btn btn-primary font-weight-bolder text-uppercase px-9 py-4"
																	data-wizard-type="action-next">Next</button>
															</div>
														</div>
														<!--end: Wizard Actions-->
													</form>
												</div>
												<!--end: Wizard-->
											</div>
											<!--end: Wizard Form-->
										</div>
										<!--end: Wizard Body-->
									</div>
									<!--end: Wizard-->
								</div>
							</div>


						</div>
						<!--end::Container-->
					</div>
					<!--end::Entry-->
				</div>
				<!--end::Content-->
				<!--begin::Footer-->
				<jsp:include page="../common/footer.jsp"></jsp:include>
				<!--end::Footer-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<!--end::Main-->


	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/widgets.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/custom/wizard/wizard-2.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/crud/forms/widgets/form-repeater.js"></script>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	    
	
	$("#patient_name").change(function(){
		var text=	$("#patient_name").val();
		var letters = /^[A-Za-z(). ]+$/;
		 if(text.match(letters))
	     {
				
			 $('#type1').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type1').text('Please Enter Letters Only.');
	    $("#patient_name").val('');
	     return false;
	     }
		});
	
	$("#mobile_no").change(function(){
		var text=	$("#mobile_no").val();
		 var phoneno = /^\d{10}$/;
		 if(text.match(phoneno))
	     {
				
			 $('#type2').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type2').text('Please Enter 10 Digits Only.');
	    $("#mobile_no").val('');
	     return false;
	     }
		});
	
	$("#pulse").change(function(){
		var text=	$("#pulse").val();
		var letters =/^[1-9]?[0-9 ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type3').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type3').text('pulse should be in digit .');
	    $("#pulse").val('');
	     return false;
	     }
		});
	$("#sbp").change(function(){
		var text=	$("#sbp").val();
		var letters =/^[1-9]?[0-9 ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type4').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type4').text('sbp Should be in digit.');
	    $("#sbp").val('');
	     return false;
	     }
		});
	
	$("#dbp").change(function(){
		var text=	$("#dbp").val();
		var letters =/^[1-9]?[0-9 ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type5').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type5').text('dbp Should be in digit.');
	    $("#dbp").val('');
	     return false;
	     }
		});
	$("#weight").change(function(){
		var text=	$("#weight").val();
		var letters =/^[1-9]?[0-9() .]{0,5}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type6').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type6').text('Weight Should be in 2 Decimal.');
	    $("#weight").val('');
	     return false;
	     }
		});
	$("#height").change(function(){
		var text=	$("#height").val();
		var letters =/^[1-9]?[0-9() .]{0,5}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type7').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type7').text('Height Should be in digit..');
	    $("#height").val('');
	     return false;
	     }
		});
	$("#hb").change(function(){
		var text=	$("#hb").val();
		var letters =/^[1-9]?[0-9() ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type8').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type8').text(' HB Should be in  2 Digits Only.');
	    $("#hb").val('');
	     return false;
	     }
		});
	$("#temp").change(function(){
		var text=	$("#temp").val();
		var letters =/^[1-9]?[0-9 ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type9').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type9').text('Temp Should be in Digits.');
	    $("#temp").val('');
	     return false;
	     }
		});
	
	$("#f").change(function(){
		var text=	$("#f").val();
		var letters =/^[1-9]?[0-9 ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type10').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type10').text('Fasting Should be in Digits.');
	    $("#f").val('');
	     return false;
	     }
		});
	$("#p").change(function(){
		var text=	$("#p").val();
		var letters =/^[1-9]?[0-9 ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type11').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type11').text('Post Meal Should be in Digits.');
	    $("#p").val('');
	     return false;
	     }
		});
	$("#r").change(function(){
		var text=	$("#r").val();
		var letters =/^[1-9]?[0-9 ]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type12').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type12').text('Random Should be in Digits.');
	    $("#r").val('');
	     return false;
	     }
		});
	$( document ).ready(function() {
		var date = new Date();
		var today = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
		$('#date').val(today);
	});



$("#date,#dob").change(function() {
	var in_dob = $('#dob').val();

    let today = new Date();
    let dob = in_dob.split("/");

    let inputDate = new Date(dob[1] + "/" + dob[0] + "/" + dob[2]);
    
    
    let birthMonth,birthDate,birthYear;
    let birthDetails = {
        date:inputDate.getDate(),
        month:inputDate.getMonth()+1,
        year:inputDate.getFullYear()
    }
    let currentYear = today.getFullYear();
    let currentMonth = today.getMonth()+1;
    let currentDate = today.getDate();


    birthYear = currentYear - birthDetails.year;

    if(currentMonth >= birthDetails.month){
        birthMonth = currentMonth - birthDetails.month;
    }
    else{
        birthYear--;
        birthMonth = 12 + currentMonth - birthDetails.month;
    }

	    
	    $('#age').val(birthYear + " y " + birthMonth + " m ");
	
});


$('#patient_history').hide();

var pcode;

$('#patient_name').change(function(){

	var patient_name = $(this).val();
		
	$.ajax({
		url : base + "/dssAPI/dfapi/getPatientDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1,},
		success:function(data)
        {
			
			const row = data.find(d => d.patient_name == patient_name);
			
			
			if(row != null){
				
				pcode = row.patient_code; 
				
				if(pcode => 0){
					$('#patient_history').show();
				}else{
					$('#patient_history').hide();
				}
				
				$('#village').val(row.city_desc);
				
				if(row.birth_date != "0001-01-01 BC"){
					let date = new Date(row.birth_date);
					$('#dob').val(date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear());
					console.log($('#dob').val());
				}
				$('#age').val(row.age);
				$('#aadhar_no').val(row.aadhar_no);
				$('#blood_group').val(row.blood_group);
				$('#mobile_no').val(row.mobile_no);
				$('#gender').val(row.gender);
				$('#patient_code').val(row.patient_code);
				$('#patient_code').addClass("text-muted");
			}else{
				$('#patient_code').val("");
				$('#village').val("");
				$('#dob').val("");
				$('#age').val("");
				
				$('#blood_group').val("");
				$('#mobile_no').val("");
				$('#kco').val("");
				$('#allergy').val("");
			}

        }
	});	
	
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getPatientPrescription",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1,},
		success:function(data)
        {
			
			const row = data.find(d => d.patient_code == pcode);
			
			console.log("pcode : " + pcode);
			console.log(data);
			
			if(row != null){
				$('#kco').val(row.kco);
				$('#allergy').val(row.allergy);
				
			}else{
				$('#kco').val("");
				$('#allergy').val("");
			}

        }
	});	
	
})

$.urlParam = function(name){
	var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	return results != null ? results[1] || 0 : 0;
}
			     
var query = $.urlParam('pcode');

console.log("data " + query);

if(query != '' && query != null){	
	
	$('#patient_history').show();
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getPatientDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1,},
		success:function(data)
        {
			
			const row = data.find(d => d.patient_name == query || d.patient_code == query || d.mobile_no == query);
			
			console.log(row);
			
			if(row != null){
				
				if(row.birth_date != "0001-01-01 BC"){
					let date = new Date(row.birth_date);
					$('#dob').val(date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear());
				}
				
				$('#village').val(row.city_desc);
				$('#age').val(row.age);
				$('#aadhar_no').val(row.aadhar_no);
				$('#blood_group').val(row.blood_group);
				$('#mobile_no').val(row.mobile_no);
				$('#gender').val(row.gender);
				$('#patient_name').val(row.patient_name);
				$('#patient_code').val(row.patient_code);
				$('#patient_code').addClass("text-muted");
			}else{
				$('#patient_code').val("");
				$('#village').val("");
				$('#dob').val("");
				$('#age').val("");
				$('#aadhar_no').val("");
				$('#blood_group').val("");
				$('#mobile_no').val("");
				$('#kco').val("");
				$('#allergy').val("");
			}

        }
	});	
	
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getPatientPrescription",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1,},
		success:function(data)
        {
			
			const row = data.find(d => d.patient_code == pcode);
			
			console.log(row);
			
			if(row != null){
				$('#kco').val(row.kco);
				$('#allergy').val(row.allergy);
				
			}else{
				$('#kco').val("");
				$('#allergy').val("");
			}

        }
	});	
}	

$('#patient_history').click(function(){	
	let patient_code = $('#patient_code').val();
	let patient_name = $('#patient_name').val();
	$('#history_patient_code').text(patient_code);
	$('#history_patient_name').text(patient_name);

var j=0;
	$.ajax({
		url : base + "/dssAPI/dfapi/getPatientHistory",
		type : "post",
		dataType : "json",
		async : false,
		data : {"patient_code": patient_code},
		success:function(data)
    	{
			
			//data.forEach((element)=> {
			const row = data.find(d => d.patient_code == patient_code);
			data.forEach((row)=> {
			
			if(row.patient_code == pcode){	
				
				    j++;
						
						$('#visitId-' + j).val(row.visit_id);
						$('#visitDate-' + j).val(row.visit_date);
						$('#complaint-' + j).val(row.complaint_desc);
						$('#diagnosis-' + j).val(row.diagnosis_desc);
			}
			
			});
				 
    	}
	});	
});


	$.ajax({
		url : base + "/dssAPI/dfapi/getAdvice",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
	    {
			data.forEach((element)=> {
				
			        $('#advice_name').append($(document.createElement('option')).prop({
		                value: element.advice_desc,
		                text: element.advice_name
		            }))
				
			});   
	    }
	});	
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getCityDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
				
			        $('#village').append($(document.createElement('option')).prop({
		                value: element.city_name,
		                text: element.city_name
		            }))
				
			});   
        }
	});	
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getComplaints",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
				
			        $('#complaints_name').append($(document.createElement('option')).prop({
		                value: element.complaint_desc,
		                text: element.complaint_name
		            }))
				
			});   
        }
	});	
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getDiagnosis",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
				
			        $('#diagnosis_name').append($(document.createElement('option')).prop({
		                value: element.diagnosis_desc,
		                text: element.diagnosis_name
		            }))
				
			});   
        }
	});	
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getMedicineTemplateMaster",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach(function(element) {
				
			        $('#templateList').append($(document.createElement('option')).prop({
		                value: element.template_id,
		                text: element.template_name
		            }))
				
			});   
        }
	});
	
	 $('#complaints_desc').hide();
	 $('#diagnosis_desc').hide();

	
	 $('#complaints_name').change(function(){
		 		
		 	$('#complaints_desc').show();
		 	
		 	var complaints_name = $(this).val();
		 	
		 	console.log(complaints_name);
			
			var complaints = complaints_name.join("\n> ");
			
			console.log(complaints);
			
			$('#complaints_desc').val("> ".concat(complaints));
	 });
	 
	 $('#diagnosis_name').change(function(){
	 		
		 	$('#diagnosis_desc').show();
		 	
		 	var diagnosis_name = $(this).val();
			$('#diagnosis_desc').val(diagnosis_name); 
	 });
	 
	 $('#advice_name').change(function(){
	 				 	
		 	var advice_name = $(this).val();
		 	
		 	var advice = advice_name.join("\n> ");
			
			$('#special_advise').val("> ".concat(advice));	
			
	 });
	 
	 var medData;
	 var r=0;
	 var table_len=(Mtable.rows.length);
	
	 $('#add').click(function () {
	 	
	 	var i =table_len;
	 	
	 	  
	 	  var html = ''; 
	 	  html += '<tr>';
	 	  html += '<td style="width: 3%;">' + i + '</td>';
	 	  html += '<td style="width: 18%;" ><input type="text" class="form-control medicineName" id="medicineName-' + i +'" name="medicineName" data-medicine-id="'+ i + '" placeholder="Medicine"></input></td>';
 	 	  html += '<td style="width: 16%;"><input type="text" class="form-control type" name="type" id="type-' + i + '" placeholder="Type"></input></td>';
	 	  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid dose" name="dose" id="dose-' + i + '" placeholder="Dose" /></td>';
	 	  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid time" name="time" id="time-' + i + '" placeholder="Time" /></td>';
	 	  html += '<td style="width: 12%;"><input type="text" class="form-control form-control-solid qty" name="qty" id="qty-' + i + '" placeholder="Qty" /></td>';
	 	  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="isSpecial" name="isSpecial" id="isSpecial-'+ i +'"/> <span></span></label></div></td>';
	 	  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="Is_Printable" name="Is_Printable" id="Is_Printable-'+ i +'"/> <span></span></label></div></td>';
	 	  html += '<td style="width: 25%;"><select class="form-control remark" name="remark" id="remark-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
	 	 html += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
	 	  html += '<td style="width: 0%;"><input type="text" class="form-control category" name="category" id="category-' + i + '" placeholder="Category" hidden></input></td></tr>';
	 	 
	 	 $('.add_medicine').append(html); 
	 		 $('.add_medicine #medicineName-'+ i).dblclick(function () {
	 			   mname=(this.id);
	 			   
	 			  var str = mname;
	 	           matches = str.match(/(\d+)/);
	 	         
	 			
	 			  $("#medicineModel").modal();
	 			 
	 			});
	 		 $.ajax({
	 				url : base + "/dssAPI/dfapi/getRemark",
	 				type : "post",
	 				dataType : "json",
	 				async : false,
	 				data : {"flag":1},
	 				success:function(data)
	 			    {
	 					data.forEach((element)=> {
	 						
	 					        $('#remark-' + i).append($(document.createElement('option')).prop({
	 				                value: element.remark_desc,
	 				                text: element.remark_name
	 				            }))
	 						
	 					});   
	 			    }
	 			});	
	 		 
	 		 table_len++;
	 		
	 		 $('.add_medicine').on('click','.btn_delete',function(){
	 		$(this).closest('tr').remove();	
	 		});
	 		
	 		
	 		});
	 function update(id){
			// var medicine_name = $(this).val(row.medicine_name);
			//var id = $(this).data('medicine-id');

			//console.log(medicine_name);
			
			$.ajax({
		        type:"POST",
		        dataType: "json",
		        data:{"medicine_id": id},
				async : false,
		        url: base + "/dssAPI/dfapi/getMedicineDetails",
		        success:function(data)
		        {
		            const row = data.find(d => d.medicine_id ==id);
		            $('#medicineName-'+ matches).val(row.medicine_name);
		        	$("#type-"+ matches).val(row.medicine_type);
		        	$("#category-"+ matches).val(row.medicine_category);
		        	if(row.is_special == 'Y'){
		        		$('#isSpecial-' + matches).prop("checked", true)
		        	}
		        	if(row.is_printable == 'Y'){
		        		$('#Is_Printable-' + matches).prop("checked", true)
		        	}
		        }
		     });
			 $("#medicineModel").modal('hide');
		} 
		$(document).ready(function(){

			  // Search all columns
			  $('#txt_searchall').keyup(function(){
			    // Search Text
			    var search = $(this).val();

			    // Hide all table tbody rows
			    $('#popup_table tbody tr').hide();

			    // Count total search result
			    var len = $('#popup_table tbody tr:not(.notfound) td:contains("'+search+'")').length;

			    if(len > 0){
			      // Searching text in columns and show match row
			      $('#popup_table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
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
	 $('#addTemplate').click(function(){
		 		 
		var template_id =  $( "#templateList" ).val();
		$.ajax({
			url : base + "/dssAPI/dfapi/getMedicineTemplateMaster",
			type : "post",
			dataType : "json",
			async : false,
			data : {"template_id": template_id},
			success:function(data)
        	{
				const row = data.find(d => d.template_id == template_id);
				
				const parsedData = JSON.parse(row["template_desc"]);
	         
					 $(parsedData).each(function(index) {
						r++;
							$('#medicineName-' + (index + 1)).val(parsedData[index]['medicineName']);
							$('#type-' + (index + 1)).val(parsedData[index]['type']);
							 $('#category-' + (index + 1)).val(parsedData[index]['category']); 
							$('#dose-' + (index + 1)).val(parsedData[index]['dose']);
							$('#time-' + (index + 1)).val(parsedData[index]['time']);
							$('#qty-' + (index + 1)).val(parsedData[index]['qty']);
							if(parsedData[index]['is_special'] == 'Y'){
								$('#isSpecial-' + (index + 1)).prop("checked", true)
							}
							if(parsedData[index]['isPrintable'] == 'Y'){
								$('#Is_Printable-' + (index + 1)).prop("checked", true)
							}
							$('#remark-' + (index + 1)).val(parsedData[index]['remark']);
						});
					 
					 for(var i = 1; i <=r; i++){
						  var html = '';
						  html += '<tr>';
						  html += '<td style="width: 3%;">' + i + '</td>';
						  html += '<td style="width: 18%;" ><input type="text" class="form-control medicineName" id="medicineName-' + i +'" name="medicineName" data-medicine-id="'+ i + '"><option value="" disabled selected hidden>Select</option></select></td>';
 					     html += '<td style="width: 16%;"><input type="text" class="form-control type" name="type" id="type-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
						  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid dose" name="dose" id="dose-' + i + '" placeholder="Dose" /></td>';
						  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid time" name="time" id="time-' + i + '" placeholder="Time" /></td>';
						  html += '<td style="width: 12%;"><input type="text" class="form-control form-control-solid qty" name="qty" id="qty-' + i + '" placeholder="Qty" /></td>';
						  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="isSpecial" name="isSpecial" id="isSpecial-'+ i +'"/> <span></span></label></div></td>';
						  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="Is_Printable" name="Is_Printable" id="Is_Printable-'+ i +'"/> <span></span></label></div></td>';
						  html += '<td style="width: 25%;"><input type="text" class="form-control remark" name="remark" id="remark-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
						//  html += '<td style="width: 5%;"><a type="button" data-repeater-reset="" onClick="resetRow(' + i + ')"; id="resetRow-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger"><i class="la la-eraser"></i></a></td>';
							 html += '<td style="width: 5%;"><a type="button" data-repeater-delete="";  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
						// html += '<td><a type="button" data-repeater-reset="" onClick="resetRow(' + i + ')"; id="resetRow-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger"><i class="la la-eraser"></i></a></td>';
						  //html += '<td><a type="button" data-repeater-create="" onClick="addRow(' + i + ')"; id="addRow-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger"><i class="la la-plus"></i></a></td></tr>';
     					  html += '<td style="width: 0%;"><input type="text" class="form-control category" name="category" id="category-' + i + '" hidden><option value="" disabled selected hidden>Select</option></select></td>';

						  $('.add_medicine').append(html);
				 }
					 const parsedData1 = JSON.parse(row["template_desc"]);
							 $(parsedData1).each(function(index) {
									$('#medicineName-' + (index + 1)).val(parsedData1[index]['medicineName']);
									$('#type-' + (index + 1)).val(parsedData1[index]['type']);
									$('#category-' + (index + 1)).val(parsedData1[index]['category']);
									$('#dose-' + (index + 1)).val(parsedData1[index]['dose']);
									$('#time-' + (index + 1)).val(parsedData1[index]['time']);
									$('#qty-' + (index + 1)).val(parsedData1[index]['qty']);
									if(parsedData1[index]['is_special'] == 'Y'){
										$('#isSpecial-' + (index + 1)).prop("checked", true)
									}
									if(parsedData[index]['isPrintable'] == 'Y'){
										$('#Is_Printable-' + (index + 1)).prop("checked", true)
									}
									$('#remark-' + (index + 1)).val(parsedData1[index]['remark']);
								});		
        	}
		});	
		
   
	 table_len=(Mtable.rows.length);
	
	 $('.add_medicine').on('click','.btn_delete',function(){
			$(this).closest('tr').remove();	
			});
		});
	 var isLogoValue = true, isHeaderValue = true, isHeightWeightValue = true, 
	 isVitalValue = true, isComplaintValue = true, isKcoValue = true, 
	 isAllergyValue = true, isNoticeValue = true,  isDiagnosis = true;
	 
	$("#isLogo").click(function() {
	   isLogoValue = $(this).is(':checked');
	});
	
	
	 $("#isHeader").click(function() {
		isHeaderValue = $(this).is(':checked');
	});
	
	
	 $("#isHeightWeight").click(function() {
	   isHeightWeightValue = $(this).is(':checked');
	});
			
	 $("#isVital").click(function() {
	   isVitalValue = $(this).is(':checked');
	});
	 
	 $("#isComplaint").click(function() {
		 isComplaintValue = $(this).is(':checked');
	});
	 
	 $("#isKco").click(function() {
		   isKcoValue = $(this).is(':checked');
	});
		 
	 $("#isAllergy").click(function() {
		 isAllergyValue = $(this).is(':checked');
	});
	 
	 $("#isNotice").click(function() {
		 isNoticeValue = $(this).is(':checked');
	});
	 $("#isDiagnosis").click(function() {
		 isDiagnosis = $(this).is(':checked');
	});
	 $("#clinicTime").val("सकाळी ९ ते १.३०   सायं. ४ ते ८ वाजता.");
	 $("#notice").val("दवाखाना रविवारी सुद्धा चालू राहील");		
	
	

		$('#addFromWizardData').click(function() {
			
			
			var med = [];

			$("table tbody tr").each(function(index) {
				
				if($(this).find('.medicineName').val() != null){
					
					var isSpecialValue =  $(this).find('.isSpecial').is(":checked");
					var isSpecial;
					if(isSpecialValue == true){
						isSpecial = "Y";
					}else{
						isSpecial = "N";
					}
					
					var isPrintableValue =  $(this).find('.Is_Printable').is(":checked");
			 		var isPrintable;
			 		if(isPrintableValue == true){
			 			isPrintable = "Y";
			 		}else{
			 			isPrintable = "N";
			 		}
							
			    med.push({ 
			        "medicineName": $(this).find('.medicineName').val(),
			        "type": $(this).find('.type').val(),
			        "category": $(this).find('.category').val(),
			        "dose": $(this).find('.dose').val(),
			        "time": $(this).find('.time').val(),
			        "qty": $(this).find('.qty').val(),
			        "remark": $(this).find('.remark').val(),
			        "is_printable": $(this).find('.isPrintable').val(),
			        "is_special": isSpecial,
			        "isPrintable":isPrintable
			    	});
				}
			});
			
			var jsonString = JSON.stringify(med);

							/// Patient Details
							var letters = /^[A-Za-z(). ]+$/;
							var patient_name = $('#patient_name').val();
							var date = $('#date').val();
							var dob = $('#dob').val();
							var age = $('#age').val();
							var aadhar = $('#aadhar_no').val();
							var patient_code = $('#patient_code').val();
							var mobile_no = $('#mobile_no').val();
							var city_desc = $('#village').val();
							var blood_group = $('#blood_group').val();
							var gender = $('#gender').val();
							
							/// Vital Details
							var pulse = $('#pulse').val();
							var weight = $('#weight').val();
							var hb = $('#hb').val();
							var temperature = $('#temp').val();
							var other = $('#other').val();
							
							var sbp = $('#sbp').val();
							var dbp = $('#dbp').val();
							
							var bp_obj = { "s" : sbp, "d" : dbp }; 
							
							var blood_pressure = JSON.stringify(bp_obj);
							
							var f = $('#f').val();
							var p = $('#p').val();
							var r = $('#r').val();
							
							var sugar_obj = { "f" : f, "p" : p, "r" : r };
							
							var sugar = JSON.stringify(sugar_obj);
							
							/// Complaints
							var complaints_desc = $('#complaints_desc').val();
							var other_complaints = $('#other_complaints').val();
							var diagnosis_desc = $('#diagnosis_desc').val();
														
							/// Prescription
							var special_advise = $('#special_advise').val();
							var kco = $('#kco').val();
							var allergy = $('#allergy').val();
							var prescription_desc = jsonString;
							var re_visit = $('#re_visit').val();
														
							
							var flag = 1; // Addition
							
							var print  = isLogoValue+"$"+isHeaderValue+"$"+isHeightWeightValue+"$"+isVitalValue+"$"+isComplaintValue+"$"+isKcoValue+"$"+isAllergyValue+"$"+isNoticeValue+"$"+isDiagnosis;
							var timeNotice = $('#clinicTime').val() + "$" + $('#notice').val();
							/// Patient Details							
								
								var patientDetails = patient_name+"$"+dob+"$"+age+"$"+aadhar+"$"+mobile_no+"$"+city_desc+"$"+blood_group+"$"+date+"$"+gender;
								var vitalDetails = pulse+"$"+blood_pressure+"$"+weight+"$"+hb+"$"+temperature+"$"+sugar+"$"+other;
								var complaintsDetails = complaints_desc+"$"+other_complaints+"$"+diagnosis_desc;
								var prescriptionDetails = prescription_desc+"$"+special_advise+"$"+kco+"$"+allergy+"$"+re_visit;
							
							if( patient_name != "" && patient_name.match(letters) && (patient_code == '' || patient_code == null)){
								
							
								$.ajax({
									url : base + "/dssAPI/dfapi/insertWizardFormDetails",
									type : "post",
									dataType : "json",
									async : false,
									data : {
										"patientDetails" : patientDetails,
										"vitalDetails": vitalDetails,
										"complaintsDetails": complaintsDetails,
										"prescriptionDetails": prescriptionDetails,
										"flag": flag,
									},
									success : function(response) {
										if (response != null) {

											if (response >= 1) {
												
												console.log(response);

												var url = "prescription-print.jsp" + '?print=' + print + '&timeNotice=' + timeNotice + '&code=' + response + '&re_visit='+re_visit;
												
												window.location.assign(url);	

											}
										}
									}
								});		
							
							} else if( patient_name != "" && patient_name.match(letters) &&(patient_code != '' || patient_code != null)) {
								$.ajax({
									url : base + "/dssAPI/dfapi/updateWizardFormDetails",
									type : "post",
									dataType : "json",
									async : false,
									data : {
										"patient_code": patient_code,
										"patientDetails" : patientDetails,
										"vitalDetails": vitalDetails,
										"complaintsDetails": complaintsDetails,
										"prescriptionDetails": prescriptionDetails,
										"flag": flag,
									},
									success : function(response) {
										if (response != null) {

											if (response >= 1) {
												
												var url = "prescription-print.jsp" + '?print=' + print + '&timeNotice=' + timeNotice + '&code=' + response + '&re_visit='+re_visit;
												
												window.location.assign(url);	

											}
										}
									}
						
							
						});
		}else{ 
			alert("Data Insertion Failed.   Please fill the Mendontory field");
		}

		});
		
		
		 var pName = [];
			
			$.ajax({
			url : base + "/dssAPI/dfapi/getPatientDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1},
			success:function(data)
	        {
				if(data != null){
					data.forEach(function(e){
						pName.push(e.patient_name);
					})
				}  
	        }
			});
			
		
		var KTBootstrapDaterangepicker = function() {
				// Private functions
				var demo2 = function() {
	 		var medicineId=null;
	         var datatable = $('#popup_table').KTDatatable({
	             // datasource definition
	             data: {
	                 type: 'remote',
	                 source: {
	                     read: {
	                         url: base + "/dssAPI/dfapi/getMedicineDetails",
	                         // sample custom headers
	                         // headers: {'x-my-custom-header': 'some value', 'x-test-header': 'the value'},
	                         map: function(raw) {
	                             // sample data mapping
	                             var dataSet = raw;
	                             if (typeof raw.data !== 'undefined') {
	                                 dataSet = raw.data;
	                             }
	                             return dataSet;
	                         },
	                     },
	                 },
	                 pageSize: 10,
	                 serverPaging: true,
	                 serverFiltering: true,
	                 serverSorting: true,
	             },
	            layout: {
	                 scroll: true,
	                 footer: false,
	             },
	            sortable: true,
	           pagination: false,
	             search: {
	                 input: $('#kt_datatable_search_query'),
	                 key: 'generalSearch'
	             },
	         columns: [{
	                 field: 'medicine_id',
	                 title: '#',
	                 sortable: 'asc',
	                 width: 30,
	                 type: 'number',
	                 selector: false,
	                 textAlign: 'center',
	             }, {
	                 field: 'medicine_name',
	                 title: 'Medicine Name',
	             }, {
	                 field: 'medicine_type',
	                 title: 'Medicine Type',
	                 
	             },{
	                 field: 'medicine_category',
	                 title: 'Medicine Category',
	                 
	             }, {
	                 field: 'Actions',
	                 title: ' Actions',
	                 sortable: false,
	                 width: 125,
	                 overflow: 'visible',
	                 autoHide: false,
	                 template: function(row) {
	                     return '\
	                         <a href="javascript:update('+row.medicine_id+');" class="btn_edit btn-sm btn-clean btn-icon mr-2" title="Edit details" id="edit">\
	                         <span class="svg-icon svg-icon-md svg-icon-2x">\
	                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">\
	                         <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">\
	                             <polygon points="0 0 24 0 24 24 0 24"/>\
	                             <rect fill="#000000" opacity="0.3" x="11" y="7" width="2" height="14" rx="1"/>\
	                             <path d="M6.70710678,20.7071068 C6.31658249,21.0976311 5.68341751,21.0976311 5.29289322,20.7071068 C4.90236893,20.3165825 4.90236893,19.6834175 5.29289322,19.2928932 L11.2928932,13.2928932 C11.6714722,12.9143143 12.2810586,12.9010687 12.6757246,13.2628459 L18.6757246,18.7628459 C19.0828436,19.1360383 19.1103465,19.7686056 18.7371541,20.1757246 C18.3639617,20.5828436 17.7313944,20.6103465 17.3242754,20.2371541 L12.0300757,15.3841378 L6.70710678,20.7071068 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000003, 16.999999) scale(1, -1) translate(-12.000003, -16.999999) "/>\
	                             <rect fill="#000000" opacity="0.3" x="3" y="3" width="18" height="2" rx="1"/>\
	                         </g>\
	                       </svg>\
	                     </span>\
	                         </a>\
	                        ';
	                 },
	             }],

	         });
	     };
				var demos = function() {
					// minimum setup
					
					
					$('#dob').datepicker({
						   rtl: KTUtil.isRTL(),
						   todayHighlight: true,
						   orientation: "bottom left",
							
							    format: 'dd/mm/yyyy'
							   
						  });
					
					
					 $('.repeater').repeater({
				               
				            show: function () {
				                $(this).slideDown();
				            },

				            hide: function (deleteElement) {                
				                $(this).slideUp(deleteElement);                 
				            }   
				        });
					 $('#advice_name').select2({
				         placeholder: "Select a Advice",
				      });
					  
					 $('#complaints_name').select2({
				         placeholder: "Select a Complaint",
				      }); 

					 var bloodhound = new Bloodhound({
		                  datumTokenizer: Bloodhound.tokenizers.whitespace,
		                  queryTokenizer: Bloodhound.tokenizers.whitespace,
		                  // `states` is an array of state names defined in "The Basics"
		                  local: pName
		              });

		              $('#patient_name').typeahead({
		                  hint: true,
		                  highlight: true,
		                  minLength: 1
		              }, {
		                  name: 'pName',
		                  source: bloodhound
		              });

				}

				return {
					// public functions
					init : function() {
						demos();
						
						demo2();
					}
				};
			}();

			jQuery(document).ready(function() {
				KTBootstrapDaterangepicker.init();
			});
	      
	      
	      $(".select2").css("width", "100%");
	      
	      
	      function getVisitedPrescription(visit_id){
	    	  $.ajax({
	  			url : base + "/dssAPI/dfapi/getPatientDetails",
	  			type : "post",
	  			dataType : "json",
	  			async : false,
	  			data : {
	  				"visit_id" : visit_id,
	  				"flag" : 1
	  				},
	  			success:function(data)
	  	        {
	  				if(data != null){
	  					data.forEach(function(e){
	  						pName.push(e.patient_name);
	  					})
	  				}  
	  	        }
	  			});
	      }
	  	 for(var i = 1; i <= 10; i++){
		 	  var html = '';
		 	  html += '<tr>';
		 	  html += '<td >' + i + '</td>';
		 	  html += '<td><input type="text" class="form-control Visit ID d-flex flex-column-fluid" name="visitId" id="visitId-' + i + '" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled>  </input></td>';
		 	  html += '<td><input type="text" class="form-control Visit Date d-flex flex-column-fluid" id="visitDate-' + i +'" name="visitDate" style="background-color:#FFFFFF; border:0px; width: 100px " disabled></input></td>';
		 	  html += '<td><input type="text" class="form-control Complaint d-flex flex-column-fluid" name="complaint" id="complaint-' + i + '" style="background-color:#FFFFFF; border:0px; width: 250px " disabled></input></td>';
		 	  html += '<td><textarea class="form-control Diagosis d-flex flex-column-fluid" name="diagnosis" id="diagnosis-' + i + '" style="background-color:#FFFFFF; border:0px; width: 400px; height:100px" disabled></textarea></td>';
		 	  html += '<td><a type="button"   onClick="nextPage(' + i + ')";  id="nextPage-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger"  style="border:0px; width:50px; " data-toggle="modal" data-target="#prescriptionHistory"><i class="la ki-arrow-next"></i></a></td></tr>';
		 	  $('.table_body').append(html);
		 	 function nextPage(i){
		 		 let visit_id = $('#visitId-'+i).val();
		 		 $.ajax({
				 		url : base + "/dssAPI/dfapi/getPatientHistory",
				 		type : "post",
				 		dataType : "json",
				 		async : false,
				 		data : {"visit_id": visit_id},
				 		success:function(data)
				 		{
				 			const row = data.find(d => d.visit_id == visit_id);
				 			$('#re_visit_days').append(row.re_visit).val;
				 			$('#visit_Id').append(row.visit_id).val;
				 			$('#date1').append(row.visit_date).val;
				 			$('#patient_code1').append(row.patient_code).val;
				 			$('#prescription_id').append(row.prescription_id).val;
				 			$('#cTbl')
				 					.append(
				 							'<tr class="font-weight-bolder h6"><td class="pt-7 px-5">'
				 									+ row.complaint_desc
				 									+ '</td><td class="pt-7">'
				 									+ row.diagnosis_desc
				 									+ '</td></tr>');
				 			 const parsedData = JSON.parse(row.prescription_desc);
				 	        parsedData.forEach(function(m, i) {
				 	        	if(m.is_special == 'Y')
				 	        		{
				 	        		$('#mTbl').append(
				 							'<tr class="font-weight-boldest h6 text-success"><td class="pt-7 px-5"><div>'
				 									+ m.type
				 									+ '</div></td><td class="pt-7">'
				 									+ m.medicineName
				 									+ '</div></td><td class="pt-7">'
				 									+ m.dose
				 									+ '</td><td class="pt-7">'
				 									+ m.time
				 									+ '</td><td class="pt-7">'
				 									+ m.qty
				 									+ '</td></tr>');
				 	        		}
				 	        	else{
				 			$('#mTbl').append(
				 										'<tr class="font-weight-boldest h6 text"><td class="pt-7 px-5"><div>'
				 												+ m.type
				 												+ '</div></td><td class="pt-7">'
				 												+ m.medicineName
				 												+ '</div></td><td class="pt-7">'
				 												+ m.dose
				 												+ '</td><td class="pt-7">'
				 												+ m.time
				 												+ '</td><td class="pt-7">'
				 												+ m.qty
				 												+ '</td></tr>');
				 	        	}
				 	        }); 
				 		}
				 	}); 
		 		  }
		 	 function clear_popUp(){
	 			 $('#visit_Id').empty().append("");
	 			$('#date1').empty().append("");
	 			$('#patient_code1').empty().append("");
	 			$('#prescription_id').empty().append("");
	 			$('#mTbl').empty().append("");
	 			$('#cTbl').empty().append("");
	 			 //$(".modal-body1").html("");
	 		 }
	  	 }
	  	 function clearPopUp(){  
	  		 for( var j=1;j<=10;j++)
	  			 {
	  			$('#visitId-' + j).val("");
				$('#visitDate-' + j).val("");
				$('#complaint-' + j).val("");
				$('#diagnosis-' + j).val("");
	  			 }
	  		 }
	  	 

	  	 
 $('#addMedicineMaster').click(function() {	  	 
	  	 
	  	
	  	 var med = [];

		$("table tbody tr").each(function(index) {
			
			if($(this).find('.medicineName').val() != null){
				
				var isSpecialValue =  $(this).find('.isSpecial').is(":checked");
				var isSpecial;
				if(isSpecialValue == true){
					isSpecial = "Y";
				}else{
					isSpecial = "N";
				}
				
				var isPrintableValue =  $(this).find('.Is_Printable').is(":checked");
		 		var isPrintable;
		 		if(isPrintableValue == true){
		 			isPrintable = "Y";
		 		}else{
		 			isPrintable = "N";
		 		}
						
		    med.push({ 
		        "medicineName": $(this).find('.medicineName').val(),
		        "type": $(this).find('.type').val(),
		        "category": $(this).find('.category').val(),
		        "dose": $(this).find('.dose').val(),
		        "time": $(this).find('.time').val(),
		        "qty": $(this).find('.qty').val(),
		        "remark": $(this).find('.remark').val(),
		        "is_printable": $(this).find('.isPrintable').val(),
		        "is_special": isSpecial,
		        "isPrintable":isPrintable
		    	});
			}
		});
		
		var jsonString = JSON.stringify(med);	  	 
		 var template_name = $('#template_name').val();
		 var template_code = $('#template_code').val();
		 var flag = 1;
		 alert(jsonString);
		 alert(template_name);
		 alert(template_code);
		 if(template_name != '' && template_code != ''){
			 	alert("from inside");
			 	var today = new Date();
			 	var dd = String(today.getDate()).padStart(2, '0');
			 	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			 	var yyyy = today.getFullYear();

			 	today = dd + '/' + mm + '/' + yyyy;
			 	
			 	$.ajax({
			 		url : base + "/dssAPI/dfapi/insertUpdateMedicineTemplate",
			 		type : "post",
			 		dataType : "json",
			 		async : false,
			 		data : {
			 			
			 			"template_name" : template_name,
			 			"template_code" : template_code,
			 			"template_desc" : jsonString,
			 			"created_by" 	: '1',
			 			"created_date" 	: today,
			 			"updated_by" 	: '1',
			 			"update_date" 	: today,
			 			"flag" : flag
			 		},
			 		error : function(xhr) {
			 			var msg = "(Data insertion/updation failed. Error : "
			 					+ xhr.status
			 					+ " "
			 					+ xhr.statusText;
			 			alert(msg);
			 		},
			 		success : function(response) {
			 			if (response != null) {

			 				if (response >= 1) {

			 					var msg = "Template Data inserted/Updated Successfully.";
			 					alert(msg);

			 				} 
			 			}
			 		}

			 	});
			 	
			 }
		 
		
		 
			 })
	  	 
			 
			 
			 
			 
			
			 	
			 	
			 	var html1 = "";
			 	$('#injectionHistory').click(function() {	  
					 let patient_code = $('#patient_code').val();
					 alert(patient_code);
			 		 var i=0;
			 		 $.ajax({
					 		url : base + "/dssAPI/dfapi/getPatientHistory",
					 		type : "post",
					 		dataType : "json",
					 		async : false,
					 		data : {"patient_code": patient_code},
					 		success:function(data)
					 		{
					 			const row = data.find(d => d.patient_code == patient_code);
					 			data.forEach((row)=> {
					 		
					 			if(row.patient_code == patient_code)
					 			{
					 				
					 			
					 			
					 			 const parsedData = JSON.parse(row.prescription_desc);
					 			
					 					 i++;
					 					
					 					 html1 +="<tr id= tr-id-2 class= tr-class-2>";
					 					 html1 +="<td class='text-center' >"+i+"</td>";
										 html1 += "<td class='text-center'>"+row.visit_id+"</td>"; 
										 html1 += "<td class='text-center'>"+row.visit_date+"</td><td class='text-center'>"; 
										 $(parsedData).each(function(index) {
											 
											 if(parsedData[index]['isPrintable'] == "N"){
											 html1 += parsedData[index]['medicineName']+"</br>";
											 }
											 });
									      html1 +="</td></tr>";
					 			    
					 			
					 			}
					 			});
					 			 $('.table_body_for_injection').append(html1);
					 		} 
     		 			});
			 		
		 	}); 
			 		
			 	
		  	
			
	  	 
	  	 
	  	 
</script>
</body>
</html>
<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>