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
style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
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
								<h2	class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3"  >Role Master</h2>
									<div class="col-xl-10 offset-xl-0">
										<div class="example mb-10">
											<div class="example-preview">
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														<div class="card-body">
														<div class="row">
															<div class="form-group col-6">
																	<label>Role Id</label><span class="text-danger" id="type">*</span>
																	<input type="text" name="role" id="role"
																		class="form-control form-control-solid"
																		placeholder="Enter Role" required /> <span
																		class="msg text-danger" id="type1"> </span>
																</div>
																<div class="form-group col-6">
																	<label>Role Description</label><span class="text-danger" id="type">*</span>
																	<input type="text" name="role_desc" id="role_desc"
																		class="form-control form-control-solid"
																		placeholder="Enter Description" required /> <span
																		class="msg text-danger" id="type1"> </span>
																</div>
															</div>
															
															<div class="row mt-2">
															<div class="col-3">
														
															</div>
															<div class="col-5"></div>
															<div class="col-3 ml-10 mb-5">
															<label style="font-size:14px" class="checkbox checkbox-outline font-weight-bold">
															<input type="checkbox"  name="Checkboxes3" id="all_checkbox"/>
															<span></span>Select All </label>
															</div>
															</div>
															
															
															<div class="row mt-2  ">
															<div class="col-3">
															<label class="font-weight-bold" style="font-size:14px;">Masters :</label>
															</div>
															<div class="col-5"></div>
															<div class="col-3 ml-10 ">
															<label class="checkbox checkbox-outline ">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_all"/>
															<span></span>Select All</label>
															</div>
															</div>
															
															<div class="row pt-3 pl-3 pr-3 pb-3 " style="border:1px solid black">
															<div class="col-3 ml-10">
														    <div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_1"/>
															<span></span>Role Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_2"/>
															<span></span>User Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" name="Checkboxes3" id="master_checkbox_3"/>
															<span></span>Medicine Category</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_4"/>
															<span></span>Medicine Type</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_5"/>
															<span></span>Medicine Master</label>
														</div>
														</div>
														<div class="col-1">
														</div>
														<div class="col-3">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" name="Checkboxes3" id="master_checkbox_6"/>
															<span></span>Template Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_7"/>
															<span></span>Diagnosis Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_8"/>
															<span></span>Complaint Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_9"/>
															<span></span>Company Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_10"/>
															<span></span>Advice Master</label>
														</div>
														</div>
														<div class="col-1">
														</div>
														
														<div class="col-3">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_11"/>
															<span></span>District Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_12"/>
															<span></span>Qualification Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_13"/>
															<span></span>Remark Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_14"/>
															<span></span>UPI Master</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="master_checkbox_15"/>
															<span></span>City Master</label>
														</div>
														</div>
														</div>
														<br />
														<div class="row mt-2">
															<div class="col-3">
															<label  class="font-weight-bold" style="font-size:14px;">Transaction Screen :</label>
															</div>
															<div class="col-5"></div>
															<div class="col-3 ml-10">
															<label class="checkbox checkbox-outline">
															<input type="checkbox"  name="Checkboxes3" id="transaction_screen_checkbox"/>
															<span></span>Select All</label>
															</div>
															</div>
															
														
														<div class="row pt-3 pl-3 pr-3 pb-3" style="border:1px solid black">
															<div class="col-3 ml-10">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_1" name="Checkboxes3" />
															<span></span>New Patient Entry</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_2" name="Checkboxes3" />
															<span></span>Fees Collection</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_3"name="Checkboxes3" />
															<span></span>Prescription Print</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_4" name="Checkboxes3" />
															<span></span>Fee Receipt Printing</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_5" name="Checkboxes3" />
															<span></span>MR Entry</label>
														</div>
														</div>
														
														<div class="col-1">
														</div>
														<div class="col-3">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_6" name="Checkboxes3" />
															<span></span>Purchase Entry</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_7" name="Checkboxes3" />
															<span></span>Certificate</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_8" name="Checkboxes3" />
															<span></span>Update Patient Details</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_9" name="Checkboxes3" />
															<span></span>Notice</label>
														</div>
														</div>
														
														<div class="col-1">
														</div>
														<div class="col-3">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_10" name="Checkboxes3" />
															<span></span>Purchase Entry</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_11" name="Checkboxes3" />
															<span></span>Certificate</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_12" name="Checkboxes3" />
															<span></span>Update Patient Details</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="transaction_screen_checkbox_13" name="Checkboxes3" />
															<span></span>Notice</label>
														</div>
														</div>
														
														</div>
														<br />
														
														<div class="row mt-2">
															<div class="col-3">
															<label  class="font-weight-bold" style="font-size:14px;">Reports :</label>
															</div>
															<div class="col-5"></div>
															<div class="col-3 ml-10">
															<label class="checkbox text-left checkbox-outline">
															<input type="checkbox" id="Reports_checkbox" name="Checkboxes3" />
															<span></span>Select All</label>
															</div>
															</div>
															
														
														<div class="row pt-3 pl-3 pr-3 pb-3" style="border:1px solid black">
															<div class="col-3 ml-10">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="Reports_checkbox_1" name="Checkboxes3" />
															<span></span>Patient Reports</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="Reports_checkbox_2" name="Checkboxes3" />
															<span></span>City Report</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="Reports_checkbox_3" name="Checkboxes3" />
															<span></span>Diagnosis Report</label>
														</div>
														</div>
														
														<div class="col-1">
														</div>
														<div class="col-3">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="Reports_checkbox_4" name="Checkboxes3" />
															<span></span>City Wise Patient Count</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="Reports_checkbox_5" name="Checkboxes3" />
															<span></span>Fees Collection</label>
														</div>
														</div>
														
														<div class="col-1">
														</div>
														<div class="col-3">
 														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="Reports_checkbox_6" name="Checkboxes3" />
															<span></span>Medical Representative</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="Reports_checkbox_7" name="Checkboxes3" />
															<span></span>Income & Expenses</label>
														</div>
														</div>
														</div>
														<br />
														
														<div class="row mt-2">
															<div class="col-3">
															<label  class="font-weight-bold" style="font-size:14px;">Charts :</label>
															</div>
															<div class="col-5"></div>
															<div class="col-3 ml-10">
															<label class="checkbox text-left checkbox-outline">
															<input type="checkbox" id="charts_checkbox" name="Checkboxes3" />
															<span></span>Select All</label>
															</div>
															</div>
															
														<div class="row pt-3 pl-3 pr-3 pb-3" style="border:1px solid black">
															<div class="col-3 ml-10">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="charts_checkbox_1" name="Checkboxes3" />
															<span></span>Temp Chart</label>
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="charts_checkbox_2" name="Checkboxes3" />
															<span></span>Temp Chart(.pdf)</label>
														</div>
														</div>
														
														<div class="col-1">
														</div>
														<div class="col-3">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="charts_checkbox_3" name="Checkboxes3" />
															<span></span>BP & Sugar Chart</label>
														</div>
														</div>
														
														<div class="col-1">
														</div>
														<div class="col-3">
														<div class="checkbox-inline">
															<label class="checkbox checkbox-outline">
															<input type="checkbox" id="charts_checkbox_4" name="Checkboxes3" />
															<span></span>BP & Sugar Chart (.pdf)</label>
															
														</div>
														</div>
														</div>
														
												
														</div>
														<div class="text-center">
																<button type="submit" id="addRole"
																	class="btn btn-primary mr-2">Submit</button>
																<button type="submit" id="updateRole"
																	class="btn btn-primary mr-2">Update</button>
																<button type="button" class="btn btn-secondary"
																	id="cancel">Cancel</button>
															</div>
													</form>
													<!--end::Form-->
												</div>
											</div>
										</div>
									</div>
									<div class="col-xl-10 offset-xl-0">
									<div class="example mb-10">
										<div class="example-preview">
											<div class="card card-custom ">
												<br />
												<div class="input-icon ml-10" style="width: 30%;">
													<input type="text" class="form-control form-control-solid"
														placeholder="Search..." id="txt_searchall" /> <span>
														<i class="flaticon2-search-1 text-muted"></i>
													</span>
												</div>
												<br />
												<table data-toggle="table" class='a'
													data-classes="table table-hover table-condensed "
													data-striped="true" data-sort-name="Quality"
													data-sort-order="desc" data-pagination="false"
													data-scroll="false" data-height=350 id="table-id">
													<thead>
														<tr>
															<th class="col-sm-1 text-center" data-field="NO"
																data-sortable="true">No</th>
															<th class="col-sm-2 text-center" data-field="user_name"
																data-sortable="true">Role Type</th>
															<th class="col-sm-2 text-center" data-field="Action"
																data-sortable="true">Action</th>
														</tr>
													</thead>
													<tbody class="data">
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="alert alert-success" role="alert" id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
							<div class="alert alert-danger" role="alert" id="danger_alert">
								<div class="alert-text">
									<span id="danger_msg"></span>
								</div>
							</div>
							<div class="alert alert-warning" role="alert" id="warning_alert">
								<div class="alert-text">
									<span id="warning_msg"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
               <jsp:include page="../common/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
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
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>
	<script type="text/javascript">
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
		$('#updateRole').hide();
		$("#addRole").show();
		$("#role").change(function() {
			var text = $("#role").val();
			var letters = /^[A-Za-z() .]+$/;
			if (text.match(letters)) {
				$('.msg').text('');
				return true;
			} else {
				$('.msg').text('Please Enter Letters Only.');
				$("#role").val("");
				return false;
			}
		});
		
		$('#all_checkbox').click(function(){
			var master_checkbox =  $('#all_checkbox').is(':checked');
			if(master_checkbox == true)
				{
				$('#master_checkbox_all').prop("checked", true);
				$('#transaction_screen_checkbox').prop("checked", true);
				$('#Reports_checkbox').prop("checked", true);
				$('#charts_checkbox').prop("checked", true);
			for(var i=1 ; i < 15 ; i++)
				{
				  $("#master_checkbox_"+i).prop("checked", true);
				  $("#transaction_screen_checkbox_"+i).prop("checked", true);
				  $("#Reports_checkbox_"+i).prop("checked", true);
				  $("#charts_checkbox_"+i).prop("checked", true);
				}
				}
			else{
				$('#master_checkbox_all').prop("checked", false);
				$('#transaction_screen_checkbox').prop("checked", false);
				$('#Reports_checkbox').prop("checked", false);
				$('#charts_checkbox').prop("checked", false);
				for(var i=1 ; i < 15 ; i++)
				{
				  $("#master_checkbox_"+i).prop("checked", false);
				  $("#transaction_screen_checkbox_"+i).prop("checked", false);
				  $("#Reports_checkbox_"+i).prop("checked", false);
				  $("#charts_checkbox_"+i).prop("checked", false);
				}
			}
		});
		$('#master_checkbox_all').click(function(){
			var master_checkbox =  $('#master_checkbox_all').is(':checked');
			if(master_checkbox == true)
				{
			for(var i=1 ; i < 15 ; i++)
				{
				  $("#master_checkbox_"+i).prop("checked", true);
				}
				}
			else{
				for(var i=1 ; i < 15 ; i++)
				{
					 $("#master_checkbox_"+i).prop("checked", false);
					 
				}
			}
		});
		
		$('#transaction_screen_checkbox').click(function(){
			var master_checkbox =  $('#transaction_screen_checkbox').is(':checked');
			if(master_checkbox == true)
				{
			for(var i=1 ; i < 14; i++)
				{
				  $("#transaction_screen_checkbox_"+i).prop("checked", true);
				}
				}
			else{
				for(var i=1 ; i < 14 ; i++)
				{
				  $("#transaction_screen_checkbox_"+i).prop("checked", false);
				}
			}
		});
		
		$('#Reports_checkbox').click(function(){
			var master_checkbox =  $('#Reports_checkbox').is(':checked');
			if(master_checkbox == true)
				{
			for(var i=1 ; i < 10 ; i++)
				{
				  $("#Reports_checkbox_"+i).prop("checked", true);
				}
				}
			else{
				for(var i=1 ; i < 10 ; i++)
				{
				  $("#Reports_checkbox_"+i).prop("checked", false);
				}
			}
		});
		
		$('#charts_checkbox').click(function(){
			var master_checkbox =  $('#charts_checkbox').is(':checked');
			if(master_checkbox == true)
				{
			for(var i=1 ; i < 5 ; i++)
				{
				  $("#charts_checkbox_"+i).prop("checked", true);
				}
				}
			else{
				for(var i=1 ; i < 5 ; i++)
				{
				  $("#charts_checkbox_"+i).prop("checked", false);
				}
			}
		});
		
	var permission = [];	
