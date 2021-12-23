<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "IPD-OPD";
	try {
%>
<head>
<jsp:include page="../common/mobile-header.jsp"></jsp:include>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
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
								class="d-flex align-items-center text-dark font-weight-bold my-1 mr-4">Bank
								Master</h2> 

							<div class="row">
							<div class="col-xl-12 offset-xl-0">
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
																<label>Bank Name</label> <input type="text"
																	id="bank_name"
																	class="form-control form-control-solid"
																	placeholder="Enter Recipe Name" />
															</div>
															</div>
															<div class="col-xl-6">
															<div class="form-group">
																<label>Branch Name</label> <input type="text"
																	id="branch_name"
																	class="form-control form-control-solid"
																	placeholder="Enter Branch Name" />
															</div>
															</div>
															</div>
															<div class="row">
																	<div class="col-xl-6">
															<div class="form-group">
																<label>Account Holder Name</label> <input type="text"
																	id="account_holder_name"
																	class="form-control form-control-solid"
																	placeholder="Enter Account Holder Name" />
															</div>
															</div>
															<div class="col-xl-6">
															<div class="form-group">
																<label>Account Type</label> <select
																	class="form-control form-control-solid" name="account" id="acc_type">
																	<option value="" disabled selected hidden>Select
																		Acccount</option>
																		<option value="current" >Current </option>
																		<option value="saving" >Saving </option>
																		
																		
																</select>
															</div>
															</div>
															</div>
															<div class="row">
																	<div class="col-xl-6">
															<div class="form-group">
																<label>Account No </label> <input type="text"
																	id="account_no"
																	class="form-control form-control-solid"
																	placeholder="Enter Account No." />
															</div>
															</div>
															<div class="col-xl-6">
															<div class="form-group">
																<label>IFSC Code</label> <input type="text"
																	id="ifsc_code"
																	class="form-control form-control-solid"
																	placeholder="Enter IFSC code " />
															</div>
															</div>
															</div>
															<div class="row">
															<div class="col-xl-6">
															<div class="form-group">
																<label>Opening Amount </label> <input type="text"
																	id="opening_amount"
																	class="form-control form-control-solid"
																	placeholder="Enter Opening Amount" />
															</div>
															</div>
															
														</div>
														</div>
														<div class="text-center">
															<button type="button" id="addBank"
																class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Submit</button>
															<button type="submit" id="updateBank"
																class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Update</button>
															<button type="button" class="btn btn-primary mr-2" style="background-color: #AB48FF; " id="cancel">Cancel</button>
														</div>
													</form>
													<!--end::Form-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-12 offset-xl-0">
								<div class="card card-custom gutter-b">
									<div class="card-body">
									<div class="input-icon ml-10" style = "width: 30%;">
																<input type="text" class="form-control form-control-solid" placeholder="Search..." id="txt_searchall" />
																<span>
																	<i class="flaticon2-search-1 text-muted"></i>
																</span>
															</div>
											<br />
										<!--begin: Datatable-->
										<table data-toggle="table" class='a'
											data-classes="table table-hover table-condensed "
											data-striped="true" data-sort-name="Quality"
											data-sort-order="desc" data-pagination="false"
											data-scroll="false" data-height=550 id="table-id">
											<thead>
												<tr>
													<th class="col-sm-1 text-center" data-field="sr-no"
														data-sortable="true">Sr No</th>
													<th class="col-sm-2 text-center" data-field="bank-name"
														data-sortable="true">Bank Name</th>
													<th class="col-sm-3 text-center" data-field="branch-name"
														data-sortable="true">Branch-Name</th>
														<th class="col-sm-3 text-center" data-field="account-holder-name"
														data-sortable="true">Account Holder Name</th>
														<th class="col-sm-1 text-center" data-field="account-type"
														data-sortable="true">Account Type</th>
														<th class="col-sm-3 text-center" data-field="account-no"
														data-sortable="true">Account No</th>
													<th class="col-sm-3 text-center" data-field="ifsc-code"
														data-sortable="true">IFSC-Code</th>	
														<th class="col-sm-3 text-center" data-field="opening-amount"
														data-sortable="true">Opening-Amount</th>
													<th class="col-sm-2 text-center" data-field="action"
														data-sortable="false">Action</th>
												</tr>

											</thead>
											<tbody class="data">
											</tbody>
										</table>
										<!--end: Datatable-->
									</div>
								</div>
							</div>

						</div>
						</div>
					
				<!--begin::Footer-->
				<div style=" position:fixed; bottom:0;   width:100%;" class="fixed">
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
	<script src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/ipd-opd/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	

<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	
	
	$('#updateBank').hide();
	</script>
</body>
</html>


<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>