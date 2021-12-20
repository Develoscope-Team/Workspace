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
<link href="//www.amcharts.com/lib/3/plugins/export/export.css"
	rel="stylesheet" type="text/css" />
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

							<div class="row">
								<div class="col-xl-8">
									<!--begin::Nav Panel Widget 1-->
									<div
										class="card card-custom gutter-b card-stretch card-shadowless">
										<!--begin::Body-->
										<div class="card-body p-0">
											<!--begin::Nav Tabs-->
											<ul
												class="dashboard-tabs nav nav-pills nav-danger row row-paddingless m-0 p-0 flex-column flex-sm-row"
												role="tablist">
												<!--begin::Item-->
												<li
													class="nav-item d-flex col-sm flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0">
													<a
													class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
													data-toggle="pill" href="#tab_forms_widget_1"> <span
														class="nav-text font-size-lg py-2 font-weight-bold text-center"
														id="patient_count"></span> <span
														class="nav-icon py-2 w-auto"> <span
															class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:assets/media/svg/icons/Home/Library.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24" />
																			<path
																		d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
																		fill="#000000" fill-rule="nonzero" opacity="0.3" />
																			<path
																		d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
																		fill="#000000" fill-rule="nonzero" />
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>
													</span> <span
														class="nav-text font-size-lg py-2 font-weight-bold text-center">Patient
															Count</span>
												</a>
												</li>
												<!--end::Item-->
												<!--begin::Item-->
												<li
													class="nav-item d-flex col-sm flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0">
													<a
													class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
													data-toggle="pill" href="#tab_forms_widget_2"> <span
														class="nav-text font-size-lg py-2 font-weight-bold text-center"
														id="regular_patient"></span> <span
														class="nav-icon py-2 w-auto"> <span
															class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24" />
																			<path
																		d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
																		fill="#000000" fill-rule="nonzero" opacity="0.3" />
																			<path
																		d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
																		fill="#000000" fill-rule="nonzero" />
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>
													</span> <span
														class="nav-text font-size-lg py-2 font-weight-bolder text-center">Regular
															Patient</span>
												</a>
												</li>
												<!--end::Item-->
												<!--begin::Item-->
												<li
													class="nav-item d-flex col-sm flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0">
													<a
													class="nav-link active border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
													data-toggle="pill" href="#tab_forms_widget_3"> <span
														class="nav-text font-size-lg py-2 font-weight-bold text-center"
														id="new_reg"></span> <span class="nav-icon py-2 w-auto">
															<span class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:assets/media/svg/icons/Media/Movie-Lane2.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24" />
																			<path
																		d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
																		fill="#000000" fill-rule="nonzero" opacity="0.3" />
																			<path
																		d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
																		fill="#000000" fill-rule="nonzero" />
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>
													</span> <span
														class="nav-text font-size-lg py-2 font-weight-bolder text-center">New
															Registrations</span>
												</a>
												</li>
												<!--end::Item-->
												<!--begin::Item-->
												<li
													class="nav-item d-flex col-sm flex-grow-1 flex-shrink-0 mr-3 mb-3 mb-lg-0">
													<a
													class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
													data-toggle="pill" href="#tab_forms_widget_5"> <span
														class="nav-text font-size-lg py-2 font-weight-bold text-center"
														id="todays_collection"></span> <span
														class="nav-icon py-2 w-auto"> <span
															class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/Shield-check.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24" />
																			<path
																		d="M4,4 L11.6314229,2.5691082 C11.8750185,2.52343403 12.1249815,2.52343403 12.3685771,2.5691082 L20,4 L20,13.2830094 C20,16.2173861 18.4883464,18.9447835 16,20.5 L12.5299989,22.6687507 C12.2057287,22.8714196 11.7942713,22.8714196 11.4700011,22.6687507 L8,20.5 C5.51165358,18.9447835 4,16.2173861 4,13.2830094 L4,4 Z"
																		fill="#000000" opacity="0.3" />
																			<path
																		d="M11.1750002,14.75 C10.9354169,14.75 10.6958335,14.6541667 10.5041669,14.4625 L8.58750019,12.5458333 C8.20416686,12.1625 8.20416686,11.5875 8.58750019,11.2041667 C8.97083352,10.8208333 9.59375019,10.8208333 9.92916686,11.2041667 L11.1750002,12.45 L14.3375002,9.2875 C14.7208335,8.90416667 15.2958335,8.90416667 15.6791669,9.2875 C16.0625002,9.67083333 16.0625002,10.2458333 15.6791669,10.6291667 L11.8458335,14.4625 C11.6541669,14.6541667 11.4145835,14.75 11.1750002,14.75 Z"
																		fill="#000000" />
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>
													</span> <span
														class="nav-text font-size-lg py-2 font-weight-bolder text-center">Today's
															Collection</span>
												</a>
												</li>
												<!--end::Item-->
												<!--begin::Item-->
												<li
													class="nav-item d-flex col-sm flex-grow-1 flex-shrink-0 mr-0 mb-3 mb-lg-0">
													<a
													class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
													data-toggle="pill" href="#tab_forms_widget_5"> <span
														class="nav-text font-size-lg py-2 font-weight-bold text-center"
														id="visit_count"></span> <span
														class="nav-icon py-2 w-auto"> <span
															class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Group.svg-->
																<svg xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
																	height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24" />
																			<path
																		d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
																		fill="#000000" fill-rule="nonzero" opacity="0.3" />
																			<path
																		d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
																		fill="#000000" fill-rule="nonzero" />
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>
													</span> <span
														class="nav-text font-size-lg py-2 font-weight-bolder text-center">Visit
															Count</span>
												</a>
												</li>
												<!--end::Item-->
											</ul>
											<!--end::Nav Tabs-->
											<!--begin::Nav Content-->
											<div class="tab-content m-0 p-0">
												<div class="tab-pane active" id="forms_widget_tab_1"
													role="tabpanel"></div>
												<div class="tab-pane" id="forms_widget_tab_2"
													role="tabpanel"></div>
												<div class="tab-pane" id="forms_widget_tab_3"
													role="tabpanel"></div>
												<div class="tab-pane" id="forms_widget_tab_4"
													role="tabpanel"></div>
												<div class="tab-pane" id="forms_widget_tab_6"
													role="tabpanel"></div>
											</div>
											<!--end::Nav Content-->
										</div>
										<!--end::Body-->
									</div>
									<!--begin::Nav Panel Widget 1-->
								</div>
								<div class="col-xl-4">
									<!--begin::Engage Widget 8-->
									<div
										class="card card-custom gutter-b card-stretch card-shadowless">
										<div class="card-body p-0 d-flex">
											<div
												class="d-flex align-items-start justify-content-start flex-grow-1 bg-light-warning p-8 card-rounded flex-grow-1 position-relative">
												<div
													class="d-flex flex-column align-items-start flex-grow-1 h-100">
													<div class="p-1 flex-grow-1">
														<h4 class="text-warning font-weight-bolder">Quick
															Access</h4>
															 <h6 class="font-weight-bold">
															<a href="form-wizard.jsp">New Patient Entry</a>
														</h6>
														<h6 class="font-weight-bold">
															<a href="prescriptionPrint.jsp">Prescription Print</a>
														</h6>
														<h6 class="font-weight-bold ">
															<a href="fee_module.jsp">Fees Collection</a>
														</h6>
														<h6 class="font-weight-bold">
															<a href="feesReceiptPrinting.jsp">Fees Receipt
																Printing</a>
														</h6>
														<h6 class="font-weight-bold ">
															<a href="certificate-parameter.jsp">Certificates</a>
														</h6>
														
                                                        
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--end::Engage Widget 8-->
								</div>
							</div>
							<!--end::Row-->
							<!--begin::Row-->
							<div class="row">
								<div class="col-xl-8">
									<!--begin::Charts Widget 2-->
									<div
										class="card card-custom bg-gray-100 gutter-b card-stretch card-shadowless">
										<!-- 	begin::Header -->

										<div class="card-header h-auto border-0">
											<!-- begin::Title -->
											<div class="card-title py-5">
												<h3 class="card-label">
													<span class="d-block text-dark font-weight-bolder">Patients
														Visited</span>
												</h3>
											</div>
											<!-- 	end::Title -->
										</div>
										<!-- end::Header -->

										<!-- begin::Body -->
										<div class="card-body">
											<!-- begin::Chart -->
											<div id="chart_2"></div>
											<!-- end::Chart -->
										</div>
										<!-- end::Body -->
									</div>

								</div>
								<div class="col-xl-4">
									<!--begin::List Widget 2-->
									<div
										class="card card-custom bg-light-success gutter-b card-stretch card-shadowless">
										<!--begin::Header-->
										<div class="card-header border-0">
											<h3 class="card-title font-weight-bolder text-success">Patients
												Visited Today</h3>
										</div>
										<!--end::Header-->
										<!--begin::Body-->
										<div class="card-body pt-2" id="p_list"></div>
										<!--end::Body-->
									</div>
									<!--end::List Widget 2-->
								</div>
							</div>


						</div>
						<!--end::Container-->
					</div>
					<!--end::Entry-->
				</div>

			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<!--end::Main-->

	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script src="//www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="//www.amcharts.com/lib/3/serial.js"></script>
	<script src="//www.amcharts.com/lib/3/radar.js"></script>
	<script src="//www.amcharts.com/lib/3/pie.js"></script>
	<script
		src="//www.amcharts.com/lib/3/plugins/tools/polarScatter/polarScatter.min.js"></script>
	<script src="//www.amcharts.com/lib/3/plugins/animate/animate.min.js"></script>
	<script src="//www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<script src="//www.amcharts.com/lib/3/themes/light.js"></script>
	
