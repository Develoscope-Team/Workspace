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
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading" 
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;">
	<!--begin::Main-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
      <jsp:include page="/form/common/navbar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/header.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container d-flex align-items-stretch justify-content-between">
							<div class="col-xl-12 offset-xl-1">
				     <h2 class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Medical Representative	Entry</h2> 
									<div class="col-xl-10 offset-xl-0">
										<div class="example mb-10">
											<div class="example-preview">
								<div class="card card-custom gutter-b">
									<div class="card-body">
										<div class="example mb-10">
											<div class="example-preview">
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														<div class=" ">
															<div class="row">
																<div class="col-xl-6">
																	<div class="form-group">
																		<label>Medical Representative Name</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid form-control-lg"
																				name="mr_name" id="mr_name" /><span
																				class="msg text-danger" id="type1"> </span>
																		</div>
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Company Name</label> <select
																			class="form-control form-control-solid"
																			id="company_name">
																			<option value="">Select a Company</option>
																		</select>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>MR Code</label> <input type="text"
																			class="form-control form-control-solid"
																			id="mr_code" disabled />
																	</div>
																</div>
																<div class="col-lg-5">
																	<div class="form-group">
																		<label>Mobile</label> <input type="text"
																			class="form-control form-control-solid"
																			id="mobile_no" /> <span class="msg text-danger"
																			id="type2"> </span>
																	</div>
																</div>
																	<div class="col-lg-1">
																	<div class="form-group ">
																		<button type="button" id="add_user"
																			class="btn font-weight-bold mt-10 btn-icon ">
																			<span class="svg-icon svg-icon-primary svg-icon-2x">
																				<!--begin::Svg Icon | path:/var/www/preview.keenthemes.com/metronic/releases/2021-05-14-112058/theme/html/demo1/dist/../src/media/svg/icons/Communication/Add-user.svg-->
																				<svg xmlns="http://www.w3.org/2000/svg"
																					xmlns:xlink="http://www.w3.org/1999/xlink"
																					width="24px" height="24px" viewBox="0 0 24 24"
																					version="1.1">
                                                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                    <polygon points="0 0 24 0 24 24 0 24" />
                                                                                              <path
																						d="M18,8 L16,8 C15.4477153,8 15,7.55228475 15,7 C15,6.44771525 15.4477153,6 16,6 L18,6 L18,4 C18,3.44771525 18.4477153,3 19,3 C19.5522847,3 20,3.44771525 20,4 L20,6 L22,6 C22.5522847,6 23,6.44771525 23,7 C23,7.55228475 22.5522847,8 22,8 L20,8 L20,10 C20,10.5522847 19.5522847,11 19,11 C18.4477153,11 18,10.5522847 18,10 L18,8 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
																						fill="#000000" fill-rule="nonzero" opacity="0.3" />
                                                                                                <path
																						d="M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
																						fill="#000000" fill-rule="nonzero" />
                                                                                       </g>
                                                                                </svg> <!--end::Svg Icon-->
																			</span>
																		</button>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Visit Date</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid form-control-lg"
																			placeholder="DD/MM/YYYY" name="visit_date"
																			id="visit_date" />
																	</div>
																</div>
															</div>
															<div class="card-body" style="overflow-x: auto;">
																<table class="table" id="Mtable">
																	<thead>
																		<tr>
																			<th scope="col">No</th>
																			<th scope="col">Product</th>
																			<th scope="col">Unit Rate</th>
																			<th scope="col">Sample's Given</th>
																			<th scope="col">Action</th>
																		</tr>
																	</thead>
																	<tbody class="add_product" id="add-product"></tbody>
																</table>
															</div>
															<div class="text-right mb-5 mr-22">
																<button type="button" id="add"
																	class="btn font-weight-bold btn-primary ">ADD
																</button>
															</div>
															<div class="card-footer">
																<div class="row">
																	<div class="col-lg-10 offset-1 text-center">
																		<button type="button" id="add_sales_order"
																			class="btn font-weight-bold btn-primary ">Submit</button>
																		<button type="button" id="cancel"
																			class="btn font-weight-bold btn-secondary">Cancel</button>
																	</div>
																</div>
															</div>
														</div>
													</form>
													<!--end::Form-->
												</div>
											</div>
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
						<!--end::Container-->
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
	</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script type="text/javascript">
var basePath='<%=basePath%>';    
var base='<%=base%>';  
var today = new Date();
var dd = today.getDate();
if(dd < 10)
	 {
	    dd = '0' + dd;
	 }
var mm = today.getMonth()+1;
if(mm < 10)
	 {
	    mm = '0' + mm;
	 }
