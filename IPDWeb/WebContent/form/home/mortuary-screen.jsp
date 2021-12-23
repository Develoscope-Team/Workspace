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
<jsp:include page="../common/mobile-header.jsp"></jsp:include>
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/media/bg/bg-9.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">


	
					
						<div
							class="container ">
							
									<h2 class="text-gray font-weight-bold my-2 mr-5">Mortuary Screen</h2>

							
								<div class="card card-custom gutter-b">
									<div class="card-body">
										
											
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Post Morton Id</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="post_morton_id" id="post_morton_id" placeholder="Enter Post Morton Id" /><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter Post Morton Id.</span>
																		</div>

																	</div>

																</div>
																<div class="col-xl-6">
																	<div class="form-group">
														         <label>Patient Name</label> <input type="text"
															      id="patient_name" class="form-control form-control-solid"
															       placeholder="Enter Patient Name" />
															       <span class="form-text text-muted">Please Enter Patient Name.</span>
													            </div>

																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
														         <label>Doctor Name</label> <input type="text"
															      id="doctor_name" class="form-control form-control-solid"
															       placeholder="Enter Doctor Name" />
															       <span class="form-text text-muted">Please Enter Doctor Name.</span>
													            </div>

																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label for="appt">Post Morton Time</label><span class="text-danger"></span>
																	    <div class="typeahead">
                                                                        <input type="time" class="form-control form-control-solid" id="pmt" name="pmt"
                                                                        min="00:00" max="24:00" >
                                                                        <span class="form-text text-muted">Please Enter Post Morton Time.</span>
																	</div>
																</div>
															</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Date Of Death:</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="date_of_death"
																			id="date_of_death" />
																			<span class="form-text text-muted">Please Enter Date Of Death.</span>
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Reason Of Death:</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="reason_of_death"
																			id="reason_of_death" />
																			<span class="form-text text-muted">Please Enter Reason Of Death.</span>
																	</div>
																</div>
																
															
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Post Morton Details</label>
																		<textarea rows="1"
																			class="form-control form-control-solid"
																			id="post_morton_details" placeholder="Enter Post Morton Details"></textarea>
																			<span class="form-text text-muted">Please Enter Post Morton Details.</span>
																	</div>
																</div>
										              <div class="col-lg-6">
																	<div class="form-group">
																		<label for="appt">Patient Death Time</label><span class="text-danger"></span>
																	    <div class="typeahead">
                                                                        <input type="time"class="form-control form-control-solid" id="pdt" name="pdt"
                                                                        min="00:00" max="24:00" >
                                                                        <span class="form-text text-muted">Please Enter Patient Death Time.</span>
																	</div>
																</div>
																
																
															</div>
															</div>
															
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label for="appt">Dead Body Entry Time In Mortuary</label><span class="text-danger"></span>
																	    <div class="typeahead">
                                                                        <input type="time" class="form-control form-control-solid" id="dbetim" name="dbetim"
                                                                        min="00:00" max="24:00" >
                                                                        <span class="form-text text-muted">Please Enter Dead Body Entry Time In Time.</span>
																	</div>
																</div>
																
																
															</div>
										              
															
															
															
																<div class="col-lg-6">
																	
																	<div class="form-group">
														         <label>Post Morton Dr Name</label> <input type="text"
															      id="post_morton_dr_name" class="form-control form-control-solid"
															       placeholder="Enter Post Morton Dr Name" />
															       <span class="form-text text-muted">Please Enter Post Morton Dr Name.</span>
													            </div>

																
																</div>
															</div>
															<div class="row">
										                      <div class="col-xl-6">
																	<div class="form-group">
														         <label>Relative Name</label> <input type="text"
															      id="relative_name" class="form-control form-control-solid"
															       placeholder="Enter Relative Name" />
															       <span class="form-text text-muted">Please Enter Relative Name.</span>
													            </div>

																</div>
																
														

													
													
																		<div class="col-xl-6">
																	<div class="form-group">
																		<label>Birth Marks On Dead Body</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="birth_marks_on_dead_body" id="birth_marks_on_dead_body">
																			<option value="" disabled selected hidden>Select Birth Marks On Dead Body</option>
																		</select>
																		 <span class="form-text text-muted">Please Enter Birth Marks On Dead Body.</span>
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