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
</style>
</head>
<!--end::Head-->
<!--begin::Body-->
<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;">
	<!--begin::Main-->
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
							<div class="col-xl-12 offset-xl-1">

								<h2	class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3 ml-4">
									B.P. and Diabetes Chart Show</h2>
								<div class="col-xl-10">
									<!-- <div class="card card-custom gutter-b">
										<div class="card-body"> -->
									<div class="example mb-10">
										<div class="example-preview">
											<div class="card card-custom">
												<form class="form" id="kt_form_1">
													<div class="card-body">
														<div class="row">
															<div class="form-group ml-1 col-lg-12">
																<label>Patient Name:</label> <input type="text"
																	class="form-control form-control-solid"
																	placeholder="Enter Patient Name"
																	class="form-control h-40px  " name="patient_name"
																	id="patient_name" />
															</div>
														</div>
														<div class="row ">
															<div class="col-xl-6">
																<div class="form-group">
																	<label>From Date</label> <input type="date"
																		class="form-control h-40px  " name="from_date"
																		class="form-control form-control-solid" id="from_date" />
																</div>
															</div>
															<div class="col-xl-6">
																<div class="form-group">
																	<label>To Date</label> <input type="date"
																		class="form-control h-40px  " name="till_date"
																		class="form-control form-control-solid" id="till_date" />
																</div>
															</div>
														</div>
													</div>
													<div class="card-footer text-center">
														<div class="row">
															<div class="col-lg-3"></div>
															<div class="col-lg-6">
																<button type="button" id="show" onclick="printP()"
																	class="btn font-weight-bold btn-primary mr-2 ">Show	Chart</button>
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
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--end::Footer-->
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script type="text/javascript">
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
		var today = new Date();
		var dd = today.getDate();
		if (dd < 10) {
			dd = '0' + dd;
		}
		var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
				+ dd;
		$('#from_date').val(date);
		$('#till_date').val(date);
		var order = 'asc';
		function printP() {
			var patient_name = $('#patient_name').val();
			var from_date = $('#from_date').val();
			var till_date = $('#till_date').val();
			if (from_date.length > 1 && till_date.length > 1) {
				var url = "bpsugarchart.jsp" + '?patient_name=' + patient_name
						+ '&from_date=' + from_date + '&till_date=' + till_date;
				window.location.assign(url);
			} else {
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








