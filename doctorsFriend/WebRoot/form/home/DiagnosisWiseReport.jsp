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

<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading" 
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-7.jpg)">
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

						<div
							class="container d-flex align-items-stretch justify-content-between">
							<div class="col-xl-12 ">
				
					<h2
									class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3 ml-4"  > Diagnosis Wise Report
										</h2>
								
									<div class="col-xl-12 offset-xl-0">
										<div class="example mb-10">
											<div class="example-preview">
													<div class="card card-custom">
														<form class="form" id="kt_form_1">
															<div class="card-body">
																<div class="row">
																	<div class="form-group  col-xl-5">
																		<label>Diagnosis Name:</label> <select
																			name="diagnosis_name" id="diagnosis_name"
																			class="form-control form-control-solid form-control-lg">
																			<option value="" disabled selected hidden>Select
																				Diagnosis</option>
																		</select>
																	</div>
																	<div class="form-group  col-xl-5 ">
																		<!-- <label> Year:</label> -->
																		<span class="text-danger"></span> <select
																			class="form-control form-control-solid" name="year"
																			id="year" hidden>
																			<option value="2021">2021</option>
																			<option value="2020">2020</option>
																			<option value="2019">2019</option>
																			<option value="2018">2018</option>
																			<option value="2017">2017</option>
																			<option value="2016">2016</option>
																		</select>
																	</div>
																</div>
																<div class="row  ">
																	<div class="form-group col-xl-5">
																		<label>Sorted By:</label><span class="text-danger "></span>
																		<select class="form-control form-control-solid "
																			name="sort_by" id="sort_by">

																			<option value="diagnosis_desc">diagnosis
																				name</option>
																			<option value="patient_name">patient name</option>
																			<option value="visit_date">visit date</option>
																			<option value="age">Age</option>
																			<option value="gender">gender</option>
																			<option value="blood_group">blood group</option>
																			<option value="city_desc">city</option>
																		</select>
																	</div>
																	<div class="form-group row mt-6 col-lg-6">
																		<label class="col-form-label ml-5" id="ascending">Ascending</label>
																		<div class="col-3">
																			<span
																				class="switch switch-outline switch-icon switch-danger switch-sm ">
																				<label> <input type="checkbox" name="select"
																					id="order" /> <span></span>
																			</label> <label class="col-form-label ml-3" id="decending">Decending</label>
																			</span>
																		</div>
																	</div>
																</div>
																<div class="row ">
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>From Date</label> <input type="date"
																				class="form-control h-40px  " name="from_date"
																				id="from_date" />
																		</div>
																	</div>
																	<div class="col-xl-5">
																		<div class="form-group">

																			<label>To Date</label> <input type="date"
																				class="form-control h-40px  " name="till_date"
																				id="till_date" />
																		</div>
																	</div>
																</div>
															</div>
															<div class="card-footer text-center">
																<div class="row">
																	<div class="col-lg-3"></div>
																	<div class="col-lg-6">
																		<button type="button" id="show" onclick="printP()"
																			class="btn font-weight-bold btn-primary mr-2 ">Show
																			Report</button>
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
				
				<!--end::Footer-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--end::Main-->

	<jsp:include page="../common/jsfiles.jsp"></jsp:include>

	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
    
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
	var order = 'asc';
	
		function printP() {
			var diagnosis_desc = $('#diagnosis_name').val();
			var year = $('#year').val();
			var sort_by = $('#sort_by').val();
			if ($("#order").prop('checked')==true){ 
				 order = 'desc';
				
				 }else{
					
					 order = 'asc'
						
				 }
			
			var from_date = $('#from_date').val();
			var till_date = $('#till_date').val();

			 if(from_date.length > 1 && till_date.length > 1){
			var url = "DiagnosisReport.jsp" + '?diagnosis_desc=' + diagnosis_desc + '&order=' + order + '&sort_by=' + sort_by + '&from_date=' + from_date +  '&till_date=' + till_date;

			window.location.assign(url);
			
			 }
	            else{
	            	alert("Please select the Date Range");
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







