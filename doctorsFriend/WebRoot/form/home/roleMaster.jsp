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

							<h2
								class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Role
								Master</h2>

							<div class="row">
								<div class="col-xl-7">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form class="form" id="kt_form_1">
															<div class="card-body">
																<div class="form-group">
																	<label>Role</label><span class="text-danger" id="type">*</span>
																	<input type="text" name="role" id="role"
																		class="form-control form-control-solid"
																		placeholder="Enter Role" required /> <span
																		class="msg text-danger" id="type1"> </span>
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
									</div>
								</div>
								<div class="col-xl-5">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<!--begin: Datatable-->
											<div
												class="datatable datatable-bordered datatable-head-custom"
												id="kt_datatable"></div>
											<!--end: Datatable-->
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



