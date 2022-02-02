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

<jsp:include page="../common/cssfiles.jsp"></jsp:include>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/jsfiles.jsp"></jsp:include>

<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>



<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-77.jpeg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div>
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


					<div class="d-flex flex-column-fluid ">
						<!--begin::Container-->
						<!-- <div class="container-fluid" > -->

						<!--begin::Card-->
						<div class="card card-custom offset-1">


							<!--begin: Datatable-->



							<!--begin::Subheader-->
							<!--end::Subheader-->
							<!--begin::Entry-->
							<div class="d-flex flex-column-fluid">

								<!--begin::Card-->
								<div class="card card-custom">
									<div class="card-header">
										<div class="card-title">
											<span class="card-icon"> <i
												class="flaticon2-layers text-primary"></i>
											</span>
											<h3 class="card-label">Patient Details Search</h3>
										</div>
										<div class="card-toolbar">
											<!--begin::Dropdown-->
											<div class="dropdown dropdown-inline mr-2">
												<button type="button"
													class="btn btn-light-primary font-weight-bolder dropdown-toggle"
													value="Create PDF" id="btPrint" onclick="createPDF()">
													<i class="la la-download"></i>Export

												</button>
												<!--begin::Dropdown Menu-->
												<div
													class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
													<ul class="nav flex-column nav-hover">
														<li
															class="nav-header font-weight-bolder text-uppercase text-primary pb-2">Choose
															an option:</li>
														<li class="nav-item"><a href="#" class="nav-link">
																<i class="nav-icon la la-print"></i> <span
																class="nav-text">Print</span>
														</a></li>
														<li class="nav-item"><a href="#" class="nav-link">
																<i class="nav-icon la la-copy"></i> <span
																class="nav-text">Copy</span>
														</a></li>
														<li class="nav-item"><a href="#" class="nav-link">
																<i class="nav-icon la la-file-excel-o"></i> <span
																class="nav-text">Excel</span>
														</a></li>
														<li class="nav-item"><a href="#" class="nav-link">
																<i class="nav-icon la la-file-text-o"></i> <span
																class="nav-text">CSV</span>
														</a></li>
														<li class="nav-item"><a href="#" class="nav-link">
																<i class="nav-icon la la-file-pdf-o"></i> <span
																class="nav-text">PDF</span>
														</a></li>
													</ul>
												</div>
												<!--end::Dropdown Menu-->
											</div>
											<!--end::Dropdown-->

										</div>
									</div>


									<div class="quick-search quick-search-inline ml-20 w-300px "
										id="kt_quick_search_inline">
										<!--begin::Form-->
										<form method="get" class="quick-search-form">
											<div class="input-group rounded bg-light">
												<div class="input-group-prepend">
													<span class="input-group-text"> <span
														class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/Search.svg-->
															<svg xmlns="http://www.w3.org/2000/svg"
																xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																height="24px" viewBox="0 0 24 24" version="1.1">
															<g stroke="none" stroke-width="1" fill="none"
																	fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24" />
																<path
																	d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
																	fill="#000000" fill-rule="nonzero" opacity="0.3" />
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
										<div id="kt_quick_search_toggle" data-toggle="dropdown"
											data-offset="0px,1px"></div>
										<!--end::Search Toggle-->
										<!--begin::Dropdown-->
										<div
											class="dropdown-menu dropdown-menu-left dropdown-menu-lg dropdown-menu-anim-up">
											<div class="quick-search-wrapper scroll" data-scroll="true"
												data-height="350" data-mobile-height="200"></div>
										</div>
										<!--end::Dropdown-->
									</div>
									<br />
									<div class="col-xl-12">
										<div class="card card-custom gutter-b">
											<div class="card-body" id="card_Report">
												<!--begin: Datatable-->
												<div
													class="datatable datatable-bordered datatable-head-custom"
													id="kt_datatable1"></div>
												<!--end: Datatable-->
											</div>
										</div>
									</div>

									<!--end::Container-->
								</div>
								<!--end::card-->
							</div>
							<!--end: card-->

							<!--end::Container-->
						</div>
						<!--end::Entry-->

						<!-- </div> -->
						<!--end::Content-->


					</div>
					<!--end::Wrapper-->
					<!--begin::Footer-->
					<jsp:include page="../common/footer.jsp"></jsp:include>
					<!--end::Footer-->
				</div>
				<!--end::Page-->
			</div>
			<!--end::Main-->

		</div>
	</div>





	<script type="text/javascript">
		var KTDatatableRemoteAjaxDemo = function() {
			// Private functions

			// basic demo
			var demo = function() {
				var medicineId = null;
				var datatable = $('#kt_datatable1').KTDatatable({
					// datasource definition
					data : {
						type : 'remote',
						source : {
							read : {
								url : base + "/dssAPI/dfapi/getReportDetails",
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

					pagination : false,

					search : {
						input : $('#kt_datatable_search_query'),
						key : 'generalSearch'
					},

					// columns definition
					columns : [ {
						field : 'visit_id',
						title : '#',
						sortable : 'asc',
						width : 30,
						type : 'number',
						selector : false,
						textAlign : 'center',
					}, {
						field : 'visit_date',
						title : 'Visit  Date',
					}, {
						field : 'patient_code',
						width : 60,
						title : 'Patient Code',

					}, {
						field : 'patient_name',
						title : 'Patient Name',

					}, {
						field : 'city_desc',
						title : 'City Desc',

					}, {
						field : 'age',
						title : 'Age',

					}, {
						field : 'mobile_no',
						title : 'Mobile No.',

					}, {
						field : 'gender',
						width : 60,
						title : 'Gender',

					}, {
						field : 'blood_group',
						width : 50,
						title : 'Blood Group',

					}, {
						field : 'complaint_desc',
						title : 'Complaint Desc',

					} ],

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

		$(document)
				.ready(
						function() {

							// Search all columns
							$('#txt_searchall')
									.keyup(
											function() {
												// Search Text
												var search = $(this).val();

												// Hide all table tbody rows
												$('table tbody tr').hide();

												// Count total search result
												var len = $('table tbody tr:not(.notfound) td:contains("'
														+ search + '")').length;

												if (len > 0) {
													// Searching text in columns and show match row
													$(
															'table tbody tr:not(.notfound) td:contains("'
																	+ search
																	+ '")')
															.each(
																	function() {
																		$(this)
																				.closest(
																						'tr')
																				.show();
																	});
												} else {
													$('.notfound').show();
												}

											});

						});
		$.expr[":"].contains = $.expr
				.createPseudo(function(arg) {
					return function(elem) {
						return $(elem).text().toUpperCase().indexOf(
								arg.toUpperCase()) >= 0;
					};
				});
		function createPDF() {
			var sTable = document.getElementById('card_Report').innerHTML;

			var style = "<style>";
			style = style + "table {width: 100%;font: 17px Calibri;}";
			style = style
					+ "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
			style = style + "padding: 2px 3px;text-align: center;}";
			style = style + "</style>";

			// CREATE A WINDOW OBJECT.

			var win = window.open('', '', 'height=960,width=1140');

			win.document.write('<html><head>');
			win.document.write('<title>Profile</title>'); // <title> FOR PDF HEADER.
			win.document.write(style); // ADD STYLE INSIDE THE HEAD TAG.
			win.document.write('</head>');
			win.document.write('<body>');
			win.document.write(sTable); // THE TABLE CONTENTS INSIDE THE BODY TAG.
			win.document.write('</body></html>');

			win.document.close(); // CLOSE THE CURRENT WINDOW.

			win.print(); // PRINT THE CONTENTS.
		}
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>


