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
.alert {
	z-index: 9999;
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
@keyframes show_slide { 0%{
	transform: translateX(100%);
}
40
%
{
transform:translateX(-10%);
}
80%
{
transform:translateX(0%);
}
100%{transform:translateX(-10px);
}
}
@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}40%
{
transform:translateX(0%);
}
80%{transform:translateX(-10%);
}
100%{transform:translateX(100%);
}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
</head>
<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;">
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
			<div class="d-flex flex-column flex-row-fluid wrapper"	id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/header.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container d-flex align-items-stretch justify-content-between">
							<div class="col-xl-12 offset-xl-1">
								<h2	class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3 ml-4">Patient Appointment Booking</h2>
								<div class="col-xl-10 offset-xl-0">
									<div class="example mb-10">
										<div class="example-preview">
											<!--end::Header-->
											<!--begin::Content-->
											<div class="row">
												<div class="col-xl-12">
													<div class="card card-custom gutter-b">
														<div class="card-body">
															<div class="example mb-10">
																<div class="example-preview">
																	<div class="card card-custom">
																		<form class="form" id="kt_form_1">
																			<div class="card-body">
																				<div class="row">
																					<div class="col-xl-6">
																						<div class="form-group">
																							<label>Patient Name</label><span
																								class="text-danger">*</span>
																							<div class="typeahead">
																								<input type="text"
																									class="form-control  form-control-lg"
																									name="patientName" id="patient_name" /> <span
																									class="msg text-danger" id="type1"> </span>
																							</div>
																						</div>
																					</div>
																					<div class="col-xl-6">
																						<div class="form-group">
																							<label>Patient Code</label> <input type="text"
																								class="form-control  form-control-lg"
																								name="patient_code" id="patient_code" disabled />
																						</div>
																					</div>
																				</div>
																				<div class="row ">
																					<div class="col-xl-6">
																						<div class="form-group">
																							<label>Mobile No</label> <input type="number"
																								class="form-control  form-control-lg"
																								name="mobileNo" id="mobile_no" /> <span
																								class="msg text-danger" id="type2"> </span>
																						</div>
																					</div>
																					<div class="col-xl-6">
																						<div class="form-group">
																							<label>Date of Birth </label> <input type="date"
																								class="form-control  form-control-lg"
																								placeholder="DD/MM/YYYY" name="dob" id="dob" />
																						</div>
																					</div>
																				</div>
																				<div class="row">
																					<div class="col-xl-6">
																						<div class="form-group">
																							<label>Village/City</label> <select
																								name="village" id="village"
																								class="form-control ">
																								<option value="" disabled selected hidden>Select
																									Village/City</option>
																							</select>
																						</div>
																					</div>
																					<div class="col-xl-6">
																						<div class="form-group">
																							<label>Blood Group</label> <select
																								name="bloodGroup" id="blood_group"
																								class="form-control ">
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
																								id="gender" class="form-control ">
																								<option value="" disabled selected hidden>Select
																									Gender</option>
																								<option value="male">Male</option>
																								<option value="female">Female</option>
																								<option value="other">Other</option>
																							</select>
																						</div>
																					</div>
																					<div class="col-xl-6">
																	                   <div class="form-group">
																		                  <label>Age</label> <input type="input"
																			                     class="form-control  form-control-lg"
																			                         name="age" id="age" /> <span
																			                            class="msg text-danger" id="type2"> </span>
																	                           </div>
																                       </div>
																				</div>
																				<div class="row">
																					<div class="col-xl-12">
																						<div class="form-group">
																							<label>Complaints</label> <select name="complaints"
																								id="complaints" class="form-control" >
																								<option value="" disabled selected hidden>Select
																									Complaints</option>
																							</select>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="card-footer text-center">
																				<div class="row">
																					<div class="col-lg-3"></div>
																					<div class="col-lg-6">
																						<button type="button" id="show"
																							class="btn font-weight-bold btn-primary mr-2 ">
																							Appointment Booking</button>
																					</div>
																				</div>
																			</div>
																		</form>
																		<!--end::Form-->
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
                      <div class="alert alert-success  " role="alert"
								id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
							<div class="alert alert-danger " role="alert" id="danger_alert">
								<div class="alert-text">
									<span id="danger_msg"></span>
								</div>
							</div>
							<div class="alert alert-warning " role="alert" id="warning_alert">
								<div class="alert-text">
									<span id="warning_msg"></span>
								</div>
							</div>
										</div>
										<!--end::Container-->
									</div>
									<!--end::Entry-->
								</div>
								<!--end::Content-->
							</div>
							<!--end::Wrapper-->
						</div>
						<!--end::Page-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end::Main-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script type="text/javascript">
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	var today = new Date();
	var dd=today.getDate();
	if(dd<10)
		 {
		 dd='0'+dd;
		 }
	var mm=today.getMonth()+1;
	if(mm<10)
	 {
	 mm='0'+mm;
	 }
	var date = today.getFullYear()+'-'+mm+'-'+dd;
	$('#from_date').val(date);
	$('#till_date').val(date);
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
         $.ajax({
     		url : base + "/dssAPI/dfapi/getComplaints",
     		type : "post",
     		dataType : "json",
     		async : false,
     		data : {"flag":1},
     		success:function(data)
             {
     			data.forEach((element)=> {
     			        $('#complaints').append($(document.createElement('option')).prop({
     		                value: element.complaint_name,
     		                text: element.complaint_name
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
	$('#patient_code').val("00");
	$('#patient_name').change(function(){
	var value_code =  $('#patient_code').val();
		if(value_code == 00 )
		{
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
					$('#age').val(row.age);
					$('#dob').val(row.birth_date);
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
					$('#patient_code').val("00");
				}
	        }
		});		
		}
	})
	$('#show').click(function() {
							var patient_name = $('#patient_name').val();
							var patient_code = $('#patient_code').val();
							var mobile_no = $('#mobile_no').val();
							var date_of_birth = $('#dob').val();
							var village = $('#village').val();
							var blood_group = $('#blood_group').val();
							var gender = $('#gender').val();
							var age = $('#age').val();
							var complaints = $('#complaints').val();
							var flag = 2; // Addition
				 if(patient_code > 0){
							$.ajax({
								url : base + "/dssAPI/dfapi/insertUpdatePatientDetails",
								type : "post",
								dataType : "json",
								async : false,
								data : {
									"patient_name" : patient_name,
                                    "patient_code" : patient_code,
                                    "birth_date" : date_of_birth,
                                    "mobile_no" : mobile_no,
                                    "city_desc" : village,
                                    "blood_group" : blood_group,
                                    "gender" : gender,
                                    "age": age,
									"flag" : 2
								},
								error : function(xhr) {
									var msg = "Data insertion failed Error : "
											+ xhr.status
											+ " "
											+ xhr.statusText;
									$('#warning_msg').text(msg);
									 $('#warning_alert').addClass("show");
							           $('#warning_alert').removeClass("hide");
							           $('#warning_alert').addClass("showAlert");
							           setTimeout(function(){
							             $('#warning_alert').removeClass("show");
							             $('#warning_alert').addClass("hide");
							           },2000);
								},
								success : function(response) {
									if (response != null) {
										if (response >= 1) {
											var msg = "Patient Data Updated Successfully.";
											$('#success_msg').text(msg);
											 $('#success_alert').addClass("show");
									           $('#success_alert').removeClass("hide");
									           $('#success_alert').addClass("showAlert");
									           setTimeout(function(){
									             $('#success_alert').removeClass("show");
									             $('#success_alert').addClass("hide");
									           },2000);
										} 
									}
								}
							});
					}
					else{
						$.ajax({
							url : base + "/dssAPI/dfapi/insertUpdatePatientDetails",
							type : "post",
							dataType : "json",
							async : false,
							data : {
								"patient_name" : patient_name,
                                "patient_code" : patient_code,
                                "birth_date" : date_of_birth,
                                "mobile_no" : mobile_no,
                                "city_desc" : village,
                                "blood_group" : blood_group,
                                "gender" : gender,
                                "age": age,
								"flag" : 1
							},
							error : function(xhr) {
								var msg = "Data insertion failed Error : "
										+ xhr.status
										+ " "
										+ xhr.statusText;
								$('#warning_msg').text(msg);
								 $('#warning_alert').addClass("show");
						           $('#warning_alert').removeClass("hide");
						           $('#warning_alert').addClass("showAlert");
						           setTimeout(function(){
						             $('#warning_alert').removeClass("show");
						             $('#warning_alert').addClass("hide");
						           },2000);
							},
							success : function(response) {
								if (response != null) {
									if (response >= 1) {
										var msg = "Patient Data Inserted Successfully.";
										$('#success_msg').text(msg);
										 $('#success_alert').addClass("show");
								           $('#success_alert').removeClass("hide");
								           $('#success_alert').addClass("showAlert");
								           setTimeout(function(){
								             $('#success_alert').removeClass("show");
								             $('#success_alert').addClass("hide");
								           },2000);
									} 
								}
							}
						});
						}
				var patient
					$.ajax({
						url : base + "/dssAPI/dfapi/getPatientDetails",
						type : "post",
						dataType : "json",
						async : false,
						data : {
							"flag" : 1
						},
						success : function(data) {
							if (data != null) {
								data.forEach(function(e) {
									if(e.patient_name == patient_name)
									{
										alert(e.patient_code);
									}
								});
							}
						}
					});	
					 $.ajax({
						url :base + "/dssAPI/dfapi/insertUpdateAppointmentBooking",
						type : "post",
						dataType : "json",
						async : false,
						data : {
							"patient_name" : patient_name,
                            "patient_code" : patient_code,
                            "mobile_no" : mobile_no,
                            "city" : village,
                            "gender" : gender,
                            "age": age,
                            "complaint" : complaints,
                            "appointment_date" : date ,
                            "status" : 1,
							"flag" : 1
						},
						error : function(xhr) {
							var msg = "Data insertion failed Error : "
									+ xhr.status
									+ " "
									+ xhr.statusText;
							$('#warning_msg').text(msg);
							 $('#warning_alert').addClass("show");
					           $('#warning_alert').removeClass("hide");
					           $('#warning_alert').addClass("showAlert");
					           setTimeout(function(){
					             $('#warning_alert').removeClass("show");
					             $('#warning_alert').addClass("hide");
					           },2000);
						},
						success : function(response) {
							if (response != null) {

								if (response >= 1) {

									var msg = "Appointment Booking Successfully.";
									$('#success_msg').text(msg);
									 $('#success_alert').addClass("show");
							           $('#success_alert').removeClass("hide");
							           $('#success_alert').addClass("showAlert");
							           setTimeout(function(){
							             $('#success_alert').removeClass("show");
							             $('#success_alert').addClass("hide");
							           },2000);
								} 
							}
						}
					});
					window.location.reload();
						})
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>








