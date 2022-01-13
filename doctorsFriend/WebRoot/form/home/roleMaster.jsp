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
style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-77.jpeg)"
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
							class="container d-flex align-items-stretch justify-content-between"">
							<div class="col-xl-12 offset-xl-1">

								<h2
									class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3"  >Role
									Master</h2>
								
									<div class="col-xl-10 offset-xl-0">
										<div class="example mb-10">
											<div class="example-preview">
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														<div class="card-body">
														
														<div class="col-xl-6 offset-xl-3">
															<div class="form-group">
																	<label>Role Id</label><span class="text-danger" id="type">*</span>
																	<input type="text" name="role" id="role"
																		class="form-control form-control-solid"
																		placeholder="Enter Role" required /> <span
																		class="msg text-danger" id="type1"> </span>
																</div>
																<div class="form-group">
																	<label>Role Description</label><span class="text-danger" id="type">*</span>
																	<input type="text" name="role_desc" id="role_desc"
																		class="form-control form-control-solid"
																		placeholder="Enter Description" required /> <span
																		class="msg text-danger" id="type1"> </span>
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
													<div class="alert alert-success  " role="alert"
								id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
													
													<!--end::Form-->
												</div>
											</div>
										</div>
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
	
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>

	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>
		';

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

		$('#addRole')
				.click(
						function() {

							var role_type = $('#role').val();
							var flag = 1; // Addition
							var letters = /^[A-Za-z() .]+$/;
							if (role != '' && role.match(letters)) {
								$
										.ajax({
											url : base
													+ "/dssAPI/dfapi/insertUpdateRole",
											type : "post",
											dataType : "json",
											async : false,
											data : {
												"role_type" : role_type,
												"flag" : flag
											},

											error : function(xhr) {
												var msg = "(Data insertion failed. Error : "
														+ xhr.status
														+ " "
														+ xhr.statusText;
												alert(msg);
											},
											success : function(response) {
												if (response != null) {

													if (response == 1) {

														var msg = "Role Data inserted Successfully.";
														alert(msg);

													}
												}
											}

										});
							}

						})

		"use strict";
		//Class definition

		var KTDatatableRemoteAjaxDemo = function() {
			// Private functions

			// basic demo
			var demo = function() {
				var districtId = null;
				var datatable = $('#kt_datatable')
						.KTDatatable(
								{
									// datasource definition
									data : {
										type : 'remote',
										source : {
											read : {
												url : base
														+ "/dssAPI/dfapi/getRoleDetails",
												// sample custom headers
												// headers: {'x-my-custom-header': 'some value', 'x-test-header': 'the value'},
												map : function(raw) {
													// sample data mapping
													var dataSet = raw;
													if (typeof raw.data !== 'undefined') {
														dataSet = raw.data;
													}
													return dataSet;
												},
											},
										},
										pageSize : 10,
										serverPaging : true,
										serverFiltering : true,
										serverSorting : true,
									},

									// layout definition
									layout : {
										scroll : true, // enable/disable datatable scroll both horizontal and vertical when needed.
										height : 550, // datatable's body's fixed height
										footer : false, // display/hide footer
									},

									// column sorting
									sortable : false,

									pagination : false,

									search : {
										input : $('#kt_datatable_search_query'),
										key : 'generalSearch'
									},

									// columns definition
									columns : [
											{
												field : 'role_id',
												title : '#',
												sortable : 'asc',
												width : 30,
												type : 'number',
												selector : false,
												textAlign : 'center',
											},
											{
												field : 'role_type',
												title : 'Role Name',
											},
											{
												field : 'Actions',
												title : 'Actions',
												sortable : false,
												width : 125,
												overflow : 'visible',
												autoHide : false,
												template : function(row) {
													return '\
								                        <a href="javascript:updateById('
															+ row.role_id
															+ ' , `'
															+ row.role_type
															+ '`);" class="btn_edit btn-sm btn-clean btn-icon mr-2" title="Edit details">\
								                            <span class="svg-icon svg-icon-md">\
								                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">\
								                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">\
								                                        <rect x="0" y="0" width="24" height="24"/>\
								                                        <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero"\ transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/>\
								                                        <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"/>\
								                                    </g>\
								                                </svg>\
								                            </span>\
								                        </a>\
								                        <a href="javascript:deleteById('
															+ row.role_id
															+ ');" class="btn_delete btn-sm btn-clean btn-icon" title="Delete">\
								                            <span class="svg-icon svg-icon-md">\
								                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">\
								                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">\
								                                        <rect x="0" y="0" width="24" height="24"/>\
								                                        <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"/>\
								                                        <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/>\
								                                    </g>\
								                                </svg>\
								                            </span>\
								                        </a>\
								                    ';
												},
											}

									],

								});

			};

			return {
				// public functions
				init : function() {
					demo();
				},
			};
		}();

		jQuery(document).ready(function() {
			KTDatatableRemoteAjaxDemo.init();
		});

		// Update data by district name and id
		function updateById(role_id, role_type) {

			$('#updateRole').show();
			$("#addRole").hide();
			$(".btn_edit").hide();
			$(".btn_delete").hide();
			var role_type = role_type;

			$("#role").val(role_type);

			$('#updateRole')
					.click(
							function() {

								var role_type = $('#role').val();

								if (role_type == '') {
									return false;
								}

								var flag = 2; // Addition

								if (role_type != '') {

									$
											.ajax({
												url : base
														+ "/dssAPI/dfapi/insertUpdateRole",
												type : "post",
												dataType : "json",
												async : false,
												data : {
													"role_id" : role_id,
													"role_type" : role_type,
													"flag" : flag
												},
												error : function(xhr) {
													var msg = "(Data Updation failed. Error : "
															+ xhr.status
															+ " "
															+ xhr.statusText;
													alert(msg);
												},
												success : function(response) {
													if (response != null) {

														if (response >= 1) {

															var msg = "Role Data Updated Successfully.";
															alert(msg);

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

			if (confirm("Press OK to confirm!")) {
				var role_id = id;
				var flag = 3;
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
						alert(msg);
					},
					success : function(response) {
						if (response != null) {

							if (response >= 1) {

								var msg = "Role Data deleted Successfully.";
								alert(msg);
								location.reload(true);

							}
						}
					}

				});
			} else {
				window.location.reload();
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