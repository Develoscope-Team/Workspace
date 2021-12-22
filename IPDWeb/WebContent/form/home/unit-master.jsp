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
	
	
						<!--begin::Container-->
						<div class="container">

							 <h2
								class="d-flex align-items-center text-white font-weight-bold my-1 mr-3">unit master
				</h2> 

							
								<div class="col-xl-14 offset-xl-0">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-14">
												<div class="example-preview">
													<div class="card card-custom">
														<form class="form" id="kt_form_1">
															<div class="card-body">
															<div class="row">
																	<div class="col-xl-6">
																<div class="form-group">
																	<label>Unit Desc</label> <input type="text"
																		id="unit_desc"
																		class="form-control form-control-bold"
																		placeholder="Enter Unit Desc" />
																</div>
																</div>
																<div class="col-xl-6">
																<div class="form-group">
																	<label>Unit Code</label> <input type="text"
																		id="unit_code"
																		class="form-control form-control-solid"
																		placeholder="Enter Unit Code" />
																</div>
																</div>
																</div>
															</div>
															<div class="text-center">
																<button type="button" id="addUnit"
																	class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Submit</button>
																<button type="submit" id="updateUnit"
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
													<th class="col-sm-1 text-center" data-field="NO"
														data-sortable="true">No</th>
													<th class="col-sm-3 text-center" data-field="unit-name"
														data-sortable="true">Unit Name</th>
													<th class="col-sm-3 text-center" data-field="unit-code"
														data-sortable="true">Unit Code </th>
													
													<th class="col-sm-2 text-center" data-field="Action"
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
						<!--end::Container-->
					
				<!--begin::Footer-->
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