$('#addRole').click(function() {
						
	var role_type = $('#role').val();
							var flag = 1; // Addition
							for(var i=1 ; i < 16 ; i++)
							{
								var master_checkbox = $("#master_checkbox_"+i).is(':checked');
								if(master_checkbox == true){
									permission.push("Y");
								}else{
									permission.push("N");
								}
							}
							for(var i=1 ; i < 14 ; i++)
							{
								var master_checkbox = $("#transaction_screen_checkbox_"+i).is(':checked');
								if(master_checkbox == true){
									permission.push("Y");
								}else{
									permission.push("N");
								}
							}
							for(var i=1 ; i < 8 ; i++)
							{
								var master_checkbox = $("#Reports_checkbox_"+i).is(':checked');
								if(master_checkbox == true){
									permission.push("Y");
								}else{
									permission.push("N");
								}
							}
							for(var i=1 ; i < 5 ; i++)
							{
								var master_checkbox = $("#charts_checkbox_"+i).is(':checked');
								if(master_checkbox == true){
									permission.push("Y");
								}else{
									permission.push("N");
								}
							}
							 var str = '';
							function objToString(object) {
								  for (var k in object) {
								    if (object.hasOwnProperty(k)) {
								      str +=   object[k] + ',' ;
								    }
								  }
								}
								objToString(permission);
							var letters = /^[A-Za-z() .]+$/;
							if (role_type != '' && role_type.match(letters)) {
								
								$.ajax({
											url : base + "/dssAPI/dfapi/insertUpdateRole",
											type : "post",
											dataType : "json",
											async : false,
											data : {
												"role_type" : role_type,
												"role_permission" : str,
												"flag" : flag
											},
											error : function(xhr) {
												var msg = "(Data insertion failed. Error : "
														+ xhr.status
														+ " "
														+ xhr.statusText;
												alert(msg);
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
													alert("Data Insertion Failed..!");
													if (response == 1) {
														var msg = "Role Data inserted Successfully.";
														alert(msg);
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
						})
"use strict";
var role_id;
var html = "";
$.ajax({
	url : base + "/dssAPI/dfapi/getRoleDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"role_id": role_id},
	success:function(data)
	{
		const row = data.find(d => d.role_id == role_id);
		data.forEach((row)=> {
			html +="<tr id= tr-id-2 class= tr-class-2>"
			html += "<td>"+row.role_id+"</td>"; 
	        html += "<td>"+row.role_type+"</td>";
     	    html += '<td><a href="javascript:updateById('+row.role_id+');" class="btn_action btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="12" height="2" rx="1"/></g></svg></span>'
     	       	+ '<a href="javascript:deleteById('+row.role_id+');" class="btn_action btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
	        html +="</tr>"
		});
		 $(".data").html(html);
	}
});	
var updated_permission = [];
// Update data by district name and id
		function updateById(role_id) {
			$('#updateRole').show();
			$("#addRole").hide();
			$(".btn_action").hide();
		$.ajax({
		     type:"POST",
		     dataType: "json",
		     data:{"role_id": role_id},
			 async : false,
		     url: base +  "/dssAPI/dfapi/getRoleDetails",
		     success:function(data)
		     {
		     const row = data.find(d => d.role_id ==role_id);
		     $("#role").val(row.role_type);
			 var role_permission = row.role_permission;
			 alert(role_permission);
			const myArray = role_permission.split(",");
			if(myArray[0] == "Y"){
				$("#master_checkbox_1").prop("checked", true);	
				}
			if(myArray[1] == "Y"){
				$("#master_checkbox_2").prop("checked", true);	
				}
			if(myArray[2] == "Y"){
				$("#master_checkbox_3").prop("checked", true);		
				}
			if(myArray[3] == "Y"){
				$("#master_checkbox_4").prop("checked", true);	
				}
			if(myArray[4] == "Y"){
				$("#master_checkbox_5").prop("checked", true);	
				}
			if(myArray[5] == "Y"){
				$("#master_checkbox_6").prop("checked", true);	
				}
			if(myArray[6] == "Y"){
				$("#master_checkbox_7").prop("checked", true);	
				}
			if(myArray[7] == "Y"){
				$("#master_checkbox_8").prop("checked", true);	
				}
			if(myArray[8] == "Y"){
				$("#master_checkbox_9").prop("checked", true);	
				}
			if(myArray[9] == "Y"){
				$("#master_checkbox_10").prop("checked", true);	
				}
			if(myArray[10] == "Y"){
				$("#master_checkbox_11").prop("checked", true);	
				}
			if(myArray[11] == "Y"){
				$("#master_checkbox_12").prop("checked", true);	
				}
			if(myArray[12] == "Y"){
				$("#master_checkbox_13").prop("checked", true);	
				}
			if(myArray[13] == "Y"){
				$("#master_checkbox_14").prop("checked", true);	
				}
			if(myArray[14] == "Y"){
				$("#master_checkbox_15").prop("checked", true);	
				}
			//Transaction Screen
			if(myArray[15] == "Y"){
				$("#transaction_screen_checkbox_1").prop("checked", true);
				}
			if(myArray[16] == "Y"){
				$("#transaction_screen_checkbox_2").prop("checked", true);
				}
			if(myArray[17] == "Y"){
				$("#transaction_screen_checkbox_3").prop("checked", true);
				}
			if(myArray[18] == "Y"){
				$("#transaction_screen_checkbox_4").prop("checked", true);
				}
			if(myArray[19] == "Y"){
				$("#transaction_screen_checkbox_5").prop("checked", true);
				}
			if(myArray[20] == "Y"){
				$("#transaction_screen_checkbox_6").prop("checked", true);
				}
			if(myArray[21] == "Y"){
				$("#transaction_screen_checkbox_7").prop("checked", true);
				}
			if(myArray[22] == "Y"){
				$("#transaction_screen_checkbox_8").prop("checked", true);
				}
			if(myArray[23] == "Y"){
				$("#transaction_screen_checkbox_9").prop("checked", true);
				}
			if(myArray[24] == "Y"){
				$("#transaction_screen_checkbox_10").prop("checked", true);
				}
			if(myArray[25] == "Y"){
				$("#transaction_screen_checkbox_11").prop("checked", true);
				}
			if(myArray[26] == "Y"){
				$("#transaction_screen_checkbox_12").prop("checked", true);
				}
			if(myArray[27] == "Y"){
				$("#transaction_screen_checkbox_13").prop("checked", true);
				}
			
			//report
			if(myArray[28] == "Y"){
				$("#Reports_checkbox_1").prop("checked", true);	
				}
			if(myArray[29] == "Y"){
				$("#Reports_checkbox_2").prop("checked", true);	
				}
			if(myArray[30] == "Y"){
				$("#Reports_checkbox_3").prop("checked", true);		
				}
			if(myArray[31] == "Y"){
				$("#Reports_checkbox_4").prop("checked", true);		
				}
			if(myArray[32] == "Y"){
				$("#Reports_checkbox_5").prop("checked", true);		
				}
			if(myArray[33] == "Y"){
				$("#Reports_checkbox_6").prop("checked", true);	
				}
			if(myArray[34] == "Y"){
				$("#Reports_checkbox_7").prop("checked", true);		
				}
			
			
			//charts
			if(myArray[35] == "Y"){
				$("#charts_checkbox_1").prop("checked", true);		
				}
			if(myArray[36] == "Y"){
				$("#charts_checkbox_2").prop("checked", true);	
				}
			if(myArray[37] == "Y"){
				$("#charts_checkbox_3").prop("checked", true);	
				}
			if(myArray[38] == "Y"){
				$("#charts_checkbox_4").prop("checked", true);	
				}
			
		            
		        }
		     });
			
			$('#updateRole').click(function() {
								var role_type = $('#role').val();
								if (role_type == '') {
									return false;
								}
								for(var i=1 ; i < 16 ; i++)
								{
									var master_checkbox = $("#master_checkbox_"+i).is(':checked');
									if(master_checkbox == true){
										updated_permission.push("Y");
									}else{
										updated_permission.push("N");
									}
								}
								for(var i=1 ; i < 14 ; i++)
								{
									var master_checkbox = $("#transaction_screen_checkbox_"+i).is(':checked');
									if(master_checkbox == true){
										updated_permission.push("Y");
									}else{
										updated_permission.push("N");
									}
								}
								for(var i=1 ; i < 8 ; i++)
								{
									var master_checkbox = $("#Reports_checkbox_"+i).is(':checked');
									if(master_checkbox == true){
										updated_permission.push("Y");
									}else{
										updated_permission.push("N");
									}
								}
								for(var i=1 ; i < 5 ; i++)
								{
									var master_checkbox = $("#charts_checkbox_"+i).is(':checked');
									if(master_checkbox == true){
										updated_permission.push("Y");
									}else{
										updated_permission.push("N");
									}
								}
								 var str = '';
								function objToString(object) {
									  for (var k in object) {
									    if (object.hasOwnProperty(k)) {
									      str +=   object[k] + ',' ;
									    }
									  }
									}
									objToString(updated_permission);
							//	alert(str);
								var flag = 2; // Addition
								if (role_type != '') {
									$.ajax({
												url : base	+ "/dssAPI/dfapi/insertUpdateRole",
												type : "post",
												dataType : "json",
												async : false,
												data : {
													"role_id" : role_id,
													"role_type" : role_type,
													"role_permission" : str,
													"flag" : flag
												},
												error : function(xhr) {
													var msg = "(Data Updation failed. Error : "
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
															var msg = "Role Data Updated Successfully.";
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
							})
			"use strict";
		}
		$('#cancel').click(function() {
			window.location.reload();
		})
		// Delete data by role_id
		function deleteById(id) {
			Swal.fire({
		        title: "Are you sure?",
		        text: "You want to Delete Data!",
		        icon: "warning",
		        showCancelButton: true,
		        confirmButtonText: "Yes, delete it!",
		        cancelButtonText: "No, cancel!",
		        reverseButtons: true
		    }).then(function(result) {
		        if (result.value) {
		        	$.ajax({
						url : base + "/dssAPI/dfapi/insertUpdateRole",
						type : "post",
						dataType : "json",
						async : false,
						data : {
							"role_type" : "0",
							"role_id" : role_id,
							"flag" : flag
						},
						error : function(xhr) {
							var msg = "(Data deletion failed. Error : "
									+ xhr.status + " " + xhr.statusText;
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

									var msg = "Role Data deleted Successfully.";
									$('#danger_msg').text(msg);
									 $('#danger_alert').addClass("show");
							           $('#danger_alert').removeClass("hide");
							           $('#danger_alert').addClass("showAlert");
							           setTimeout(function(){
							             $('#danger_alert').removeClass("show");
							             $('#danger_alert').addClass("hide");
							           },2000);
									location.reload(true);
								}
							}
						}
					});
		        } else if (result.dismiss === "cancel") {
		            window.location.reload();
		        }
		    });
		}
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>