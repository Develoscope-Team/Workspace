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
							<h2 class="text-center mr-40">City Wise Report</h2>


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

																	<div class="form-group ml-1 col-lg-5">
																		<label>City Name:</label> <select name="village"
																			id="village" class="form-control form-control-solid">
																			<option value="" disabled selected hidden>Select
																				City</option>
																		</select>
																	</div>
																	<div class="col-xl-5">
																		<div class="form-group">
																			<!-- <label>Year:</label >  -->
																			<select name="year" id="year"
																				class="form-control form-control-solid" hidden>
																				<option value="2021">2021</option>

																			</select>
																		</div>
																	</div>

																</div>

																<div class="row  ">

																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Sorted By:</label> <select name="sort_by"
																				id="sort_by" class="form-control form-control-solid">
																				<option value="city_desc">city</option>

																				<option value="patient_name">patient name</option>
																				<option value="visit_date">visit date</option>
																				<option value="age">Age</option>
																				<option value="blood_group">blood group</option>
																				<option value="gender">gender</option>
																				<option value="diagnosis_desc">diagnosis
																					name</option>

																			</select>
																		</div>
																	</div>

																	<div class=" col-xl-5 form-group row mt-6 ml-1">
																		<label class="col-form-label " id="ascending">Ascending</label>
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
	
	var date = new Date();
	var today = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
	$('#from_date').val(today);
	$('#till_date').val(today);
	
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
		url : base + "/dssAPI/dfapi/getOpdYear",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
				
			        $('#year').append($(document.createElement('option')).prop({
		                value: element.opd_year,
		                text: element.opd_year
		            }))
				
			});   
        }
	});	
	
	var order = 'asc';
	
		    function printP() {
		    	var city_desc = $('#village').val();
		    	var sort_by = $('#sort_by').val();
		    	
		    	var year = $('#year').val();
		    	if ($("#order").prop('checked')==true){ 
					 order = 'desc';
					
					 }else{
						
						 order = 'asc'
					 }
		    	var from_date = $('#from_date').val();
		    	var till_date = $('#till_date').val();
		    	
		    	  if(from_date.length > 1 && till_date.length > 1){
		    		  
		    	  
				var url = "cityReport.jsp" + '?city_desc=' + city_desc  + '&order=' + order  + '&sort_by='  + sort_by +  '&from_date=' + from_date +  '&till_date=' + till_date;

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








