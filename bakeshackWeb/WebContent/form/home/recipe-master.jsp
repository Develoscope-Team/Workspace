<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAKESHACk";
try {
	String session1 = (String) session.getAttribute("login_id");
	if (session.getAttribute("login_id") != null) {
		String sessionName = (String) session.getAttribute("login_id");
	} else
		response.sendRedirect("../common/login.jsp");
%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet"	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
table.a {
	table-layout: auto;
	width: 100%;
}
.alert {
	padding: 20px 40px;
	min-width: 40%;
	position: fixed;
	right: 0;
	top: 10px;
	border-radius: 4px;
	border-left: 8px solid #ffa502;
	overflow: hidden;
	opacity: 0;
	pointer-events: none;
}
.alert.hide {
	animation: hide_slide 1s ease forwards;
}
.alert.showAlert {
	opacity: 1;
	pointer-events: auto;
}
.alert.show {
	animation: show_slide 1s ease forwards;
}
@keyframes show_slide { 0%{	transform: translateX(100%);}
40%{transform:translateX(-10%);}
80%{transform:translateX(0%);}
100%{transform:translateX(-10px);}
}
@keyframes hide_slide { 0%{	transform: translateX(-10px);}
40%{transform:translateX(0%);}
80%{transform:translateX(-10%);}
100%{transform:translateX(100%);}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
<!-- <link rel="shortcut icon" href="assets/BakeShack_IM/media/logos/favicon.ico" /> -->
</head>
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<!--end::Header Mobile-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Subheader-->
					<div class="subheader py-2 py-lg-12 subheader-transparent"
						id="kt_subheader">
						<div class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap mr-1">
								<!--begin::Heading-->
								<div class="d-flex flex-column">
									<!--begin::Title-->
									<h2 class="text-white font-weight-bold my-2 mr-5">Recipe Master</h2>
									<!--end::Title-->
								</div>
								<!--end::Heading-->
							</div>
							<!--end::Info-->
						</div>
					</div>
					<!--end::Subheader-->
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">
							<div class="col-xl-12 offset-xl-0">
								<div class="card card-custom gutter-b">
									<div class="card-body">
										<div class="example mb-10">
											<div class="example-preview">
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														<div class="card-body ">
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Recipe Name </label> <input type="text"
																			id="recipe_name"
																			class="form-control form-control-solid"
																			placeholder="Enter Recipe Name" />
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Recipe Code</label> <input type="text"
																			id="recipe_code"
																			class="form-control form-control-solid"
																			placeholder="Enter Recipe Code" />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Product</label> <select
																			class="form-control form-control-solid"
																			name="product" id="product">
																			<option value="" disabled selected hidden>Select Product</option>
																		</select>
																	</div>
																</div>
															</div>
														</div>
														<div class="card-body" style="overflow-x: auto;">
															<table class="table" id="Mtable">
																<thead>
																	<tr>
																		<th scope="col">No</th>
																		<th scope="col">Product</th>
																		<th scope="col">Unit</th>
																		<th scope="col">Raw qty(Main Unit)</th>
																		<th scope="col">Raw qty(Sub Unit)</th>
																		<th scope="col">Action</th>
																	</tr>
																</thead>
																<tbody class="add_product" id="add-product"></tbody>
															</table>
														</div>
														<div class="text-right mb-5 mr-22">
															<button type="button" id="add"
																class="btn font-weight-bold  btn-icon btn-light-success">
																<i class="la la-plus"></i>
															</button>
														</div>
														<div class="modal" id="medicineModel" tabindex="-1"
															role="dialog" aria-labelledby="staticBackdrop"
															aria-hidden="true">
															<div
																class="modal-dialog  modal-xl modal-dialog-scrollable"
																role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="history_patient_name"></h5>
																		<button type="button" class="close"
																			data-dismiss="modal" aria-label="Close">
																			<i aria-hidden="true" class="ki ki-close"></i>
																		</button>
																	</div>
																	<div class="modal-body">
																		<!-- <h3>THIS IS A modal for MEDISION SELECTION</h3> -->
																		<div class="input-icon ml-10" style="width: 30%;">
																			<input type="text"
																				class="form-control form-control-solid"
																				placeholder="Search..." id="txt_searchall" /> <span>
																				<i class="flaticon2-search-1 text-muted"></i>
																			</span>
																		</div>
																		<br />
																		<div class="datatable datatable-bordered datatable-head-custom"
																			id="kt_datatable"></div>
																	</div>
																	<div class="modal-footer">
																		<button type="button"
																			class="btn btn-light-primary font-weight-bold"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div>
														<div class="text-center">
															<button type="button" id="addRecipe"
																class="btn btn-primary mr-2">Submit</button>
															<button type="submit" id="updateRecipe"
																class="btn btn-primary mr-2">Update</button>
															<button type="button" class="btn btn-secondary"
																id="cancel">Cancel</button>
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
										<div class="input-icon ml-10" style="width: 30%;">
											<input type="text" class="form-control form-control-solid"
												placeholder="Search..." id="txt_searchall1" /> <span>
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
													<th class="col-sm-2 text-center" data-field="Recipe-Name"
														data-sortable="true">Recipe Name</th>
													<th class="col-sm-2 text-center" data-field="Product-Name"
														data-sortable="true">Product Name</th>
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
							<div class="alert alert-success  " role="alert"
								id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
							<div class="alert alert-danger " role="alert" id="danger_alert">
								<div class="alert-text">
									<span id="danger_msg"></span>
								</div>
							</div>
							<div class="alert alert-warning " role="alert" id="warning_alert">
								<div class="alert-text">
									<span id="warning_msg"></span>
								</div>
							</div>
						</div>
						<!--end::Container-->
					</div>
					<!--end::Entry-->
				</div>
				<!--end::Content-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"	height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">	<polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2" height="10" rx="1" />
						<path d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	<script type="text/javascript">
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
		$('#updateRecipe').hide();
		$("#addRecipe").show();
		$.ajax({
			url : base + "/bakeshackAPI/api/getProductDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1},
			success:function(data)
		    {
				data.forEach((element)=> {
				        $('#product').append($(document.createElement('option')).prop({
			                value: element.product_id,
			                text: element.product_name
			            }))
				});   
		    }
		});	
		var medData;
		var r=0;
		var table_len=(Mtable.rows.length);
		var i =0;
		$('#add ').click(function () {
			var table_len=(Mtable.rows.length);
		     i++;
			  var html = ''; 
			  html += '<tr>';
			  html += '<td style="width: 3%;">' + i + '</td>';
			  html += '<td style="width: 12%;" ><select type="text" class="form-control product" id="product-' + i +'" name="product" data-product-id="'+ i + '" placeholder="Product"><option value="" disabled selected hidden>Select Product</option></select></td>';
			  html += '<td style="width: 12%;"><select type="text" class="form-control unit" name="unit" id="unit-' + i + '" placeholder="Category"><option value="" disabled selected hidden>Select Unit</option></td>';
			  html += '<td style="width: 12%;"><input type="text" class="form-control raw_qty" name="raw_qty" id="raw_qty_main_unit-' + i + '" placeholder="Raw Qty" oninput="weightConverter(' + i + ',this.value)" onchange="weightConverter(' + i + ',this.value)"></input></td>';
			  html += '<td style="width: 12%;"><input type="text" class="form-control raw_qty_sub" name="raw_qty_sub" id="raw_qty_sub_unit-' + i + '" placeholder="Raw Qty"  oninput="weightConverterInGm(' + i + ',this.value)" onchange="weightConverterInGm(' + i + ',this.value)"></input></td>';
			  html += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
			 $('.add_product').append(html); 
			 matches = i;
		      $("#medicineModel").modal();
				 /* $('.add_product #product-'+ i).dblclick(function () {
					   mname=(this.id);
					  var str = mname;
			           matches = str.match(/(\d+)/);
					  $("#medicineModel").modal();
					});
			 */
				 $.ajax({
						url : base + "/bakeshackAPI/api/getProductDetails",
						type : "post",
						dataType : "json",
						async : false,
						data : {"flag":1},
						success:function(data)
					    {
							data.forEach((element)=> {
							        $('#product-'+i).append($(document.createElement('option')).prop({
						                value: element.product_name,
						                text: element.product_name
						            }))
							});   
					    }
					});	
				 $.ajax({
						url : base + "/bakeshackAPI/api/getUnitDetails",
						type : "post",
						dataType : "json",
						async : false,
						data : {"flag":1},
						success:function(data)
					    {
							data.forEach((element)=> {
							        $('#unit-'+i).append($(document.createElement('option')).prop({
						                value: element.unit_code,
						                text: element.unit_code
						            }))
							});   
					    }
					});	
				 table_len++;
				});
		 $('.add_product').on('click','.btn_delete',function(){
				$(this).closest('tr').remove();	
				});
		 function weightConverter(i,valNum) {
			var unit = $('#unit-'+i).val();
			if(unit == 'piece'){
				 $('#raw_qty_sub_unit-'+i).val(valNum);
			 }else{
			     $('#raw_qty_sub_unit-'+i).val(valNum*1000);
			 }
				}
		 function weightConverterInGm(i,valNum) {
			 var unit = $('#unit-'+i).val();
			 if(unit == 'piece'){
				 $('#raw_qty_main_unit-'+i).val(valNum);
			 }else{
				 $('#raw_qty_main_unit-'+i).val(valNum/1000);
			 }
			}
		$('#addRecipe').click(function() {
			 var med = [];
			 $("table tbody tr").each(function(index) {
			 	if($(this).find('.product').val() != null){
			     med.push({ 
			         "product": $(this).find('.product').val(),
			         "Unit": $(this).find('.unit').val(),
			         "Raw_qty": $(this).find('.raw_qty').val(),
			         "Raw_qty_sub": $(this).find('.raw_qty_sub').val()
			     	});
			 	}
			 });
			 var jsonString = JSON.stringify(med);
							var recipe_name = $('#recipe_name').val();
							var recipe_code = $('#recipe_code').val();
							var product = $('#product').val();
							var product_req = jsonString;
							var flag 		  = 1; // Addition
							if(recipe_name != '' || recipe_code != ''){
								$.ajax({
									url : base + "/bakeshackAPI/api/insertUpdateRecipe",
									type : "post",
									dataType : "json",
									async : false,
									data : {
										"recipe_name" : recipe_name,
										"recipe_code" : recipe_code,
										"product" : product,
										"product_req" : product_req,
										"flag" : flag
									},
									error : function(xhr) {
										var msg = "(insertUpdateRecipe)Sorry but there was an error : "
												+ xhr.status
												+ " "
												+ xhr.statusText;
										 $('#warning_msg').text(msg);
										 $('#warning_alert').addClass("show");
								           $('#warning_alert').removeClass("hide");
								           $('#warning_alert').addClass("showAlert");
								           setTimeout(function(){
								             $('#warning_alert').removeClass("show");
								             $('#warning_alert').addClass("hide");
								           },2000);
									},
									success : function(response) {
										if (response != null) {
											if (response >= 1) {
												var msg = "Recipe Data inserted/Updated Successfully.";
												 $('#success_msg').text(msg);
												 $('#success_alert').addClass("show");
										           $('#success_alert').removeClass("hide");
										           $('#success_alert').addClass("showAlert");
										           setTimeout(function(){
										             $('#success_alert').removeClass("show");
										             $('#success_alert').addClass("hide");
										           },2000);
												location.reload(true);
											} 										}
									}
								});
							}
                          window.location.reload();
						})
				"use strict";
		var KTBootstrapDaterangepicker = function() {
			// Private functions
			var demo2 = function() {
		var medicineId=null;
      var datatable = $('#kt_datatable').KTDatatable({
          // datasource definition
          data: {
              type: 'remote',
              source: {
                  read: {
                      url: base + "/bakeshackAPI/api/getPurchaseProductDetails",
                      // sample custom headers
                      // headers: {'x-my-custom-header': 'some value', 'x-test-header': 'the value'},
                      map: function(raw) {
                          // sample data mapping
                          var dataSet = raw;
                          if (typeof raw.data !== 'undefined') {
                              dataSet = raw.data;
                          }
                          return dataSet;
                      },
                  },
              },
              pageSize: 10,
              serverPaging: true,
              serverFiltering: true,
              serverSorting: true,
          },
         layout: {
              scroll: true,
              footer: false,
          },
         sortable: true,
        pagination: false,
          search: {
              input: $('#kt_datatable_search_query'),
              key: 'generalSearch'
          },
      columns: [{
              field: 'product_id',
              title: '#',
              sortable: 'asc',
              width: 30,
              type: 'number',
              selector: false,
              textAlign: 'center',
          }, {
              field: 'product_name',
              title: 'Product Name',
          },{
              field: 'subcategory',
              title: 'Product subCategory',
          }, {
              field: 'unit',
              title: 'Unit',
          }, {
              field: 'selling_price',
              title: 'Price ',
          }, {
              field: 'Actions',
              title: ' Actions',
              sortable: false,
              width: 125,
              overflow: 'visible',
              autoHide: false,
              template: function(row) {
                  return '\
                      <a href="javascript:updateby('+row.product_id+');" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details" id="edit">\
                      <span class="svg-icon svg-icon-md svg-icon-2x">\
                     <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">\
                      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">\
                          <polygon points="0 0 24 0 24 24 0 24"/>\
                          <rect fill="#000000" opacity="0.3" x="11" y="7" width="2" height="14" rx="1"/>\
                          <path d="M6.70710678,20.7071068 C6.31658249,21.0976311 5.68341751,21.0976311 5.29289322,20.7071068 C4.90236893,20.3165825 4.90236893,19.6834175 5.29289322,19.2928932 L11.2928932,13.2928932 C11.6714722,12.9143143 12.2810586,12.9010687 12.6757246,13.2628459 L18.6757246,18.7628459 C19.0828436,19.1360383 19.1103465,19.7686056 18.7371541,20.1757246 C18.3639617,20.5828436 17.7313944,20.6103465 17.3242754,20.2371541 L12.0300757,15.3841378 L6.70710678,20.7071068 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000003, 16.999999) scale(1, -1) translate(-12.000003, -16.999999) "/>\
                          <rect fill="#000000" opacity="0.3" x="3" y="3" width="18" height="2" rx="1"/>\
                      </g>\
                    </svg>\
                  </span>\
                      </a>\
                     ';
              },
          }],

      });
  };
  return {
		init : function() {
			demo2();
		}
	};
}();

jQuery(document).ready(function() {
	KTBootstrapDaterangepicker.init();
});	

function updateby(id){
	$.ajax({
        type:"POST",
        dataType: "json",
        data:{"product_id": id},
		async : false,
        url: base + "/bakeshackAPI/api/getProductDetails",
        success:function(data)
        {
            const row = data.find(d => d.product_id ==id);
            $('#product-'+ matches).val(row.product_name);
            $("#unit-"+ matches).val(row.unit);
        	$("#unit_rate-"+ matches).val(row.selling_price);
        }
     });
	 $("#medicineModel").modal('hide');
} 
		var recipe_id;
		var html = "";
		$.ajax({
			url : base + "/bakeshackAPI/api/getRecipeDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"recipe_id": recipe_id},
			success:function(data)
			{
				const row = data.find(d => d.recipe_id == recipe_id);
				data.forEach((row)=> {
					html +="<tr id= tr-id-2 class= tr-class-2>"
					html += "<td>"+row.recipe_id+"</td>"; 
					 html += "<td>"+row.recipe_name+"</td>";
			            html += "<td>"+row.product+"</td>";
		     	       	 html += '<td><a href="javascript:update('+row.recipe_id+');" class="btn_action btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="12" height="2" rx="1"/></g></svg></span>'
		     	       	+ '<a href="javascript:deleteById('+row.recipe_id+');" class="btn_action btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
			            html +="</tr>"
				});
				 $(".data").html(html);
			}
		});	
		$(document).ready(function (){
			   var table = $('#table-id').DataTable();
			});
		// Update data by recipe name and id
		function update(recipe_id) {
			$('.btn_action').hide();
			$(window).scrollTop(0);
			$('#updateRecipe').show();
			$("#addRecipe").hide();
			$.ajax({
				url : base + "/bakeshackAPI/api/getRecipeDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1,},
				success:function(data)
		        {
					const row = data.find(d => d.recipe_id == recipe_id);
					if(row != null){
						$('#recipe_name').val(row.recipe_name);
						$('#recipe_code').val(row.recipe_code);
						var product = row.product;
						$.ajax({
							url : base + "/bakeshackAPI/api/getProductDetails",
							type : "post",
							dataType : "json",
							async : false,
							data : {"flag":1,},
							success:function(data)
					        {
								const raw = data.find(d => d.product_name == row.product);
								console.log(row);
								if(raw != null){
									$('#product').val(raw.product_id);
								}
					        }
						});
						const parsedData = JSON.parse(row["product_req"]);
						 $(parsedData).each(function(index) {
								r++;
									$('#product-' + (index + 1)).val(parsedData[index]['product']);
									$('#unit-' + (index + 1)).val(parsedData[index]['Unit']);
									$('#raw_qty_main_unit-' + (index + 1)).val(parsedData[index]['Raw_qty']);
									$('#raw_qty_sub_unit-' + (index + 1)).val(parsedData[index]['Raw_qty_sub']);
								});
						 for(var i = 1; i <=r; i++){
							 var html = ''; 
							  html += '<tr>';
							  html += '<td style="width: 3%;">' + i + '</td>';
							  html += '<td style="width: 12%;" ><input type="text" class="form-control product" id="product-' + i +'" name="product" data-product-id="'+ i + '" placeholder="Product"><option value="" disabled selected hidden>Select Product</option></input></td>';
							  html += '<td style="width: 12%;"><input type="text" class="form-control unit" name="unit" id="unit-' + i + '" placeholder="Category"><option value="" disabled selected hidden>Select Unit</option></input></td>';
							  html += '<td style="width: 12%;"><input type="text" class="form-control raw_qty" name="raw_qty" id="raw_qty_main_unit-' + i + '" placeholder="Raw Qty" oninput="weightConverter(' + i + ',this.value)" onchange="weightConverter(' + i + ',this.value)"></input></td>';
							  html += '<td style="width: 12%;"><input type="text" class="form-control raw_qty_sub" name="raw_qty_sub" id="raw_qty_sub_unit-' + i + '" placeholder="Raw Qty" oninput="weightConverterInGm(' + i + ',this.value)" onchange="weightConverterInGm(' + i + ',this.value)" ></input></td>';
							  html += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
							 $('.add_product').append(html); 
					 }
					 const parsedData1 = JSON.parse(row["product_req"]);
						 $(parsedData1).each(function(index) {
							 $('#product-' + (index + 1)).val(parsedData1[index]['product']);
								$('#unit-' + (index + 1)).val(parsedData1[index]['Unit']); 
								$('#raw_qty_main_unit-' + (index + 1)).val(parsedData1[index]['Raw_qty']);
								$('#raw_qty_sub_unit-' + (index + 1)).val(parsedData[index]['Raw_qty_sub']);
							});		
						 i = r;
					}
		        }	
			});				
			$('#updateRecipe').click(function() {
								 var med = [];
								 $("table tbody tr").each(function(index) {
								 	if($(this).find('.product').val() != null){
								     med.push({ 
								         "product": $(this).find('.product').val(),
								         "Unit": $(this).find('.Unit').val(),
								         "Raw_qty": $(this).find('.raw_qty').val(),
								         "Raw_qty_sub": $(this).find('.raw_qty_sub').val()  
								     	});
								 	}
								 });
								 var jsonString = JSON.stringify(med);
												var recipe_name = $('#recipe_name').val();
												var recipe_code = $('#recipe_code').val();
												var product = $('#product').val();
												var product_req = jsonString;
								var flag = 2; // Addition
								if (recipe_name != '') {
									$.ajax({
												url : base + "/bakeshackAPI/api/insertUpdateRecipe",
												type : "post",
												dataType : "json",
												async : false,
												data : {
													"recipe_id" : recipe_id,
													"recipe_name" : recipe_name,
													"recipe_code" : recipe_code,
													"product" : product,
													"product_req" : product_req,
													"flag" : flag
												},
												error : function(xhr) {
													var msg = "(insertUpdateRecipe)Sorry but there was an error : "
															+ xhr.status
															+ " "
															+ xhr.statusText;
													 $('#warning_msg').text(msg);
													 $('#warning_alert').addClass("show");
											           $('#warning_alert').removeClass("hide");
											           $('#warning_alert').addClass("showAlert");
											           setTimeout(function(){
											             $('#warning_alert').removeClass("show");
											             $('#warning_alert').addClass("hide");
											           },2000);
												},
												success : function(response) {
													if (response != null) {

														if (response >= 1) {

															var msg = "Recipe Data Updated Successfully.";
															 $('#success_msg').text(msg);
															 $('#success_alert').addClass("show");
													           $('#success_alert').removeClass("hide");
													           $('#success_alert').addClass("showAlert");
													           setTimeout(function(){
													             $('#success_alert').removeClass("show");
													             $('#success_alert').addClass("hide");
													           },2000);
														}
													}
												}
											});
							               window.location.reload();
								}
							})
			"use strict";
		}
		$('#cancel').click(function() {		
               window.location.reload();
            	})
		table_len=(Mtable.rows.length);
		// Delete data by Recipe_id
		function deleteById(id) {
			var recipe_id = id;
			Swal.fire({
		        title: "Are you sure?",
		        text: "You want to Delete Data!",
		        icon: "warning",
		        showCancelButton: true,
		        confirmButtonText: "Yes, delete it!",
		        cancelButtonText: "No, cancel!",
		        reverseButtons: true
		    }).then(function(result) {
		        if (result.value) {
			var flag = 3;
			$.ajax({
						url : base + "/bakeshackAPI/api/insertUpdateRecipe",
						type : "post",
						dataType : "json",
						async : false,
						data : {
							"recipe_id" : recipe_id,
							"recipe_name" :"" ,
							"recipe_code" :"" ,
							"product" : "",
							"product_req" : "",
							"flag" : flag
						},
						error : function(xhr) {
							var msg = "(insertUpdateRecipe)Sorry but there was an error : "
									+ xhr.status + " " + xhr.statusText;
							 $('#warning_msg').text(msg);
							 $('#warning_alert').addClass("show");
					           $('#warning_alert').removeClass("hide");
					           $('#warning_alert').addClass("showAlert");
					           setTimeout(function(){
					             $('#warning_alert').removeClass("show");
					             $('#warning_alert').addClass("hide");
					           },2000);
						},
						success : function(response) {
							if (response != null) {

								if (response >= 1) {

									var msg = "Recipe Data deleted Successfully.";
									 $('#danger_msg').text(msg);
										$('#danger_alert').addClass("show");
							   	           $('#danger_alert').removeClass("hide");
							   	           $('#danger_alert').addClass("showAlert");
							   	           setTimeout(function(){
							   	             $('#danger_alert').removeClass("show");
							   	             $('#danger_alert').addClass("hide");
							   	           },2000);
									location.reload(true);

								}
							}
						}
					});
			
	        } else if (result.dismiss === "cancel") {
	            window.location.reload();
	        }
	    });
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
 		
 		  $(document).ready(function(){
			  // Search all columns
			  $('#txt_searchall1').keyup(function(){
			    // Search Text
			    var search = $(this).val();
			    // Hide all table tbody rows
			    $('table .data tr').hide();
			    // Count total search result
			    var len = $('table .data tr:not(.notfound) td:contains("'+search+'")').length;
			    if(len > 0){
			      // Searching text in columns and show match row
			      $('table .data tr:not(.notfound) td:contains("'+search+'")').each(function(){
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
		
		document.addEventListener('keypress', function (e) {
		    if (e.keyCode === 13 || e.which === 13) {
		        e.preventDefault();
		        return false;
		    }
		}); 		
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>