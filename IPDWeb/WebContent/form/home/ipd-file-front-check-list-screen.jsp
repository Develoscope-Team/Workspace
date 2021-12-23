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
							
									<h2 class="text-gray font-weight-bold my-2 mr-5">IPD File Front Check List Screen</h2>

							
								<div class="card card-custom gutter-b">
									<div class="card-body">
										
											
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Patient Name</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid "
																				name="patientName" id="patientName" placeholder="Enter Patient Name"/><span
																				class="msg text-danger" id="type1"> </span>
																				<span class="form-text text-muted">Please Enter Patient Name.</span>
																		</div>

																	</div>

																</div>
																
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>IPD No/MRD No</label> <input type="number"
																			class="form-control form-control-solid"
																			id="ipdNo" placeholder="Enter IPD No/MRD No" /> <span class="msg text-danger"
																			id="type2"> </span>
																			<span class="form-text text-muted">Please Enter IPD No MRD No.</span>

																	</div>

																</div>
																
																
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Date Of Admission:</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="date_of_admission"
																			id="date_of_admission" />
																			<span class="form-text text-muted">Please Enter Date Of Admission.</span>
																	</div>
																</div>
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Date Of Discharge:</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid "
																			placeholder="DD/MM/YYYY" name="date_of_discharge"
																			id="date_of_discharge" />
																			<span class="form-text text-muted">Please Enter Date Of Discharge.</span>

																	</div>

																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	
																	 <label >Case Sheet: </label> 
																	 <lable>--------------------------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="caseSheet" name="caseSheet"  >
                                                                      
																	</div>
																	<div class="col-lg-6">
																	
																	 <label >Doctor Continuation Sheet : </label> 
																	 <lable>----------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="doctorCS" name="doctorCS"  >
                                                                      
																	</div>
																</div>
																<div class="row">
																<div class="col-lg-6">
																	
																	 <label >Consent From for Procedures: </label> 
																	 <lable>----------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="consentFromForProcedures" name="consentFromForProcedures"  >
                                                                      
																	</div>
																	<div class="col-lg-6">
																	
																	 <label >Pre-Operative Checklist : </label> 
																	 <lable>------------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="" name="pre-OperativeChecklist"  >
                                                                      
																	</div>
																</div>
															 <div class="row">
																<div class="col-lg-6">
																	
																	 <label >Post-Operative Checklist : </label> 
																	 <lable>-------------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="post-OperativeChecklist" name="post-OperativeChecklist"  >
                                                                      
																	</div>
																	<div class="col-lg-6">
																	
																	 <label >T.P.R Chart : </label> 
																	 <lable>------------------------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="tprChart" name="tprChart"  >
                                                                      
																	</div>
																</div>
																	<div class="row">
																<div class="col-lg-6">
																	
																	 <label >Intake/Output Chart : </label> 
																	 <lable>------------------------------------ </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="intake/OutputChart" name="intake/OutputChart"  >
                                                                      
																	</div>
																	<div class="col-lg-6">
																	
																	 <label >Drug Chart : </label> 
																	 <lable>------------------------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="drugChart" name="drugChart"  >
                                                                      
																	</div>
																</div>
																
																			<div class="row">
																<div class="col-lg-6">
																	
																	 <label >Nurses Report : </label> 
																	 <lable>------------------------------------------ </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="nursesReport" name="nursesReport"  >
                                                                      
																	</div>
																	<div class="col-lg-6">
																	
																	 <label >Investigation Report(X-Ray Lab etc) : </label> 
																	 <lable>--------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="ir" name="ir"  >
                                                                      
																	</div>
																</div>
																			<div class="row">
																<div class="col-lg-6">
																	
																	 <label >General Consent : </label> 
																	 <lable>--------------------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="generalConsent" name="generalConsent"  >
                                                                      
																	</div>
																	<div class="col-lg-6">
																	
																	 <label >Discharge Time Sheet : </label> 
																	 <lable>---------------------------------- </label>
																		<input type="checkbox " style="height: 30px; width: 30px;"  id="dts" name="dts"  >
                                                                      
																	</div>
																</div>
																
																		<div class="row">
																
																	<div class="col-lg-12">
																	 <label >Remarks If Any : </label> 
																	 <lable>----------------------------------------------------------------------------------------------------------------------- </label>
																		
                                                                  
																	</div>
																	</div>
																	
																	
																	<div class="row">
																	<div class="col-lg-12">
																	 <label >Date Of Document Stored in MRD : </label> 
																	 <lable>----------------------------------------------- </label>
																	</lable>
																	</div>
                                                                 </div>
																
														<div class="text-center">
											<button type="button" id="addProduct"
												class="btn btn-primary mr-2" style="background-color: #AB48FF;  ">Submit</button>

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