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

		 <h2
								class="d-flex align-items-center text-gray font-weight-bold my-1 mr-3">Inventory Management Screen</h2> 


	
			<div class="card card-custom gutter-b">
				<div class="card-body">
					<div class="example mb-10">
						
							<div class="card card-custom">
								<form class="form" id="kt_form_1">
									
										<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Product Name :</label> <input type="text"
																			id="product_name"
																			class="form-control form-control-solid"
																			placeholder="Enter Product Name" />
																			<span class="form-text text-muted">Please Enter Product Name.</span>
																	</div>

																</div>
																
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Quantity :</label> <input type="number"
																			class="form-control form-control-solid" id="quantity"
																			placeholder="Enter Quantity" /><span class="msg text-danger"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Quantity.</span>

																	</div>

																</div>																
																
															</div>
										


									                       <div class="row">
																
															<div class="col-lg-6">
																	<div class="form-group">
																		<label>Request Date :</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="request_date"
																			id="request_date" />
																			<span class="form-text text-muted">Please Enter Request Date.</span>
																	</div>
																</div>
																																
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Aproval Date :</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="aproval_date"
																			id="aproval_date" />
																			<span class="form-text text-muted">Please Enter Aproval Date.</span>
																	</div>
																</div>
															</div>
											<div class="row">
																
															<div class="col-lg-6">
																	<div class="form-group">
																		<label>Dispatch Date :</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="dispatch_date"
																			id="dispatch_date" />
																			<span class="form-text text-muted">Please Enter Dispatch Date.</span>
																	</div>
																</div>
																</div>
										<div class="card-body" style="overflow-x: auto;">

																<table class="table" id="Mtable">
																	<thead>
																		<tr>
																			<th scope="col">Sr No</th>
																			<th scope="col">Product Name</th>
																			<th scope="col">Available Quantity</th>
																			<th scope="col">Request</th>
																			<th scope="col">Dispatch Quantity</th>
																			<th scope="col">Action</th>

																		</tr>
																	</thead>

																	<tbody class="add_product" id="add-product"></tbody>


																</table>
															</div>
															<div class="text-right mb-5 mr-22">
															<button type="button" id="add"
																class="btn btn-mr2" style="background-color:#AB48FF; ">Add</button>
														</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>State Adulted By Name :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="stateabName" id="stateabName" /><span
																				class="msg text-danger" id="type1"> </span>
																		</div>

																	</div>

																</div>
																</div>
									
									<div class="text-center white">
										<button type="button" id="addProduct"
											class="btn btn-mr2" style="background-color:#AB48FF; " >Approve</button>
									    <button type="button" id="addProduct"
											class="btn btn mr-2 " style="background-color:#AB48FF;"  >Reject</button>
										</div>	
										<div class="text-center white"><br>
										<button type="button" class="btn btn-mr-2" style="background-color:#AB48FF;"  id="dispatch">Dispatch</button>
									</div>
								</form>
								
								<!--end::Form-->
							</div>
						
					</div>
				</div>
			</div>
	
	
		

	</div>

	<!--begin::Footer-->
	<div style="position: fixed; bottom: 0; width: 100%;" class="fixed">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<!--end::Footer-->



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