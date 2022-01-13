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
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-9.jpg)">
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
									class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3 ml-4"  > Patient Wise Report
										</h2>
								
									<div class="col-xl-12 offset-xl-0">
										<div class="example mb-10">
											<div class="example-preview">
													<div class="card card-custom">
														<form method="get" class="form" id="kt_form_1">
															<div class="card-body">
																<div class="row">
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Patient Name</label><span class="text-danger">*</span>
																			<div class="typeahead">
																				<input type="text"
																					class="form-control form-control-solid form-control-lg"
																					name="patient_name" id="patient_name" /> <span
																					class="msg text-danger" id="type1"> </span>
																			</div>
																		</div>
																	</div>
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Patient Code</label> <input type="text"
																				class="form-control form-control-solid form-control-lg"
																				name="patient_code" id="patient_code" disabled />
																		</div>
																	</div>
																</div>
																<div class="row  ">
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Sorted By:</label> <select name="sort_by"
																				id="sort_by" class="form-control form-control-solid">
																				<option value="visit_id">Visit ID</option>
																				<option value="patient_code">patient code</option>
																				<option value="patient_name">patient name</option>
																				<option value="visit_date">visit date</option>
																				<option value="gender">gender</option>
																				<option value="city_desc">city</option>
																				<option value="age">Age</option>
																				<option value="blood_group">blood group</option>
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
				
				<!--end::Footer-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<!--end::Main-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>

	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	
	var date = new Date();
	var today = date.getDate() + '-' + (date.getMonth() + 1) + '-' + date.getFullYear();
	$('#from_date').val(today);
	
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
	
	var pcode=0;
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
					
						
						$('#patient_code').val(row.patient_code);
						$('#patient_code').addClass("text-muted");
						
						
					}else{
						$('#patient_code').val("");
					}
		        }
			});
	 });
	 
	 var order = 'asc';
		
		    function printP() {
		    	
		    	
		    	var patient_name = $('#patient_name').val();
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
		    	
			  var url ="patientReport.jsp" + '?patient_code=' + pcode  + '&patient_name=' + patient_name  + '&sort_by='  + sort_by + '&from_date=' + from_date + '&till_date=' + till_date + '&order=' + order;
           
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






