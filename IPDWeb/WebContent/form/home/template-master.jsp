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
	
		
						<!--begin::Container-->
						<div class="container">
						<h2
								class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Template
								Master</h2>

								<div class="row">
								<div class="col-xl-12">
									<div class="card card-custom gutter-b">
										<div class="card-body ">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form class="form" id="kt_form_1">
															<div class="card-body">
																<div class="form-group">
											<label>Template Name :</label><span class="text-danger"></span>
											<input type="text" class="form-control form-control-solid"
												name="template_Name" id="template_name"
												placeholder="Enter Template name" />
										</div>
										
											<label>Template Description :</label><span class="text-danger"></span>
											<input type="text" class="form-control form-control-solid"
												name="template_description" id="template_description"
												placeholder="Enter Template Code" />
										
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
													<th scope="col">Qauntity</th>
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
										<div class="text-center">
																<button type="submit" id="addtemplate"
																	class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Submit</button>
																<button type="submit" id="updatetemplate"
																	class="btn btn-primary mr-2" style="background-color: #AB48FF; ">Update</button>
																<button type="button" class="btn btn-primary mr-2" style="background-color: #AB48FF; "
																	id="cancel">Cancel</button>
															</div>
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
									</div>
									<!--end::Dropdown-->
								</div>
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
	
	
	$('#updatetemplate').hide();
	$("#addtemplate").show();
	
		$('#addtemplate').click(function() {

							var template_name = $('#template_name').val();
							var template_desc = $('#template_desc').val();
							var flag = 1; // Addition

						if(template_name != "" && template_desc != ""){
							$.ajax({
								// http://localhost:8080/ipdAPI/ipdapi/insertUpdatetemplate
								url : base +"/ipdAPI/ipdapi/insertUpdatetemplate",
								
								type : "post",
								dataType : "json",
								async : false,
								data : {
									"template_name" : template_name,
                                    "template_desc" : template_desc,
									"flag" : flag
								},
								
								error : function(xhr) {
									var msg = "Data insertion failed Error : "
											+ xhr.status
											+ " "
											+ xhr.statusText;
									alert(msg);
								},
								success : function(response) {
									if (response != null) {

										if (response >= 1) {

											var msg = "Template Data inserted Successfully.";
											alert(msg);
											

										} 
									}
								}

							});
						}

						})

		"use strict";
		//Class definition
		
		var template_id;
var html = "";

$.ajax({
	
	url : base +"/ipdAPI/ipdapi/gettemplate",
	
	type : "post",
	dataType : "json",
	async : false,
	data : {"template_id": template_id},
	success:function(data)
	{
		
		const row = data.find(d => d.template_id == template_id);
		data.forEach((row)=> {
			html +="<tr id= tr-id-2 class= tr-class-2>"
			html += "<td>"+row.template_id+"</td>"; 
			 html += "<td>"+row.template_name+"</td>";
	            html += "<td>"+row.template_desc+"</td>";
	          
     	       	 html += '<td><a href="javascript:update('+row.template_id+');" class="btn_template btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"/></g></svg></span>'
         

     	       	+ '<a href="javascript:deleteById('+row.template_id+');" class="btn_template btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
	            html +="</tr>"
		
		});
		 $(".data").html(html);
	}
	
});	

$(document).ready(function (){
	   var table = $('#table-id').DataTable();
	   
	  
	});

		 
		 function update(id){
			 
				$('.btn_template').hide();
				

				
				$('#updatetemplate').show();
				$("#addtemplate").hide();
				
				$.ajax({
			        type:"POST",
			        dataType: "json",
			        data:{"template_id": id},
					async : false,
					url : base +"/ipdAPI/ipdapi/gettemplate",
			        success:function(data)
			        {
			        	
			            const row = data.find(d => d.template_id ==id);
			           
			            $("#template_name").val(row.template_name);
			        	$("#template_desc").val(row.template_desc);
			        	
			        }
			     });
				
				 
				 // let update_by_id = temp_edit_id;
				 // console.log(update_by_id);
				$('#updatetemplate')
				.click(
						function() {
							 
							
							var template_name = $('#template_name').val();
							var template_desc = $('#template_desc').val();
							
							
							var flag = 2; // Addition

							$.ajax({
								url : base +"/ipdAPI/ipdapi/insertUpdatetemplate",
								
										type : "post",
										dataType : "json",
										async : false,
										data : {
											"template_name" : template_name,
											"template_desc" : template_desc,
											
											"flag" : flag,
											"template_id": id
										},
										error : function(xhr) {
											var msg = "(Data updation failed. Error : "
													+ xhr.status
													+ " "
													+ xhr.statusText;
											alert(msg);
										},
										success : function(response) {
											if (response != null) {

												if (response >= 1) {

													var msg = "Template Data updated Successfully.";
													alert(msg);

												} 
											}
										}
								   
									});
			   

						})
		 
		 }
		 
	

	"use strict";
		 
		$('#cancel')
		.click(
				function() {		
				window.location.reload();
				})
		 
		// Delete data by template_id
		function deleteById(id){
			if (confirm("Press OK to confirm!")) {
			$.ajax({
				url : base + "/ipdAPI/ipdapi/insertUpdatetemplate",
				
				type : "post",
				dataType : "json",
				async : false,
				data : {
					"template_name": "",
					"template_desc": "", 
					"template_id" : id,
					"flag" : 3
				},
				
				error : function(xhr) {
					var msg = "Data deletion failed. Error : "
							+ xhr.status
							+ " "
							+ xhr.statusText;
					alert(msg);
				},
				success : function(response) {
					if (response != null) {

						if (response >=1) {

							var msg = "Template Data deleted Successfully.";
							alert(msg);
							location.reload(true);

						} 
					}
				}

			});
			} else {
				  window.location.reload();
			  }
		}
		$(document).ready(function(){

			  // Search all columns
			  $('#txt_searchall').keyup(function(){
			    // Search Text
			    var search = $(this).val();

			    // Hide all table tbody rows
			    $('table tbody tr').hide();

			    // Count total search result
			    var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

			    if(len > 0){
			      // Searching text in columns and show match row
			      $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
			        $(this).closest('tr').show();
			      });
			    }else{
			      $('.notfound').show();
			    }

			  });

			});
		$.expr[":"].contains = $.expr.createPseudo(function(arg) {
			   return function( elem ) {
			     return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
			   };
			});

	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>