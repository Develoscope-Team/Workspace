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
<head>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
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

<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>



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
					<div class="d-flex flex-column-fluid offset-2">
						<!--begin::Container-->
						<div class="container-fluid ">
							<h2 class="text-left ">Patient Details Updation </h2>


							<div class="row">
								<div class="col-xl-10">
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
																		<label>Patient Name</label><span class="text-danger">*</span>
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
																		<label>Village/City</label> <select name="village"
																			id="village" class="form-control ">
																			<option value="" disabled selected hidden>Select
																				Village/City</option>
																		</select>
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Blood Group</label> <select name="bloodGroup"
																			id="blood_group"
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
																		<label>Age</label> <input type="number"
																			class="form-control  form-control-lg"
																			name="age" id="age" /> <span
																			class="msg text-danger" id="type2"> </span>
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
																			Update</button>

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

	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	
	/* $('#dob').datepicker({
		   rtl: KTUtil.isRTL(),
		   todayHighlight: true,
		   orientation: "bottom left",
			
			    format: 'dd/mm/yyyy'
			   
		  });
	 */
	var today = new Date();
	var dd=today.getDate();
	if(dd<10)
		 {
		 dd='0'+dd;
		 }
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+dd;
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
	
	
	
	$('#patient_name').change(function(){

		var patient_name = $(this).val();
		var patient_code = $('#patient_code').val();
	//	alert(patient_code);
		if(patient_code == "")	{
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
							var flag = 2; // Addition

							
							
					if(patient_code > 0){
						
					
							$.ajax({
								url : "http://localhost:8080/dssAPI/dfapi/insertUpdatePatientDetails",
								//url : base + "/dssAPI/dfapi/insertUpdatePatientDetails",
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
                                    "age" : age,
									"flag" : 2
								},
								
								error : function(xhr) {
									var msg = "Data insertion failed Error : "
											+ xhr.status
											+ " "
											+ xhr.statusText;
									alert(msg);
								},
								success : function(response) {
									if (response != null) {

										if (response >= 1) {

											var msg = "Patient Data Updated Successfully.";
											alert(msg);

										} 
									}
								}

							});
					}
					else{
						
						$.ajax({
							url : "http://localhost:8080/dssAPI/dfapi/insertUpdatePatientDetails",
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
                                "age" : age,
								"flag" : 1
							},
							
							error : function(xhr) {
								var msg = "Data insertion failed Error : "
										+ xhr.status
										+ " "
										+ xhr.statusText;
								alert(msg);
							},
							success : function(response) {
								if (response != null) {

									if (response >= 1) {

										var msg = "Patient Data Inserted Successfully.";
										alert(msg);

									} 
								}
							}

						});
						
						
						
						
						
					}
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








