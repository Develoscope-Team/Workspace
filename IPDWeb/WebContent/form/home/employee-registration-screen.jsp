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
							
									<h2 class="text-gray font-weight-bold my-2 mr-5">Employee Registration Screen</h2>

							
								<div class="card card-custom gutter-b">
									<div class="card-body">
										
											
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Employee Name :</label> <input type="text"
																			id="employee_name"
																			class="form-control form-control-solid"
																			placeholder="Enter Employee Name" />
																			<span class="form-text text-muted">Please Enter Employee Name.</span>
																	</div>

																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Employee Entry :</label> <input type="text"
																			id="employee_entry"
																			class="form-control form-control-solid"
																			placeholder="Enter Employee Entry" />
																			<span class="form-text text-muted">Please Employee Entry.</span>

																	</div>

																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Employee Birth Date :</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="employee_birth_date"
																			id="employee_birth_date" />
																			<span class="form-text text-muted">Please Enter Employee Birth Date.</span>
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																	<label>Designation :</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="designation" id="designation">
																			<option value="" disabled selected hidden>Select
																				Designation</option>
																		</select>
																		<span class="form-text text-muted">Please Enter Designation.</span>
																		
																	</div>
																</div>
															</div>
															<div class="row">
															<div class="col-lg-6">
																	<div class="form-group">
																	<label>Qualification :</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="qualification" id="qualification">
																			<option value="" disabled selected hidden>Select Qualification</option>
																		</select>
																		<span class="form-text text-muted">Please Enter Qualification.</span>
																		
																	</div>
																</div>
																
																<div class="col-lg-6">
											                      <div class="form-group">
												                    <label>Adhar No :</label> <input type="text"
													                   class="form-control form-control-solid" id="adhar_no" /><span
														               class="msg text-danger" id="type2" placeholder="Enter Adhar No"> </span>
														               <span class="form-text text-muted">Please Enter Adhar No.</span>
											                    </div>
										                     </div>
														</div>
														<div class="row">
															<div class="col-lg-6">
																	<div class="form-group">
															<label>Mobile No :</label> <input type="text"
																			class="form-control form-control-solid"
																			id="mobile_no" placeholder="Enter Mobile No"/> <span class="msg text-danger"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Mobile No.</span>
																	  </div>
																	</div>
																
															
																 <div class="col-lg-6">
																	<div class="form-group">
																		<label>Blood Group :</label><span class="text-danger">*</span>
																		<select class="form-control form-control-solid"
																			name="bloodGroup" id="bloodGroup">
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
																</div>
																<div class="row">
																<div class="col-xl-6">
																		<!--begin::Input-->
																		<div class="form-group">
																			<label>Email :</label>
																			<input type="email" class="form-control form-control-solid form-control-lg" name="email" placeholder="Email" value="john.wick@reeves.com" />
																			<span class="form-text text-muted">Please enter your email address.</span>
																		</div>
																		<!--end::Input-->
																	</div>
																	
																<!-- <div class="col-xl-6">
																<div class="form-group">
																			<label>Email ID</label>
																			<input type="email" class="form-control form-control-solid form-control-lg" name="email" placeholder="Email" value="john.wick@reeves.com" />
																			<span class="form-text text-muted">Please enter your email address.</span>
																		</div>
																		</div>
																		-->
																
																<!-- <div class="col-xl-6">
																	<div class="form-group">
														<label>Email Id 
														<span class="text-danger">*</span></label>
														<input type="email" class="form-control form-control-solid" id="email_id" placeholder="Enter Email Id " />
														<span class="form-text text-muted">Please Enter Email Address.</span>
													</div>

																</div> -->
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Address :</label>
																		<textarea rows="1"
																			class="form-control form-control-solid"
																			id="address" placeholder="Enter Address"></textarea>
																			<span class="form-text text-muted">Please Enter Address.</span>
																	</div>
																</div>
																
																
															</div>
															<div class="row">
																
										               <div class="col-lg-6">
																	<div class="form-group">
																		<label>Joining Date :</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid"
																			id="joining_date"/>
																			<span class="form-text text-muted">Please Enter Joining Date.</span>
																	</div>
																</div>
			
															
																
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Resign Date :</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid"
																			id="resign_date" />
																			<span class="form-text text-muted">Please Enter Resign Date.</span>
																	</div>
																</div>
																</div>
																<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Salary :</label> <input type="text"
																			class="form-control form-control-solid"
																			id="salary" placeholder="Enter Salary"/> <span class=""
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter Salary.</span>
																	</div>
																</div>
										              
										               
										              
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>No Of Anual Leaves :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="no_of_nual_leaves" id="no_of_nual_leaves" placeholder="Enter No Of Anual Leaves"/>
																				<span class="form-text text-muted">Please Enter No Of Anual Leaves.</span> 
																		</div>

																	</div>
																	</div>
																	</div>
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Allowns :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="allowns" id="allowns" placeholder="Enter Allowns"/>
																				<span class="form-text text-muted">Please Enter Allowns.</span> 
																		</div>

																	</div>
																</div>
																   <div class="col-xl-6">
																	  <div class="form-group">
																		<label>Insurance Details :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="insurance_details" id="insurance_details" placeholder="Enter Insurance Details"/><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter Insurance Details.</span>
																		</div>

																	</div>

																</div>
																</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Tax Deduction :</label>
																		<textarea rows="1"
																			class="form-control form-control-solid"
																			id="tax_deduction" placeholder="Enter Tax Deduction"></textarea>
																			<span class="form-text text-muted">Please Enter Tax Deduction.</span>
																	</div>
																</div>
																 <div class="col-xl-6">
																	<div class="form-group">
																		<label>No Of Days Weekly :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="noOfDaysWeekly" id="no_of_days_weekly" placeholder="Enter No Of Days Weekly"/> 
																				<span class="form-text text-muted">Please Enter No Of Days Weekly.</span>
																		</div>

																	</div>
																	
																</div>
																</div>
																<div class="row">
																 <div class="col-xl-6">
																	<div class="form-group">
																		<label>City :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="city" id="city" placeholder="Enter City"/> 
																				<span class="form-text text-muted">Please Enter City.</span>
																		</div>

																	</div>
																</div>
																
				                                                  <div class="col-xl-6">
																	<div class="form-group">
																		<label>District :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="district" id="district" placeholder="Enter District"/> 
																				<span class="form-text text-muted">Please Enter District.</span>
																		</div>

																	</div>
																</div>
																</div>
														    <div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>State :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="state" id="state" placeholder="Enter State"/>
																				
																<span class="form-text text-muted">Please Enter State.</span>
																</div>

																	</div>
																</div>
																
																
															      <div class="col-lg-6">
									                                <label>Upload Document Files :</label>
														             <div class="dropzone dropzone-multi" id="kt_dropzone_4" placeholder="Upload Document Files">
																       <div class="dropzone-panel mb-lg-0 mb-2">
																	    <a class="dropzone-select btn btn-light-primary font-weight-bold btn-sm">Attach files</a>
																	    <a class="dropzone-upload btn btn-light-primary font-weight-bold btn-sm">Upload All</a>
																	    <a class="dropzone-remove-all btn btn-light-primary font-weight-bold btn-sm">Remove All</a>
																	    <span class="form-text text-muted">Please Enter Upload Document Files.</span>
																     </div>
									                               </div>
									                             
									                             </div>
									                             </div>
									                          <div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Bank Name :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="bank_name" id="bank_name" placeholder="Enter Bank Name"/>
																				
																<span class="form-text text-muted">Please Enter Bank Name.</span>
																</div>

																	</div>
																</div>
																 <div class="col-lg-6">
																	<div class="form-group">
																		<label>Bank Holder Name :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="bankHolderName" id="bankHolderName" placeholder="Enter Bank Holder Name"/><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter Bank Holder Name.</span>
																		</div>

																	</div>

																</div>
															</div>
																<div class="row">
														           <div class="col-lg-6">
																	 <div class="form-group">
																		<label>Account No :</label><span class="number"></span>
																		<div class="typeahead">
																			<input type="digit"
																				class="form-control form-control-solid "
																				name="accountNo" id="accountNo" placeholder="Enter Account No"/>
																				
																<span class="form-text text-muted">Please Enter Account No.</span>
																</div>

																	</div>
																   </div>
														         <div class="col-lg-6">
																	<div class="form-group">
																		<label>IFSC :</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="ifsc" id="ifsc" placeholder="Enter IFSC Code"/><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter IFSC.</span>
																		</div>

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