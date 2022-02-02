<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAFNA";
try {
%>
<%
String session1 = (String) session.getAttribute("login_id");
if (session.getAttribute("login_id") != null) {
 String sessionName = (String) session.getAttribute("login_id");
} else
 response.sendRedirect("../common/login.jsp");
%>	
<html lang="en">
<!--begin::Head-->
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
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
	z-index: 9999;
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
@keyframes show_slide { 0%{
	transform: translateX(100%);
}
40
%
{
transform:translateX(-10%);
}
80%
{
transform:translateX(0%);
}
100%{transform:translateX(-10px);
}
}
@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}40%
{
transform:translateX(0%);
}
80%{transform:translateX(-10%);
}
100%{transform:translateX(100%);
}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
</head>
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<!--begin::Main-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			<jsp:include page="/form/common/navbar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"	id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/header.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container d-flex align-items-stretch justify-content-between">
							<div class="col-xl-12 offset-xl-1">
								<h2	class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Template	Master</h2>
								<div class="col-xl-10 offset-xl-0">
									<div class="example mb-10">
										<div class="example-preview">
											<div class="card card-custom">
												<form class="form" id="kt_form_1">
													<div class="card-body">
														<div class="col-xl-8 offset-xl-2">
															<div class="form-group">
																<label>Template Name</label><span class="text-danger">*</span>
																<input type="text"
																	class="form-control form-control-solid"
																	name="templateName" id="template_name"
																	placeholder="Enter Template name" />
															</div>
															<div class="form-group">
																<label>Template Desc</label><span class="text-danger">*</span>
																<input type="text"
																	class="form-control form-control-solid"
																	name="templateCode" id="template_code"
																	placeholder="Enter Template Code" />
															</div>
														</div>
													</div>
													<div class="card-body table-responsive">
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
													<div class="text-center">
														<button type="submit" id="addMedicineMaster"
															class="btn font-weight-bold btn-primary mr-2">Submit</button>
														<button type="submit" id="updateMedicineMaster"
															class="btn font-weight-bold btn-primary mr-2">Update</button>
														<button type="button"
															class="btn font-weight-bold btn-secondary" id="cancel">Cancel</button>
													</div>
												</form>
												<!--end::Form-->
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-10 offset-xl-0">
									<div class="example mb-10">
										<div class="example-preview">
											<div class="card card-custom ">
												<br />
												<div class="input-icon ml-10" style="width: 30%;">
													<input type="text" class="form-control form-control-solid"
														placeholder="Search..." id="txt_searchall1" /> <span>
														<i class="flaticon2-search-1 text-muted"></i>
													</span>
												</div>

												<br />
												<table data-toggle="table" class='a'
													data-classes="table table-hover table-condensed "
													data-striped="true" data-sort-name="Quality"
													data-sort-order="desc" data-pagination="false"
													data-scroll="false" data-height=550 id="table-id">
													<thead>
														<tr>
															<th class="col-sm-1 text-center" data-field="NO"
																data-sortable="true">No</th>
															<th class="col-sm-2 text-center"
																data-field="template_name" data-sortable="true">Template
																Name</th>
															<th class="col-sm-3 text-center"
																data-field="template_code" data-sortable="true">Template
																Desc</th>
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
						<!--end::Container-->
					</div>
				</div>
				<!--end::Entry-->
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<!--end::Main-->
	</div>	
	<jsp:include page="../common/footer.jsp"></jsp:include>
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
	<!--end::Scrolltop-->
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	<script type="text/javascript">
$('#addMedicineMaster').show();
$('#updateMedicineMaster').hide();
var basePath='<%=basePath%>';    
var base='<%=base%>';  
var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();
today = dd + '/' + mm + '/' + yyyy;
var medData;
var r=0;
var table_len=(Mtable.rows.length);
$('#add ').click(function () {
	var i =table_len;
	  var html = ''; 
	  html += '<tr>';
	  html += '<td style="width: 3%;">' + i + '</td>';
	  html += '<td style="width: 12%;" ><input type="text" class="form-control medicineName" id="medicineName-' + i +'" name="medicineName" data-medicine-id="'+ i + '" placeholder="Medicine"></input></td>';
	  html += '<td style="width: 12%;"><input type="text" class="form-control category" name="category" id="category-' + i + '" placeholder="Category"></input></td>';
	  html += '<td style="width: 12%;"><input type="text" class="form-control type" name="type" id="type-' + i + '" placeholder="Type"></input></td>';
	  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid dose" name="dose" id="dose-' + i + '" placeholder="Dose" /></td>';
	  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid time" name="time" id="time-' + i + '" placeholder="Time" /></td>';
	  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid qty" name="qty" id="qty-' + i + '" placeholder="Qty" /></td>';
	  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="isSpecial" name="isSpecial" id="isSpecial-'+ i +'"/> <span></span></label></div></td>';
	  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="Is_Printable" name="Is_Printable" id="Is_Printable-'+ i +'"/> <span></span></label></div></td>';
	  html += '<td style="width: 25%;"><select class="form-control remark" name="remark" id="remark-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
	 html += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
	 $('.add_medicine').append(html); 
	  matches = i;
      $("#medicineModel").modal();
		 $.ajax({
				url : base + "/dssAPI/dfapi/getRemark",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1},
				success:function(data)
			    {
					data.forEach((element)=> {
					        $('#remark-' + i).append($(document.createElement('option')).prop({
				                value: element.remark_desc,
				                text: element.remark_name
				            }))
					});   
			    }
			});	
		 table_len++;
		 $('.add_medicine').on('click','.btn_delete',function(){
		$(this).closest('tr').remove();	
		});
		});
