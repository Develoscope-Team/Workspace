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
<head>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
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
<jsp:include page="../common/header.jsp"></jsp:include>


<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			<jsp:include page="/form/common/sidebar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/navbar.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">

							 <h2
								class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3 mb-5">Medical Representative
								Entry</h2> 


							<div class="col-xl-12 offset-xl-0">
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

															<!-- <div class="row">
																<div class="col-lg-6">
																	<div class="form-group" id="amount_div">
																		<label>Amount</label> <span class="text-danger"
																			id="type">*</span><input type="number"
																			class="form-control form-control-solid" name="amount"
																			id="amount" placeholder="Enter Amount" />
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group" id="amount_div">
																		<label>Discount</label> ><input type="number"
																			class="form-control form-control-solid"
																			name="discount" id="discount"
																			placeholder="Enter Discount" />
																	</div>
																</div>
															</div> -->

															<!-- <div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Payment mode</label> <select name="paymentMode"
																			id="paymentMode"
																			class="form-control form-control-solid">
																			<option value="cash">Cash</option>
																			<option value="upi">UPI</option>
																			<option value="nb">Net Banking</option>
																			<option value="cheque">Cheque</option>
																			<option value="credit">Credit</option>
																		</select>
																	</div>
																</div>

																<div class="col-lg-4">
																	<div class="form-group" id="amount_div">
																		<label>Total Amount</label> <span class="text-danger"
																			id="type">*</span><input type="number"
																			class="form-control form-control-solid"
																			name="invoice_total" id="total_amount"
																			placeholder="Enter Total Amount" disabled />
																	</div>
																</div>

																<div class="col-lg-2">
																	<div class="form-group" id="amount_div">
																		<label>If Paid Advance</label> <span
																			class="switch switch-outline switch-icon switch-primary switch-sm ">
																			<label> <input type="checkbox" name="select"
																				id="if_partial" /> <span></span>
																		</label>
																		</span>
																	</div>
																</div>

															</div>
 -->

															<!-- <div class="row">
																<div class="col-lg-6">
																	<div class="form-group" id="upi_div">
																		<label>UPI Name</label> <select type="text"
																			class="form-control form-control-solid" name="upi_id"
																			id="upi_id" placeholder="Enter UPI Transaction Id">
																			<option value="" disable hidden field>select
																				UPI</option>
																		</select>
																	</div>
																	<div class="form-group" id="nb_div">

																		<label>Received Bank</label> <select
																			class="form-control form-control-solid"
																			id="received_bank">
																			<option value="">Select a bank</option>

																		</select>
																	</div>
																	
																	   <div class="form-group" id="credit_div">
									
										<label>Credit Period</label> <input type="text"
													class="form-control form-control-solid" id="credit_period">
													
													 
													 </input> 
									</div>

																</div>





																<div class="col-lg-6">
																	<div class="form-group" id="amount_div1">
																		<label>Advance Paid Amount</label> <span
																			class="text-danger" id="type">*</span><input
																			type="number" class="form-control form-control-solid"
																			name="invoice_paid_total" id="partially_paid_amount"
																			placeholder="Enter Total Amount" />
																	</div>
																</div>
															</div> -->



															<!-- <div class="row" id="bank_details1">
																<div class="col-lg-6">
																	<div class="form-group" id="amount_div">
																		<label>Branch Name</label> <span class="text-danger"
																			id="type">*</span><input type="text"
																			class="form-control form-control-solid"
																			name="branch_name" id="branch_name"
																			placeholder="Enter Branch Namel" />
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group" id="amount_div">
																		<label>Account No</label> <span class="text-danger"
																			id="type">*</span><input type="number"
																			class="form-control form-control-solid"
																			name="account_no" id="account_no"
																			placeholder="Enter Account No" />
																	</div>
																</div>
															</div> -->



															<!-- <div class="modal" id="medicineModel" tabindex="-1"
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
																			<h3>THIS IS A modal for MEDISION SELECTION</h3>
																			 <div class="input-icon ml-10" style = "width: 30%;">
																<input type="text" class="form-control form-control-solid" placeholder="Search..." id="txt_searchall" />
																<span>
																	<i class="flaticon2-search-1 text-muted"></i>
																</span>
															</div>
																			<div class="input-icon ml-10" style="width: 30%;">
																				<input type="text"
																					class="form-control form-control-solid"
																					placeholder="Search..." id="txt_searchall" /> <span>
																					<i class="flaticon2-search-1 text-muted"></i>
																				</span>
																			</div>
																			<br />
																			<div
																				class="datatable datatable-bordered datatable-head-custom"
																				id="kt_datatable"></div>


																		</div>
																		<div class="modal-footer">
																			<button type="button"
																				class="btn btn-light-primary font-weight-bold"
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div> -->

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
var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+ dd;
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
						alert(msg);

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
	
	alert(mr_name);
	alert(mr_code);
	alert(visit_date);
	alert(company_name);
	alert(mobile_no);
	alert(jsonString);
	
	
	
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
					alert(msg);

				} 
			}
		}

	}); 
	
	
	
	 
 })



</script>

</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%> 