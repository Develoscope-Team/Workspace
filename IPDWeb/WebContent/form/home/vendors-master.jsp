
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

	
	

	<div
		class="container">
		
				<h2 class="text-gray font-weight-bold my-2 mr-5">Vendors Master</h2>
				
		

		
				<div class="card card-custom gutter-b">
					<div class="card-body">
						<div class="example mb-10">
							
								<div class="card card-custom">
									<form class="form" id="kt_form_1">
										<div class="card-body">
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor Name</label> <input type="text"
															id="vendor_name" class="form-control form-control-solid"
															placeholder="Enter Vendor Name" />
													</div>
												</div>
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor Bank Name</label> <input type="text"
															id="vendor_bank_name" class="form-control form-control-solid"
															placeholder="Enter Vendor Bank Name" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor Email</label><input type="text"
															id="vendor_email" class="form-control form-control-solid"
															placeholder="Enter Vendor Email" />

													</div>
												</div>
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor Account Holder Name</label><input type="text"
															id="vendor_account_holder_name" class="form-control form-control-solid"
															placeholder="Enter Vendor Account Holder Name" />

													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor Mobile No</label><input type="text"
															id="vendor_mobile_no"
															class="form-control form-control-solid" 
															placeholder="Enter Vendor Mobile No" />

													</div>
												</div>
												<div class="form-group col-xl-6">
													<label>Vendor Account No</label><input type="text"
														id="vendor_account_no" class="form-control form-control-solid"
														placeholder="Enter Vendor Account No" />

												</div>
											</div>
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor Adhar No</label><input type="text"
															id="vendor_adhar_no"
															class="form-control form-control-solid" placeholder="Enter Vendor Adhar No"/>

													</div>
												</div>
												<div class="col-xl-6">
													<div class="form-group">
														<label>IFSC Code</label><input type="text"
															id="ifsc_code"
															class="form-control form-control-solid" 
															placeholder="Enter IFSC Code"/>

													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor Address</label>
														<textarea id="vendor_address"
															class="form-control form-control-solid" rows="1"></textarea>
													</div>
												</div>
												<div class="form-group col-xl-6">
													<label>Branch Name</label><input type="text"
														id="branch_name" class="form-control form-control-solid"
														placeholder="Enter Branch Name" />

												</div>
											</div>
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Vendor GST No</label><input type="text"
															id="vendor_gst_no"
															class="form-control form-control-solid" placeholder="Enter Vendor Gst No"/>

													</div>
												</div>
												<div class="form-group col-xl-6">
													<label>City</label><input type="text"
														id="city" class="form-control form-control-solid"
														placeholder="Enter City" />

												</div>
												
											</div>
											
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>District</label><input type="text"
															id="district"
															class="form-control form-control-solid" placeholder="Enter District"/>

													</div>
												</div>
												
											</div>







											




										</div>
										<div class="text-center">
											<button type="button" id="addProduct"
												class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Submit</button>

											<button type="button" class="btn btn-primary mr-2" style="background-color: #AB48FF; " id="cancel">Cancel</button>
										</div>
									</form>
									<!--end::Form-->
								</div>
							
						</div>
					</div>
				</div>

								<div class="card card-custom gutter-b">
									<div class="card-body">
										<div class="input-icon ml-10" style="width: 30%;">
											<input type="text" class="form-control form-control-solid"
												placeholder="Search..." id="txt_searchall" /> <span>
												<i class="flaticon2-search-1 text-muted"></i>
											</span>
										</div>
										<br />
										<!--begin: datatable-->
										<table data-toggle="table" class='a'
											data-classes="table table-hover table-condensed "
											data-striped="true" data-sort-name="Quality"
											data-sort-order="desc" data-pagination="false"
											data-scroll="false" data-height=550 id="table-id">
											<thead>
												<tr>
													<th class="col-sm-1 text-center" data-field="sr-no"
														data-sortable="true">Sr No</th>
													<th class="col-sm-1 text-center" data-field="vendor-name"
														data-sortable="true">Vendor Name</th>
													<th class="col-sm-1 text-center" data-field="vendor-bank-name"
														data-sortable="true">Vendor Bank Name</th>
													<th class="col-sm-1 text-center" data-field="vendor-email"
														data-sortable="true">Vendor Email</th>
													<th class="col-sm-1 text-center" data-field="vendor-account-holder-name"
														data-sortable="true">Vender Account Holder Name</th>
													<th class="col-sm-1 text-center" data-field="vendor-mobile-no"
														data-sortable="true">Vendor Mobile No</th>
													<th class="col-sm-1 text-center" data-field="vendor account no"
														data-sortable="true">Vendor Account No</th>
													<th class="col-sm-1 text-center" data-field="vendor-adhar-no"
														data-sortable="true">Vendor Adhar No</th>
													<th class="col-sm-1 text-center" data-field="ifsc-code"
														data-sortable="true">Ifsc Code</th>
													<th class="col-sm-1 text-center" data-field="vendor-address"
														data-sortable="true">Vendor Address</th>
													<th class="col-sm-1 text-center" data-field="branch-name"
														data-sortable="true">Branch Name</th>
													<th class="col-sm-1 text-center" data-field="vendor-gst-no"
														data-sortable="true">Vendor Gst No</th>
													<th class="col-sm-1 text-center" data-field="city"
														data-sortable="true">City</th>
													<th class="col-sm-1 text-center" data-field="dist"
														data-sortable="true">Dist</th>
													<th class="col-sm-1 text-center" data-field="action"
														data-sortable="true">Action</th>
													

												</tr>

											</thead>
											<tbody class="data">


											</tbody>
										</table>
										<!--end: datatable-->
									</div>
								</div>
							

		
		<!--end::Container-->


		<!--end::Content-->
		<!--begin::Footer-->
		<div style="position: fixed; bottom: 0; width: 100%;" class="fixed">
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
		<!--end::Footer-->

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