function update(id){
	$.ajax({
        type:"POST",
        dataType: "json",
        data:{"medicine_id": id},
		async : false,
        url: base + "/dssAPI/dfapi/getMedicineDetails",
        success:function(data)
        {
            const row = data.find(d => d.medicine_id ==id);
        	 $('#medicineName-'+ matches).val(row.medicine_name);
        	$("#type-"+ matches).val(row.medicine_type);
        	$("#category-"+ matches).val(row.medicine_category);
        	if(row.is_special == 'Y'){
        		$('#isSpecial-' + matches).prop("checked", true)
        	}
        	if(row.is_printable == 'Y'){
        		$('#Is_Printable-' + matches).prop("checked", true)
        	}
        }
     });
	 
	 $("#medicineModel").modal('hide');
} 
$(document).ready(function(){
	  // Search all columns
	  $('#txt_searchall').keyup(function(){
	    // Search Text
	    var search = $(this).val();
	    // Hide all table tbody rows
	    $('#popup_table tbody tr').hide();
	    // Count total search result
	    var len = $('#popup_table tbody tr:not(.notfound) td:contains("'+search+'")').length;
	    if(len > 0){
	      // Searching text in columns and show match row
	      $('#popup_table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
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
 $('#addMedicineMaster').click(function() {
	 var med = [];
	 $("table tbody tr").each(function(index) {
	 	if($(this).find('.medicineName').val() != null){
	 		var isSpecialValue =  $(this).find('.isSpecial').is(":checked");
	 		var isSpecial;
	 		if(isSpecialValue == true){
	 			isSpecial = "Y";
	 		}else{
	 			isSpecial = "N";
	 		}
	 		var isPrintableValue =  $(this).find('.Is_Printable').is(":checked");
	 		var isPrintable;
	 		if(isPrintableValue == true){
	 			isPrintable = "Y";
	 		}else{
	 			isPrintable = "N";
	 		}
	     med.push({ 
	         "medicineName": $(this).find('.medicineName').val(),
	         "type": $(this).find('.type').val(),
	         "category": $(this).find('.category').val(),
	         "dose":$(this).find('.dose').val(),
	         "time":$(this).find('.time').val(),
	         "qty":$(this).find('.qty').val(),
	         "remark":$(this).find('.remark').val(),
	         "is_special": isSpecial,
	         "isPrintable":isPrintable
	     	});
	 	}
	 });
	 var jsonString = JSON.stringify(med);
	 var template_name = $('#template_name').val();
	 var template_code = $('#template_code').val();
	 var flag = 1;
	 if(template_name != '' && template_code != ''){
	 	$.ajax({
	 		url : base + "/dssAPI/dfapi/insertUpdateMedicineTemplate",
	 		type : "post",
	 		dataType : "json",
	 		async : false,
	 		data : {
	 			"template_name" : template_name,
	 			"template_code" : template_code,
	 			"template_desc" : jsonString,
	 			"created_by" 	: '1',
	 			"created_date" 	: today,
	 			"updated_by" 	: '1',
	 			"update_date" 	: today,
	 			"flag" : flag
	 		},
	 		error : function(xhr) {
	 			var msg = "(Data insertion/updation failed. Error : "
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
	 					var msg = "Template Data inserted/Updated Successfully.";
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
	 }
	 })
	 "use strict";
	 var KTDatatableRemoteAjaxDemo = function() {
	     var demo2 = function() {
	 		var medicineId=null;
	         var datatable = $('#popup_table').KTDatatable({
	             // datasource definition
	             data: {
	                 type: 'remote',
	                 source: {
	                     read: {
	                         url: base + "/dssAPI/dfapi/getMedicineDetails",
	                         // sample custom headers
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
						scroll: true, // enable/disable datatable scroll both horizontal and vertical when needed.
						height: 550, // datatable's body's fixed height
						footer: false, // display/hide footer
					},
	            sortable: false,
	           pagination: false,
	             search: {
	                 input: $('#kt_datatable_search_query'),
	                 key: 'generalSearch'
	             },
	         columns: [{
	                 field: 'medicine_id',
	                 title: '#',
	                 sortable: 'false',
	                 type: 'number',
	                 selector: false,
	                 textAlign: 'center',
	             }, {
	                 field: 'medicine_name',
	                 title: 'Medicine Name',
	             }, {
	                 field: 'medicine_type',
	                 title: 'Medicine Type',
	             },{
	                 field: 'medicine_category',
	                 title: 'Medicine Category',
	             }, {
	                 field: 'Actions',
	                 title: ' Actions',
	                 sortable: false,
	                 overflow: 'visible',
	                 autoHide: false,
	                 template: function(row) {
	                     return '\
	                         <a href="javascript:update('+row.medicine_id+');" class="btn_edit btn-sm btn-clean btn-icon mr-2" title="Edit details" id="edit">\
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
	 	var template_id;
	 	var html = "";
	 	$.ajax({
	 		url : "http://localhost:8080/dssAPI/dfapi/getMedicineTemplateMaster",
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
	 		            html += "<td>"+row.template_code+"</td>";
	 	     	       	 html += '<td><a href="javascript:updateById('+row.template_id+');" class="btn_advice btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="12" height="2" rx="1"/></g></svg></span>'
	 	     	       	+ '<a href="javascript:deleteById('+row.template_id+');" class="btn_advice btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
	 		            html +="</tr>"
	 			});
	 			 $(".data").html(html);
	 		}
	 	});	
	 	$(document).ready(function (){
	 		   var table = $('#table-id').DataTable();
	 		});
	 return {
	 	// public functions
	 	init : function() {
	 		demo2();
	 	},
	 };
	 }();
 jQuery(document).ready(function() {
		 KTDatatableRemoteAjaxDemo.init();
		 });
$('#cancel').click(function() {		
	window.location.reload();
})	 
function updateById(id){
$('.btn_advice').hide();
$('#addMedicineMaster').hide();
$('#updateMedicineMaster').show();
$(window).scrollTop(0);
var template_id = id;
$.ajax({
			url : base + "/dssAPI/dfapi/getMedicineTemplateMaster",
			type : "post",
			dataType : "json",
			async : false,
			data : {"template_id": template_id},
			success:function(data)
        	{
				const row = data.find(d => d.template_id == template_id);
				$('#template_name').val(row.template_name);
				$('#template_code').val(row.template_code);
				const parsedData = JSON.parse(row["template_desc"]);
	         
					 $(parsedData).each(function(index) {
						r++;
							$('#medicineName-' + (index + 1)).val(parsedData[index]['medicineName']);
							$('#type-' + (index + 1)).val(parsedData[index]['type']);
							$('#category-' + (index + 1)).val(parsedData[index]['category']);
							$('#dose-' + (index + 1)).val(parsedData[index]['dose']);
							$('#time-' + (index + 1)).val(parsedData[index]['time']);
							$('#qty-' + (index + 1)).val(parsedData[index]['qty']);
							if(parsedData[index]['is_special'] == 'Y'){
								$('#isSpecial-' + (index + 1)).prop("checked", true)
							}
							$('#remark-' + (index + 1)).val(parsedData[index]['remark']);
							if(parsedData[index]['isPrintable'] == 'Y'){
								$('#Is_Printable-' + (index + 1)).prop("checked", true)
							}
						});
					 for(var i = 1; i <=r; i++){
						  var html = '';
						  html += '<tr>';
						  html += '<td style="width: 3%;">' + i + '</td>';
						  html += '<td style="width: 12%;" ><input type="text" class="form-control medicineName" id="medicineName-' + i +'" name="medicineName" data-medicine-id="'+ i + '"><option value="" disabled selected hidden>Select</option></select></td>';
						  html += '<td style="width: 12%;"><input type="text" class="form-control category" name="category" id="category-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
						  html += '<td style="width: 12%;"><input type="text" class="form-control type" name="type" id="type-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
						  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid dose" name="dose" id="dose-' + i + '" placeholder="Dose" /></td>';
						  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid time" name="time" id="time-' + i + '" placeholder="Time" /></td>';
						  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid qty" name="qty" id="qty-' + i + '" placeholder="Qty" /></td>';
						  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="isSpecial" name="isSpecial" id="isSpecial-'+ i +'"/> <span></span></label></div></td>';
						  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="Is_Printable" name="Is_Printable" id="Is_Printable-'+ i +'"/> <span></span></label></div></td>';
						  html += '<td style="width: 25%;"><input type="text" class="form-control remark" name="remark" id="remark-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
							 html += '<td style="width: 5%;"><a type="button" data-repeater-delete="";  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
						  $('.add_medicine').append(html);
				 }
					 const parsedData1 = JSON.parse(row["template_desc"]);
							 $(parsedData1).each(function(index) {
									$('#medicineName-' + (index + 1)).val(parsedData1[index]['medicineName']);
									$('#type-' + (index + 1)).val(parsedData1[index]['type']);
									$('#category-' + (index + 1)).val(parsedData1[index]['category']);
									$('#dose-' + (index + 1)).val(parsedData1[index]['dose']);
									$('#time-' + (index + 1)).val(parsedData1[index]['time']);
									$('#qty-' + (index + 1)).val(parsedData1[index]['qty']);
									if(parsedData1[index]['is_special'] == 'Y'){
										$('#isSpecial-' + (index + 1)).prop("checked", true)
									}
									$('#remark-' + (index + 1)).val(parsedData1[index]['remark']);
									if(parsedData[index]['isPrintable'] == 'Y'){
										$('#Is_Printable-' + (index + 1)).prop("checked", true)
									}
								});		
        	}
		});	
table_len=(Mtable.rows.length);
$('.add_medicine').on('click','.btn_delete',function(){
	$(this).closest('tr').remove();	
	});
$('#updateMedicineMaster').click(function() {
	var mList = [];
	$("table tbody tr").each(function(index) {
			if($(this).find('.medicineName').val() != null){
				var isSpecialValue =  $(this).find('.isSpecial').is(":checked");
				var isSpecial;
				if(isSpecialValue == true){
					isSpecial = "Y";
				}else{
					isSpecial = "N";
				}
				var isPrintableValue =  $(this).find('.Is_Printable').is(":checked");
		 		var isPrintable;
		 		if(isPrintableValue == true){
		 			isPrintable = "Y";
		 		}else{
		 			isPrintable = "N";
		 		}
				mList.push({ 
					 "medicineName": $(this).find('.medicineName').val(),
				        "type": $(this).find('.type').val(),
				        "category": $(this).find('.category').val(),
			           "dose":$(this).find('.dose').val(),
			           "time":$(this).find('.time').val(),
			           "qty":$(this).find('.qty').val(),
			          "remark":$(this).find('.remark').val(),
			           "is_special": isSpecial,
			           "isPrintable":isPrintable
			    });		
			}
		});
		var jsonString = JSON.stringify(mList);
						var template_name = $('#template_name').val();
						var template_code = $('#template_code').val();
						var template_desc = jsonString;
						var updated_by    = '1';
						var update_date   = today;
						var flag 		  = 2; // Update
						if(template_name != '' || template_code != ''){
						$.ajax({
								url : base + "/dssAPI/dfapi/insertUpdateMedicineTemplate",
								type : "post",
								dataType : "json",
								async : false,
								data : {
									"template_id" : template_id,
									"template_name" : template_name,
									"template_code" : template_code,
									"template_desc" : template_desc,
									"updated_by" 	: updated_by,
									"update_date" 	: update_date,
									"flag" : flag
								},
								error : function(xhr) {
									var msg = "(Data insertion/updation failed. Error : "
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
											var msg = "Template Data inserted/Updated Successfully.";
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
						}
					})
	"use strict";
} 
function deleteById(id){
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
        	$.ajax({
        		url : base + "/dssAPI/dfapi/insertUpdateMedicineTemplate",
        		type : "post",
        		dataType : "json",
        		async : false,
        		data : {
        			"template_id" : id,
        			"template_name":"0",
        			"template_code":"0",
        			"template_desc":"0",
        			"flag" : 3
        		},
        		error : function(xhr) {
        			var msg = "(Data deletion failed. Error : "
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
        				if (response >=1) {
        					var msg = "Template Data deleted Successfully.";
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
	  $('#txt_searchall1').keyup(function(){
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



