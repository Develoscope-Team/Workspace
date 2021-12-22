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
	<div class="content d-flex flex-column flex-column-fluid col-xl-12"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid col-xl-12">
	
<div class="container-fluid">

							<div class="template-master">
								<form class="form" id="kt_form_1">
									<div class=" col-lg-6 offset-lg-3 col-md-12 col-sm-12">
										<div class="form-group">
											<label>Template Name</label><span class="text-danger">*</span>
											<input type="text" class="form-control form-control-solid"
												name="templateName" id="template_name"
												placeholder="Enter Template name" />
										</div>
										<div class="form-group">
											<label>Template Desc</label><span class="text-danger">*</span>
											<input type="text" class="form-control form-control-solid"
												name="templateCode" id="template_code"
												placeholder="Enter Template Code" />
										</div>
									</div>
									<span class="text-danger">double click on Medicine Field
										to search new medicine</span>
									<div class="card-body">

										<table class="table" id="Mtable">
											<thead>
												<tr>
													<th scope="col">#</th>
													<th scope="col">Name</th>
													<th scope="col">Category</th>
													<th scope="col">Type</th>
													<th scope="col">Dose</th>
													<th scope="col">Time</th>
													<th scope="col">Qty</th>
													<th scope="col">isSpecial</th>
													<th scope="col">Is_Printable</th>
													<th scope="col">Remark</th>
													<th scope="col">Action</th>

												</tr>
											</thead>

											<tbody class="add_medicine" id="add-medicine"></tbody>


										</table>
									</div>
									<div class="text-right mb-5 mr-22">
										<button type="button" id="add"
											class="btn font-weight-bold  btn-icon btn-light-success">
											<i class="la la-plus"></i>
										</button>
									</div>

									<div class="card-footer">
										<div class="row">
											<div class="col-lg-4"></div>
											<div class="col-lg-4">
												<button type="submit" id="addMedicineMaster"
													class="btn font-weight-bold btn-primary mr-2">Submit</button>
												<button type="submit" id="updateMedicineMaster"
													class="btn font-weight-bold btn-primary mr-2">Update</button>
												<button type="button"
													class="btn font-weight-bold btn-secondary" id="cancel">Cancel</button>
											</div>
										</div>
									</div>
								</form>
							</div>

							<div class="col-10 offset-1">
								<div class="quick-search quick-search-inline ml-20 w-300px "
									id="kt_quick_search_inline">
									<!--begin::Form-->
									<form method="get" class="quick-search-form">
										<div class="input-group rounded bg-light">
											<div class="input-group-prepend">
												<span class="input-group-text"> <span
													class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/Search.svg-->
														<svg xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
															height="24px" viewBox="0 0 24 24" version="1.1">
															<g stroke="none" stroke-width="1" fill="none"
																fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24" />
																<path
																d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
																fill="#000000" fill-rule="nonzero" opacity="0.3" />
																<path
																d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
																fill="#000000" fill-rule="nonzero" />
															</g>
														</svg> <!--end::Svg Icon-->
												</span>
												</span>
											</div>
											<input type="text" class="form-control h-45px "
												id="txt_searchall1" placeholder="Search..." />
											<div class="input-group-append">
												<span class="input-group-text"> <i
													class="quick-search-close ki ki-close icon-sm text-muted"></i>
												</span>
											</div>
										</div>
									</form>
									<!--end::Form-->
									<!--begin::Search Toggle-->
									<div id="kt_quick_search_toggle" data-toggle="dropdown"
										data-offset="0px,1px"></div>
									<!--end::Search Toggle-->
									<!--begin::Dropdown-->
									<div
										class="dropdown-menu dropdown-menu-left dropdown-menu-lg dropdown-menu-anim-up">
										<div class="quick-search-wrapper scroll" data-scroll="true"
											data-height="350" data-mobile-height="200"></div>
									</div>
									<!--end::Dropdown-->
								</div>
								<br />


								<div class="card card-custom gutter-b">
									<div class="card-body-fluid">

										<table data-toggle="table" class='a'
											data-classes="table table-hover table-condensed "
											data-striped="true" data-sort-name="Quality"
											data-sort-order="desc" data-pagination="false"
											data-scroll="false" data-height=550 id="table-id">
											<thead>
												<tr>
													<th class="col-sm-1 text-center" data-field="NO"
														data-sortable="true">No</th>
													<th class="col-sm-2 text-center" data-field="template_name"
														data-sortable="true">Template Name</th>
													<th class="col-sm-3 text-center" data-field="template_code"
														data-sortable="true">Template Desc</th>
													<th class="col-sm-2 text-center" data-field="Action"
														data-sortable="true">Action</th>

												</tr>

											</thead>
											<tbody class="data">


											</tbody>
										</table>

									</div>

								</div>
							</div>
							<div class="modal fade" id="medicineModel" tabindex="-1"
								role="dialog" aria-labelledby="staticBackdrop"
								aria-hidden="true">
								<div class="modal-dialog  modal-xl modal-dialog-scrollable"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="history_patient_name"></h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<i aria-hidden="true" class="ki ki-close"></i>
											</button>
										</div>
										<div class="modal-body">

											<div class="quick-search quick-search-inline ml-20 w-300px "
												id="kt_quick_search_inline">
												<!--begin::Form-->
												<form method="get" class="quick-search-form">
													<div class="input-group rounded bg-light">
														<div class="input-group-prepend">
															<span class="input-group-text"> <span
																class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/Search.svg-->
																	<svg xmlns="http://www.w3.org/2000/svg"
																		xmlns:xlink="http://www.w3.org/1999/xlink"
																		width="24px" height="24px" viewBox="0 0 24 24"
																		version="1.1">
															<g stroke="none" stroke-width="1" fill="none"
																			fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24" />
																<path
																			d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
																			fill="#000000" fill-rule="nonzero" opacity="0.3" />
																<path
																			d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
																			fill="#000000" fill-rule="nonzero" />
															</g>
														</svg> <!--end::Svg Icon-->
															</span>
															</span>
														</div>
														<input type="text" class="form-control h-45px "
															id="txt_searchall" placeholder="Search..." />
														<div class="input-group-append">
															<span class="input-group-text"> <i
																class="quick-search-close ki ki-close icon-sm text-muted"></i>
															</span>
														</div>
													</div>
												</form>
												<!--end::Form-->
												<!--begin::Search Toggle-->
												<div id="kt_quick_search_toggle" data-toggle="dropdown"
													data-offset="0px,1px"></div>
												<!--end::Search Toggle-->
												<!--begin::Dropdown-->
												<div
													class="dropdown-menu dropdown-menu-left dropdown-menu-lg dropdown-menu-anim-up">
													<div class="quick-search-wrapper scroll" data-scroll="true"
														data-height="350" data-mobile-height="200"></div>
												</div>
												<!--end::Dropdown-->
											</div>
											<br />
											<div class="col-xl-12">

												<div class="card card-custom gutter-b">
													<div class="card-body">
														<!--begin: Datatable-->
														<div
															class="datatable datatable-bordered datatable-head-custom"
															id="kt_datatable1"></div>
														<table class="table " id="popup_table" style="width: 100%"></table>
														<!--end: Datatable-->
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button"
												class="btn btn-light-primary font-weight-bold"
												data-dismiss="modal">Close</button>
										</div>
									</div>
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
	
	
	$('#updateComplaint').hide();
	</script>
</body>
</html>


<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>