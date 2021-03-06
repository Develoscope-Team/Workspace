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
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
</head>
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/media/bg/bg-9.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">


	
					
						<div
							class="container ">
							
									<h2 class="text-gray font-weight-bold my-2 mr-5">Salary Calculation Screen</h2>

							
								<div class="card card-custom gutter-b">
									<div class="card-body">
										
											
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Name Of Employee</label> <input type="text"
																			id="name_of_employee"
																			class="form-control form-control-solid"
																			placeholder="Enter Name Of Employee" />
																			<span class="form-text text-muted">Please Enter Name Of Employee.</span>
																	</div>

																</div>
														<div class="col-xl-6">
																	<div class="form-group">
																		<label>Month</label> <input type="Date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="month"
																			id="month" />
																			<span class="form-text text-muted">Please Enter Manth.</span>

																	</div>

																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Days Of Attendence</label> <input type="Date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="days_of_attendence"
																			id="days_of_attendence" />
																			<span class="form-text text-muted">Please Enter Days Of Attendence.</span>

																	</div>

																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Total</label> <input type="text"
																			class="form-control form-control-solid"
																			id="total" placeholder="Enter Total" /> <span class="total"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Total.</span>
																	</div>
																</div>
															</div>
															<div class="row">
															<div class="col-lg-6">
																	<div class="form-group">
																		<label>Tax Deduction</label>
																		<textarea rows="1"
																			class="form-control form-control-solid"
																			id="tax_deduction" placeholder="Enter Tax deduction"></textarea>
																			<span class="form-text text-muted">Please Enter Tax Deduction.</span>
																	</div>
																</div>
															<div class="col-lg-6">
																	<div class="form-group">
																		<label>Total Salary</label> <input type="text"
																			class="form-control form-control-solid"
																			id="totalSalary" placeholder="Enter Total Salary"/> <span class="totalSalary"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Total Salary.</span>
																	</div>
																</div>
																</div>
																<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Date</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="date"
																			id="date" />
																			<span class="form-text text-muted">Please Enter Date.</span>

																	</div>

																</div>
																
																
																
																
															<div class="col-xl-6">
																	<div class="form-group">
																		<label>Audience Deduction</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="audience_deduction" id="audiunce_deduction" placeholder="Enter Audience Deduction"/> 
																				<span class="form-text text-muted">Please Enter Audience Deduction.</span>
																		</div>

																	</div>
																</div>
																
																</div>

															</form>	
														
														</div>

															

															
															


															


															



														

															
														</div>
														<div class="text-center">
											<button type="button" id="addProduct"
												class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Submit</button>

											<button type="button" class="btn btn-primary mr-2" style="background-color:#AB48FF; " id="cancel">Cancel</button>
										</div>
													
													<!--end::Form-->
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

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/features/custom/spinners.js"></script>
	<%--<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script> --%>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	


	
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>