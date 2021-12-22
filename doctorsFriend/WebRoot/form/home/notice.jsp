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

							<div class="card-header flex-wrap border-0 pt-6 pb-0">
								<div class="card-title offset-1">
									<h2
										class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Global
										Notice</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-10 offset-1">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form class="form" id="kt_form_1">

															<jsp:include page="../common/header.jsp"></jsp:include>
															<form class="form" id="kt_form_1">
																<div class=" col-lg-6 offset-lg-3 col-md-12 col-sm-12">
																	<div class="form-group" id="message"></div>
																	<div class="form-group">
																		<label>Notice Name</label><span class="text-danger">*</span>
																		<input type="text"
																			class="form-control form-control-solid"
																			name="notice_name" id="notice_name"
																			placeholder="Enter Notice Name" />

																	</div>
																	<div class="form-group">
																		<label>Notice Desc</label><span class="text-danger">*</span>
																		<input type="text"
																			class="form-control form-control-solid"
																			name="notice_desc" id="notice_desc"
																			placeholder="Enter Notice Name" /> </select>
																	</div>

																	<div class="form-group">
																		<label>From Date</label><span class="text-danger">*</span>
																		<input type="date"
																			class="form-control form-control-solid form-control-lg"
																			name="from_date" id="from_date" />
																	</div>

																	<div class="form-group">
																		<label>Till Date</label><span class="text-danger">*</span>
																		<input type="date"
																			class="form-control form-control-solid form-control-lg"
																			name="till_date" id="till_date" />
																	</div>
																</div>
																<div class="text-center">
																	<button type="submit" id="addNotice"
																		class="btn btn-primary mr-2">Submit</button>
																	<button type="submit" id="updateNotice"
																		class="btn btn-primary mr-2">Update</button>
																	<button type="reset" class="btn btn-secondary "
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
							</div>
							<div class="card-body">

								<!--begin: Datatable-->
								<div class="datatable datatable-bordered datatable-head-custom"
									id="kt_datatable"></div>
								<!--end: Datatable-->
							</div>
							</form>

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
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>

	<script type="text/javascript">


	var basePath='<%=basePath%>';    
	var base='<%=base%>';

		$('#updateNotice').hide();
		$("#addNotice").show();

		$('#addNotice')
				.click(
						function() {

							var notice_name = $('#notice_name').val();
							var notice_desc = $('#notice_desc').val();
							var from_date = $('#from_date').val();
							var till_date = $('#till_date').val();

							var flag = 1; // Addition

							if (notice_name != "" && notice_desc != "") {
								$.ajax({
											url : base + "/dssAPI/dfapi/insertUpdateNoticeDetails",
											type : "post",
											dataType : "json",
											async : false,
											data : {
												"notice_name" : notice_name,
												"notice_desc" : notice_desc,
												"from_date" : from_date,
												"till_date" : till_date,
												"flag" : flag

											},

											error : function(xhr) {
												var msg = "(Data insertion failed.Error : "
														+ xhr.status
														+ " "
														+ xhr.statusText;
												alert(msg);
											},
											success : function(response) {
												if (response != null) {

													if (response >= 1) {

														var msg = "Notice Data inserted Successfully.";
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
				var datatable = $('#kt_datatable')
						.KTDatatable(
								{
									// datasource definition
									data : {
										type : 'remote',
										source : {
											read : {
												url : base
														+ "/dssAPI/dfapi/getNoticeDetails",
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
										scroll : false,
										footer : false,
									},

									// column sorting
									sortable : false,

									pagination : true,

									search : {
										input : $('#kt_datatable_search_query'),
										key : 'generalSearch'
									},

									// columns definition
									columns : [
											{
												field : 'notice_id',
												title : '#',
												sortable : 'asc',
												width : 30,
												type : 'number',
												selector : false,
												textAlign : 'center',
											},
											{
												field : 'notice_name',
												title : 'Notice Name',
											},
											{
												field : 'notice_desc',
												title : 'Notice Desc',
											},
											{
												field : 'from_date',
												title : 'From Date',
											},
											{
												field : 'till_date',
												title : 'Till Date',
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
								                        <a href="javascript:deleteById('
															+ row.notice_id
															+ ');" class="btn-notice btn-sm btn-clean btn-icon" title="Delete">\
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

		// Update data by category name and id

		$('#cancel').click(function() {
			window.location.reload();
		})

		// Delete data by notice

		function deleteById(id) {
			if (confirm("Press OK to confirm!")) {

				var notice_id = id;
				var flag = 3;
				$.ajax({
					url : base + "/dssAPI/dfapi/insertUpdateNoticeDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						"notice_id" : notice_id,
						"notice_name" : "",
						"notice_desc" : "",
						"from_date" : "",
						"till_date" : "",
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

								var msg = "notice Data deleted Successfully.";
								alert(msg);
								location.reload(true);

							}
						}
					}

				});

			} else {
				location.reload(true);
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
<script type="text/javascript">