</body>
</html>


<
<script type="text/javascript">

var basePath='<%=basePath%>';    
var base='<%=base%>';

	$.ajax({
		url : base + "/dssAPI/dfapi/getStatsCounts",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			var row = data[0];
			if (row != null) {

				$('#patient_count').text(row.patient_count);
				$('#regular_patient').text(row.regular_patient_count);
				$('#new_reg').text(row.new_reg_count);
				if (row.daily_collection != null) {
					$('#todays_collection').text(row.daily_collection + ' RS');
				} else {
					$('#todays_collection').text('0');
				}
				$('#visit_count').text(row.visit_count);
			}
		}
	});

	$('#forms_widget_tab_3').click(function() {
     
		var url = "form-wizard.jsp";
		window.location.assign(url);	
	})
	
	
	
	$
			.ajax({
				url : base + "/dssAPI/dfapi/getTodayVisitedPatient",
				type : "post",
				dataType : "json",
				async : false,
				data : {
					"flag" : 1
				},
				success : function(data) {
					if (data != null) {

						data
								.forEach(function(e) {
									$('#p_list')
											.append(
													'<div class="d-flex align-items-center mb-10"><div class="d-flex flex-column font-weight-bold"><a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">'
															+ e.patient_name
															+ '</a><span class="text-muted">'
															+ e.city
															+ '</span></div></div>')
								});
					}
				}
			});

	var visit_count;

	var dashboard_month = [];
	var dashboard_months_sale = [];
	var month_count = 0;
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getMonthWiseSaleReportForGraph",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			if (data != null) {
				data.forEach(function(e) {
					month_count++;
					//month_sale_sum += parseInt(e.monthly_sum);
					dashboard_month.push(e.production_to_month);
					dashboard_months_sale.push(e.monthly_sum);

				})
			}
		}
	});
	
	alert(dashboard_month);
	alert(dashboard_months_sale);
	
	
	/* 
	$.ajax({
		url : base + "/dssAPI/dfapi/getVisitCount",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			if (data != null) {
				visit_count = data;
			}
		}
	}); */

	for (var i = 0; i < dashboard_months_sale.length; i++) {
		if (dashboard_months_sale.length < 12) {
			dashboard_months_sale.push(0);
		}
	}

	console.log(visit_count)

	var KTApexChartsDemo = function() {

		var demos = function() {
			const apexChart = "#chart_2";
			var options = {
				series : [ {
					name : 'Month Sale',
					data : dashboard_months_sale
				}, {
					name : 'Month Purchase',
					data : dashboard_months_sale
				}  , {
								name: 'Free Cash Flow',
								data: dashboard_months_sale
							} ],
				chart : {
					type : 'bar',
					height : 350
				},
				plotOptions : {
					bar : {
						horizontal : false,
						columnWidth : '100%',
						endingShape : 'rounded'
					},
				},
				dataLabels : {
					enabled : false
				},
				stroke : {
					show : true,
					width : 2,
					colors : [ 'transparent' ]
				},
				xaxis : {
					categories : ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sep','Oct','Nov','Dec']/* dashboard_month */,
				},
				yaxis : {
					title : {
						
					}
				},
				fill : {
					opacity : 1
				},
				tooltip : {
					y : {
						formatter : function(val) {
							return "$ " + val + " thousands"
						}
					}
				},
			/* colors: [success, warning]  */
			};

			var chart = new ApexCharts(document.querySelector(apexChart),
					options);
			chart.render();
		}


		return {
			// public functions
			init : function() {
				demos();
			}
		};
	}();

	jQuery(document).ready(function() {
		KTApexChartsDemo.init();
	});
</script>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>