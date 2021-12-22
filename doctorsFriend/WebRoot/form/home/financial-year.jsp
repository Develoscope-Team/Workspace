<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String dbConnVar = "BAFNA";
	try {
%>

<!DOCTYPE html>

<html lang="en">
<!--begin::Head-->
<head>
<base href="">
<meta charset="utf-8" />
<title>Doctors Friend</title>
<meta name="description" content="Updates and statistics" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="canonical" href="https://keenthemes.com/metronic" />
<!--begin::Fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<!--end::Fonts-->
<!--begin::Page Vendors Styles(used by this page)-->
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/custom/fullcalendar/fullcalendar.bundle.css"
	rel="stylesheet" type="text/css" />
<!--end::Page Vendors Styles-->
<!--begin::Global Theme Styles(used by all pages)-->
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/global/plugins.bundle.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/custom/prismjs/prismjs.bundle.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/css/style.bundle.css"
	rel="stylesheet" type="text/css" />
<!--end::Global Theme Styles-->
<!--begin::Layout Themes(used by all pages)-->
<!--end::Layout Themes-->
<link rel="shortcut icon" href="assets/Bafana_OPD/media/logos/favicon.ico" />
</head>
<!--end::Head-->

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
								class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Financial
								Year</h2>

							<div class="row">
								<div class="col-xl-6">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form class="form" id="kt_form_1">
															<div class="card-body">
																<div class="form-group">
																	<label>Financial Year</label>
																	<div class="input-group" id="kt_daterangepicker">
																		<input type="text" class="form-control" readonly
																			name="financialYear"
																			placeholder="Select date range" />
																		<div class="input-group-append">
																			<span class="input-group-text"><i
																				class="la la-calendar-check-o"></i></span>
																		</div>
																	</div>
																</div>
															</div>
															<div class="text-center">
																<button type="submit" class="btn btn-primary mr-2">Submit</button>
																<button type="reset" class="btn btn-secondary">Cancel</button>
															</div>
														</form>
														<!--end::Form-->
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<table class="table table-bordered mb-6">
												<thead>
													<tr>
														<th scope="col">#</th>
														<th scope="col">Year</th>
														<th scope="col">Action</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row">1</th>
														<td>2021/05/14 / 2021/06/17</td>
														<td><span><a href="#"
																class="label btn label-inline label-light-success font-weight-bold">Edit</a></span>
															<span><a href="#"
																class="label btn label-inline label-light-danger font-weight-bold">Delete</a></span>
														</td>
													</tr>
												</tbody>
											</table>
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


	<script>
		var KTAppSettings = {
			"breakpoints" : {
				"sm" : 576,
				"md" : 768,
				"lg" : 992,
				"xl" : 1200,
				"xxl" : 1200
			},
			"colors" : {
				"theme" : {
					"base" : {
						"white" : "#ffffff",
						"primary" : "#6993FF",
						"secondary" : "#E5EAEE",
						"success" : "#1BC5BD",
						"info" : "#8950FC",
						"warning" : "#FFA800",
						"danger" : "#F64E60",
						"light" : "#F3F6F9",
						"dark" : "#212121"
					},
					"light" : {
						"white" : "#ffffff",
						"primary" : "#E1E9FF",
						"secondary" : "#ECF0F3",
						"success" : "#C9F7F5",
						"info" : "#EEE5FF",
						"warning" : "#FFF4DE",
						"danger" : "#FFE2E5",
						"light" : "#F3F6F9",
						"dark" : "#D6D6E0"
					},
					"inverse" : {
						"white" : "#ffffff",
						"primary" : "#ffffff",
						"secondary" : "#212121",
						"success" : "#ffffff",
						"info" : "#ffffff",
						"warning" : "#ffffff",
						"danger" : "#ffffff",
						"light" : "#464E5F",
						"dark" : "#ffffff"
					}
				},
				"gray" : {
					"gray-100" : "#F3F6F9",
					"gray-200" : "#ECF0F3",
					"gray-300" : "#E5EAEE",
					"gray-400" : "#D6D6E0",
					"gray-500" : "#B5B5C3",
					"gray-600" : "#80808F",
					"gray-700" : "#464E5F",
					"gray-800" : "#1B283F",
					"gray-900" : "#212121"
				}
			},
			"font-family" : "Poppins"
		};
	</script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/global/plugins.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/custom/prismjs/prismjs.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/scripts.bundle.js"></script>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/crud/forms/validation/form-widgets.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>


</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>



