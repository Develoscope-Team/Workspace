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
							
									<h2 class="text-gray font-weight-bold my-2 mr-5">Patient Registration Screen</h2>

							
								<div class="card card-custom gutter-b">
									<div class="card-body">
										
											
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
														<label>Patient Name</label><input type="text"
															id="patient_name" class="form-control form-control-solid"
															placeholder="Enter Patient Name" />
															<span class="form-text text-muted">Please Enter Patient Name.</span>

													</div>
												
																</div>
																<div class="col-lg-6">
																	
																	<label>Button:</label><br>
																		<button type="button" id="previous health history"
												                         class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Previous Health History</button>
																		<span class="form-text text-muted">Please Click On Button.</span>
																	
																</div>
															</div>
															<div class="row">
																<div class="col-xl-6">
																		<!--begin::Input-->
																		<div class="form-group">
																			<label>Email Id</label>
																			<input type="email" class="form-control form-control-solid " name="email_id" placeholder="Enter Email" value="@gmail.com" />
																			<span class="form-text text-muted">Please Enter Email Id.</span>
																		</div>
																		<!--end::Input-->
																	</div>
																<div class="col-lg-6">
																	<div class="form-group">
															<label>Adhar No</label> <input type="text"
																			class="form-control form-control-solid"
																			id="adhar_no" placeholder="Enter Adhar No" /> <span class="msg text-danger"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Adhar No.</span>
																	  </div>
																	</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Address</label>
																		<textarea rows="1"
																			class="form-control form-control-solid"
																			id="address" placeholder="Enter Address"></textarea>
																			<span class="form-text text-muted">Please Enter Address No.</span>
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Birth Date Of Employee</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid"
																			id="birth_date_of_employee" />
																			<span class="form-text text-muted">Please Enter Birth Date Of Employee.</span>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Age</label> <input type="text"
																			class="form-control form-control-solid"
																			id="age" placeholder="Enter The Age "/> <span class="msg text-danger"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Age.</span>
																			
																	</div>
																</div>
										                        <div class="col-xl-6">
																	<div class="form-group">
																		<label>Gender</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="gender" id="gender">
																			<option value="Select Gender">Select Gender</option>
																			<option value="Male">Male</option>
																			<option value="Female">Female</option>
																		</select>
																		<span class="form-text text-muted">Please Enter Gender.</span>

																	</div>
																</div>
																
																
															</div>
															
															
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Blood Group</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="blood_group" id="blood_group">
																			<option value="Select Blood Group">Select Blood Group</option>
																			<option value="A+">A Positive</option>
																			<option value="A-">A Negative</option>
																			<option value="B+">B Positive</option>
																			<option value="B-">B Negative</option>
																			<option value="AB+">AB Positive</option>
																			<option value="AB-">AB Negative</option>
																			<option value="O+">O Positive</option>
																			<option value="O-">O Negative</option>
																		</select>
																		<span class="form-text text-muted">Please Enter Blood Group.</span>
																	</div>
																</div>
										                         <div class="col-xl-6">
																	<div class="form-group">
																		<label>City</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="city" id="city">
																			<option value="Select Gender">Select City</option>
																		</select>
																		<span class="form-text text-muted">Please Enter City.</span>

																	</div>
																</div>
																
																
															</div>

														<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>District</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="district" id="district">
																			<option value="Select District">Select District</option>
																		</select>
																		<span class="form-text text-muted">Please Enter District.</span>
																	</div>
																</div>
										                        <div class="col-xl-6">
																	<div class="form-group">
																		<label>Insurance No</label> <input type="text"
																			class="form-control form-control-solid"
																			id="insurenceNo" placeholder="Enter Insurance No"/> <span class="msg text-danger"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Insurance No.</span>

																	</div>
																</div>
																
																
															</div>
															
															<div class="row">
																
										               <div class="col-lg-6">
																	<div class="form-group">
																		<label>Relative Name</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="relative_name" id="relative_name" placeholder="Relative Name" /><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter Relative Name.</span>
																				
																		</div>
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Relative Mobile No</label> <input type="text"
																			class="form-control form-control-solid"
																			id="relative_mobile_no" placeholder="Relative Mobile No"/> <span class="msg text-danger"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Relative Mobile No.</span>
																	</div>
																</div>
																</div>
														<div class="row">
										                       <div class="col-xl-6">
																	<div class="form-group">
																		<label>Relative Address</label>
																		<textarea rows="1"
																			class="form-control form-control-solid"
																			id="relativeaddress" placeholder="Enter Relative Address"></textarea>
																			<span class="form-text text-muted">Please Enter Relative Address.</span>
																	</div>
																</div>
															        <div class="col-xl-6">
																	<div class="form-group">
																		<label>Relation</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="relation" id="relation" placeholder="Relation"/><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter Relation.</span>
																		</div>
                                                                   </div>
                                                                 </div>
																</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Occupation</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="occupation" id="occupation" placeholder="Enter Occupation"/><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter Occupation.</span>
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