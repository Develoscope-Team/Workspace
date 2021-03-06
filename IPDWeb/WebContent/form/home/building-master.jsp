
<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "IPD-OPD";
try {
%>
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
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
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/media/bg/bg-9.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">




	<div class="container">

		<h2 class="text-gray font-weight-bold my-2 mr-5">Building Master</h2>


		<div class="card card-custom gutter-b">
			<div class="card-body">
				<div class="example mb-10">
					<div class="example-preview">
						<div class="card card-custom">
							<form class="form" id="kt_form_1">
								<div class="card-body">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group">
												<label>Building Name :</label> <input type="text"
													id="building_name" class="form-control form-control-solid"
													placeholder="Enter Building Name" />
											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group">
												<label>Building Floors :</label> <input type="text"
													id="building_floors"
													class="form-control form-control-solid"
													placeholder="Enter Building Floors" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group">
												<label>Building Count :</label><input type="text"
													id="building_count" class="form-control form-control-solid"
													placeholder="Enter Building Count" />

											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group">
												<label>Wards :</label><span class="text-danger">*</span> <select
													class="form-control form-control-solid" name="wards"
													id="wards">
													<option value="" disabled selected hidden>Select
														Wards</option>
												</select>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xl-6">
											<div class="form-group">
												<label>Floors :</label><span class="text-danger">*</span> <select
													class="form-control form-control-solid" name="floors"
													id="floors">
													<option value="" disabled selected hidden>Select
														Floors</option>
												</select>
											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group">
												<label>Rooms :</label><span class="text-danger">*</span> <select
													class="form-control form-control-solid" name="rooms"
													id="rooms">
													<option value="" disabled selected hidden>Select
														Rooms</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group">
												<label>Operation Theater :</label><input type="text"
													id="operation_theater"
													class="form-control form-control-solid" />

											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group">
												<label>ICU :</label><input type="text" id="icu"
													class="form-control form-control-solid" />

											</div>
										</div>
									</div>


									<div class="text-center">
										<button type="button" id="addProduct"
											class="btn btn-primary mr-2"
											style="background-color: #AB48FF;">Submit</button>

										<button type="button" class="btn btn-primary mr-2"
											style="background-color: #AB48FF;" id="cancel">Cancel</button>
									</div>
								</div>
							</form>

							<!--end::Form-->
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="card card-custom gutter-b mt-10">
			<div class="card-body">
				<div class="input-icon ml-10" style="width: 30%;">
					<input type="text" class="form-control form-control-solid"
						placeholder="Search..." id="txt_searchall" /> <span> <i
						class="flaticon2-search-1 text-muted"></i>
					</span>
				</div>
				<br />
				<!--begin: datatable-->
				<table data-toggle="table" class='a'
					data-classes="table table-hover table-condensed "
					data-striped="true" data-sort-name="Quality" data-sort-order="desc"
					data-pagination="false" data-scroll="false" data-height=550
					id="table-id">
					<thead>
						<tr>
							<th class="col-sm-1 text-center" data-field="sr-no"
								data-sortable="true">Sr No</th>
							<th class="col-sm-2 text-center" data-field="building-name"
								data-sortable="true">Building Name</th>
							<th class="col-sm-2 text-center" data-field="building-floors"
								data-sortable="true">Building Floors</th>
							<th class="col-sm-2 text-center" data-field="building-count"
								data-sortable="true">Building Count</th>
							<th class="col-sm-2 text-center" data-field="wards"
								data-sortable="true">Wards</th>
							<th class="col-sm-2 text-center" data-field="floors"
								data-sortable="true">Floors</th>
							<th class="col-sm-2 text-center" data-field="rooms"
								data-sortable="true">Rooms</th>
							<th class="col-sm-2 text-center" data-field="operation-theater"
								data-sortable="true">Operation Theater</th>
							<th class="col-sm-2 text-center" data-field="icu"
								data-sortable="true">ICU</th>
							<th class="col-sm-2 text-center" data-field="action"
								data-sortable="true">Action</th>


						</tr>

					</thead>
					<tbody class="data">




					</tbody>
				</table>
				<!--end: datatable-->
			</div>
		</div>
	</div>


	<!--end::Container-->



	<div style="position: fixed; bottom: 0; width: 100%;" class="fixed">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<!--end::Page-->


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

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>




</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>