var date = today.getFullYear()+'-'+mm+'-'+ dd;
$('#visit_date').val(date);
var mrName = [];
$.ajax({
url : base + "/dssAPI/dfapi/getmrDetails",
type : "post",
dataType : "json",
async : false,
data : {"flag":1},
success:function(data)
{
	if(data != null){
		data.forEach(function(e){
			mrName.push(e.mr_name);
		})
	}  
}
});
 var bloodhound = new Bloodhound({
     datumTokenizer: Bloodhound.tokenizers.whitespace,
     queryTokenizer: Bloodhound.tokenizers.whitespace,
     // `states` is an array of state names defined in "The Basics"
     local: mrName
 });
 $('#mr_name').typeahead({
     hint: true,
     highlight: true,
     minLength: 1
 }, {
     name: 'mrName',
     source: bloodhound
 });
	var mrcode = 0;
 $('#mr_name').change(function(){
		var mr_name = $(this).val();
		$.ajax({
			url : base + "/dssAPI/dfapi/getmrDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				const row = data.find(d => d.mr_name == mr_name);
				if(row != null){
					 mrcode = row.customer_code; 
					 $('#mr_name').val(row.mr_name);
						$('#mr_code').val(row.mr_code);
						$('#mobile_no').val(row.mobile_no);
						$('#company_name').val(row.company_name);
				}else{
					$('#mr_code').val("");
				}
	        }
		});	
})
$('#add_user ').click(function () {
	var mr_name = $('#mr_name').val();
	var mobile_no = $('#mobile_no').val();
	var company = $('#company_name').val();
	var flag 		  = 1; 
	if(mr_name != '' ){
		$.ajax({
			url : base + "/dssAPI/dfapi/insertUpdatemr",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"mr_name" : mr_name,
				"mobile_no" : mobile_no,
				"company_name" : company,
				"flag" : flag
			},
			error : function(xhr) {
				var msg = "(insertUpdateRecipe)Sorry but there was an error : "
						+ xhr.status
						+ " "
						+ xhr.statusText;
				alert(msg);
			},
			success : function(response) {
				if (response != null) {
					if (response >= 1) {
						var msg = "Medical Representative Data inserted/Updated Successfully.";
						$('#success_msg').text(msg);
						 $('#success_alert').addClass("show");
				           $('#success_alert').removeClass("hide");
				           $('#success_alert').addClass("showAlert");
				           setTimeout(function(){
				             $('#success_alert').removeClass("show");
				             $('#success_alert').addClass("hide");
				           },2000);
					} 										}
			}
		});
	}
	$.ajax({
		url : base +"/dssAPI/dfapi/getmrDetails",
		type : "post",
		dataType : "json",
		async : false,
		success:function(data)
    	{
			//data.forEach((element)=> {
			const row = data.find(d => d.mr_name == mr_name);
			data.forEach((row)=> {
			$('#mr_name').val(row.mr_name);
			$('#mr_code').val(row.mr_code);
			$('#mobile_no').val(row.mobile_no);
			$('#company_name').val(row.company_name);
			//$('#delivery_address').val(row.address);
			});
    	}
	});	
})
$.ajax({
	url : base + "/dssAPI/dfapi/getCompanyDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"flag":1},
	success:function(data)
    {
		data.forEach((element)=> {
		        $('#company_name').append($(document.createElement('option')).prop({
	                value: element.company_name,
	                text: element.company_name
	            }))
		});   
    }
});	
var i =0;
$('#add ').click(function () {
	  i++;
	  var html = ''; 
	  html += '<tr>';
	  html += '<td style="width: 3%;">' + i + '</td>';
	  html += '<td style="width: 35%;" ><input type="text" class="typeahead form-control Product" id="product-' + i +'" name="product" data-product-id="'+ i + '" placeholder="Product"></input></td>';
	  html += '<td style="width: 12%;"><input type="text" class="form-control Unit" name="unit" id="unit-' + i + '" placeholder="unit rate"></input></td>';
	  html += '<td style="width: 12%;"><input type="text" class="form-control Quantity" name="raw_qty" id="raw_qty-' + i + '" placeholder="sample Qty" ></input></td>';
	  html += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
	 $('.add_product').append(html); 
})
 $('.add_product').on('click','.btn_delete',function(){
				$(this).closest('tr').remove();	
 })
 $('#add_sales_order').click(function() {
	     var mr_name = $('#mr_name').val();
	     var mr_code = $('#mr_code').val();
	     var visit_date = $('#visit_date').val();
	     var company_name = $('#company_name').val();
	     var mobile_no = $('#mobile_no').val();
	     var product_count=0;
		 var productList = [];
		 $("table tbody tr").each(function(index) {
			 if($(this).find('.product').val() != null){
					product_count++;
		 		 productList.push({ 
		         "product": $(this).find('.Product').val(),
		         "unit": $(this).find('.Unit').val(),
		         "quantity": $(this).find('.Quantity').val()
		     	}); 
		 	}
		 });
	var jsonString = JSON.stringify(productList);
	if(mr_code != "")
	{
	$.ajax({
		url : base + "/dssAPI/dfapi/insertUpdatemrvisit",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"mr_name" : mr_name,
			"mr_code" : mr_code,
			"mobile_no" : mobile_no,
			"company_name" : company_name,
			"product_list" : jsonString,	
			"visit_date" : visit_date,
			"flag" : 1
		},
		error : function(xhr) {
			var msg = "(insertUpdateOrderBookingDetails)Sorry but there was an error : "
					+ xhr.status
					+ " "
					+ xhr.statusText;
			alert(msg);
		},
		success : function(response) {
			if (response != null) {
				if (response >= 1) {
					var msg = "Visit Data inserted Successfully.";
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
	else{
		Swal.fire({
	        title: "Please",
	        text: " Add Medical Represenatative Details!!",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonText: "OK",
	        reverseButtons: true
	    }).then(function(result) {
	        if (result.value) {
	        } else if (result.dismiss === "cancel") {
	            window.location.reload();
	        }
	    });
	}
 })
</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%> 