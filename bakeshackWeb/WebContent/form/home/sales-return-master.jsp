<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "BAKESHACk";
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
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
						<div
							class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap mr-1">
								<!--begin::Heading-->
								<div class="d-flex flex-column">
									<!--begin::Title-->
									<h2 class="text-white font-weight-bold my-2 mr-5">Sales & Return Entry</h2>
										
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

							<!-- <h2
								class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Category
								Master</h2> -->


							<div class="col-xl-10 offset-xl-1">
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
												<label>Customer Name</label><span class="text-danger">*</span>
												<div class="typeahead">
													<input type="text"
														class="form-control form-control-solid form-control-lg"
														name="customerName" id="customer_name" /> <span
														class="msg text-danger" id="type1"> </span>
												</div>
												
											</div>

										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>Order Date</label> 
													<input type="date" data-date-inline-picker="true" 
																			class="form-control form-control-solid form-control-lg"
																			placeholder="DD/MM/YYYY" name="order_dat" id="order_date" />
											</div>
										</div>
									</div><div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label>Customer Code</label> <input type="text"
													class="form-control form-control-solid" id="customer_code" disabled/>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>Return Date</label> <input type="date" data-date-inline-picker="true"
													class="form-control form-control-solid" id="return_date" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label>Mobile</label> <input type="text"
													class="form-control form-control-solid" id="mobile_no" /><span
														class="msg text-danger" id="type2"> </span>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>Order No :</label> <input type="text"
													class="form-control form-control-solid" id="order_no" />
											</div>
										</div>
									</div>
									<div class="row">
										 <div class="col-lg-6">
											<div class="form-group">
												<label>Billing Address</label> 										
													     <textarea rows = "2"  class="form-control form-control-solid" id="billing_address"></textarea>
											</div>
										</div>
										
										<div class="col-lg-6">
											<div class="form-group">
												<label>Delivery Address</label> 
											     <textarea rows = "2"  class="form-control form-control-solid" id="delivery_address"></textarea>
											</div>
										</div>
									</div>
                                   


                       <div class="card-body">

															<table class="table" id="Mtable">
																<thead>
																	<tr>
																		<th scope="col">No</th>
																		<th scope="col">Product</th>
																		<th scope="col">Unit</th>
																		<th scope="col">Quantity</th>
																		<th scope="col">Unit Rate</th>
																		<th scope="col">Total</th>
																		

																	</tr>
																</thead>

																<tbody class="add_product" id="add-product"></tbody>


															</table>
														</div>
														

                                   <div class="row">
									<div class="col-lg-6">
									<div class="form-group" id="amount_div">
										<label>Amount</label> <span class="text-danger" id="type">*</span><input type="number"
											class="form-control form-control-solid" name="amount" id="amount"
											placeholder="Enter Amount" disabled/>
									</div>
								    </div>
								    <div class="col-lg-6">
									<div class="form-group" id="amount_div">
										<label>Discount</label> ><input type="number"
											class="form-control form-control-solid" name="discount" id="discount"
											placeholder="Enter Discount" />
									</div>
									</div>
									</div>
                                     
                                      <div class="row">
									 <div class="col-lg-6">
											<div class="form-group">
												<label>Payment mode</label> <select name="paymentMode"
													id="paymentMode" class="form-control form-control-solid">
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
										<label>Total Amount</label> <span class="text-danger" id="type">*</span><input type="number"
											class="form-control form-control-solid" name="invoice_total" id="total_amount"
											placeholder="Enter Total Amount" disabled/>
									</div>
									</div>
									
									<div class="col-lg-2">
									<div class="form-group" id="amount_div">
									<label>If Paid Partial</label>
   <span class="switch switch-outline switch-icon switch-primary switch-sm ">
    <label>
     <input type="checkbox"  name="select" id="if_partial"/>
     <span></span>
    </label>
   </span>
  </div>
  </div>
								    
									</div>
                                     
                                       
                                     <div class="row">
                                     <div class="col-lg-6">
									<div class="form-group" id="upi_div">
									<label>UPI Name</label> 
										<select type="text" class="form-control form-control-solid"
											name="upi_id" id="upi_id"
											placeholder="Enter UPI Transaction Id" >
											<option value="" disable hidden field>select UPI </option>
											</select>
									</div>
									<div class="form-group" id="nb_div">
									
										<label>Received Bank</label> <select
													class="form-control form-control-solid" id="received_bank">
													 <option value="">Select a bank</option>
													 
													 </select> 
									</div>

									</div>
                                     
									
									
									
									
									<div class="col-lg-6">
									<div class="form-group" id="amount_div1">
										<label>Partial Paid Amount</label> <span class="text-danger" id="type">*</span><input type="number"
											class="form-control form-control-solid" name="invoice_paid_total" id="partially_paid_amount"
											placeholder="Enter Total Amount" />
									</div>
									</div>
									</div>

									<div class="outstanding_table card_table card-custom gutter-b">
										<div class="col-xl-12">
											<table class="table">
												<thead>
													<tr>
														<th style="text-align: center" scope="col">Sr. No</th>
														<th style="text-align: center" scope="col">Invoice Id</th>
														<th style="text-align: center" scope="col">Invoice Date</th>
														<th style="text-align: center" scope="col">Invoice Amount</th>
														<th style="text-align: center" scope="col">Paid</th>
														<th style="text-align: center" scope="col">To Be Paid</th>
														<th style="text-align: center" scope="col">Now Paying</th>
														<th style="text-align: center" scope="col" hidden>order Code</th>
														<th style="text-align: center" scope="col" hidden>Payment Id</th>


													</tr>
												</thead>
												<tbody class="table_body">
												</tbody>
											</table>
										</div>
									</div>
									<!-- <div class="row">

										<div class="col-lg-12 text-right">
											
											<button type="button" id="calculate_total"
												class="btn font-weight-bold btn-primary ">Calculate</button>

										</div>
									</div> -->
									
									

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Grand Total</label> <span class="text-danger"
													id="type">*</span><input type="number"
													class="form-control form-control-solid" name="grand_total"
													id="grand_total" placeholder="Enter Grand Total" disabled/>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Actual Paid Amount</label> <span class="text-danger"
													id="type">*</span><input type="number"
													class="form-control form-control-solid" name="paid_amount"
													id="paid_amount" placeholder="Enter Paid Amount" disabled/>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Balance Amount</label> <span class="text-danger"
													id="type">*</span><input type="number"
													class="form-control form-control-solid"
													name="balance_amount" id="balance_amount"
													placeholder="Enter Balance Amount" disabled />
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<!-- <label>Received Bank</label> <select
													class="form-control form-control-solid" id="received_bank">
													 <option value="">Select a bank</option>
													 
													 </select>  -->
											</div>
										</div>
										
									</div>
									
									<div class="row" id="bank_details1">
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Branch Name</label> <span class="text-danger"
													id="type">*</span><input type="text"
													class="form-control form-control-solid" name="branch_name"
													id="branch_name" placeholder="Enter Branch Namel" />
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Account No</label> <span class="text-danger"
													id="type">*</span><input type="number"
													class="form-control form-control-solid" name="account_no"
													id="account_no" placeholder="Enter Account No" />
											</div>
										</div>
									</div>
                                  
									
									
									<div class="modal" id="medicineModel" tabindex="-1"
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
													<!-- <h3>THIS IS A modal for MEDISION SELECTION</h3> -->
													<div
														class="quick-search quick-search-inline ml-20 w-300px "
														id="kt_quick_search_inline">
														<form method="get" class="quick-search-form">
															<div class="input-group rounded bg-light">
																<div class="input-group-prepend">
																	<span class="input-group-text"> <span
																		class="svg-icon svg-icon-lg"> <svg
																				xmlns="http://www.w3.org/2000/svg"
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
														</svg>
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




														<div id="kt_quick_search_toggle" data-toggle="dropdown"
															data-offset="0px,1px"></div>

														<div
															class="dropdown-menu dropdown-menu-left dropdown-menu-lg dropdown-menu-anim-up">
															<div class="quick-search-wrapper scroll"
																data-scroll="true" data-height="350"
																data-mobile-height="200"></div>
														</div>

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
						<style>
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

@
keyframes show_slide { 0%{
	transform: translateX(100%);
}

40
%
{
transform
:
translateX(
-10%
);
}
80
%
{
transform
:
translateX(
0%
);
}
100
%
{
transform
:
translateX(
-10px
);
}
}
@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}

40
%
{
transform
:
translateX(
0%
);
}
80
%
{
transform
:
translateX(
-10%
);
}
100
%
{
transform
:
translateX(
100%
);
}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
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
				<!--begin::Footer-->
				<jsp:include page="../common/footer.jsp"></jsp:include>
				<!--end::Footer-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>


	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Navigation/Up-2.svg-->
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
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/custom/spinners.js"></script>
	<%-- <script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
 --%>	<%-- <script src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
 --%>	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/main.js"></script>


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	$('#partially_paid_amount').val('00');
	$('#discount').val("00");
	$('.outstanding_table').hide();
	
	var today = new Date();
	var dd = today.getDate();
	if(dd < 10){
		dd= '0' + dd;
	}
	var date= today.getFullYear() + '-' +(today.getMonth()+1) +'-'+ dd;
	
	$('#return_date').val(date);
	
	
	
	$("#customer_name").change(function(){
		var text=	$("#customer_name").val();
		var letters = /^[A-Za-z(). ]+$/;
		 if(text.match(letters))
	     {
				
			 $('#type1').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type1').text('Please Enter Letters Only.');
	    $("#customer_name").val('');
	     return false;
	     }
		});
	$("#mobile_no").change(function(){
		var text=	$("#mobile_no").val();
		 var phoneno = /^\d{10}$/;
		 if(text.match(phoneno))
	     {
				
			 $('#type2').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type2').text('Please Enter 10 Digits Only.');
	    $("#mobile_no").val('');
	     return false;
	     }
		});
	
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const customer_name = urlParams.get('customer_name');
	const customer_code = urlParams.get('customer_code');
	const sales_order_id = urlParams.get('sales_order_id');
	var ccode=0;
	$.ajax({
			url : base + "/bakeshackAPI/api/getCustomerDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				const row = data.find(d => d.customer_name == customer_name);
				if(row != null){
					ccode = row.customer_code; 
				  
					$('#customer_name').val(row.customer_name);
				$('#customer_code').val(row.customer_code);
				$('#mobile_no').val(row.mobile_no);
				$('#billing_address').val(row.address);
				$('#delivery_address').val(row.address);
				}else{
					$('#customer_code').val("");
				}
	        }
		});	
	
	 var j=0;
	 var r=0;
	$.ajax({
		url : base + "/bakeshackAPI/api/getSalesAndOrderDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"sales_and_order_id": sales_order_id},
		success:function(data)
 	{
			
			const row = data.find(d => d.sales_and_order_id == sales_order_id);
			data.forEach((row)=> {
			
				if(row.sales_and_order_id == sales_order_id )
						{
			
					/* alert(row.odrer_date); */
					 $('#order_date').val(row.order_date);
		         	$('#order_no').val(row.order_code);
		         	var product_list = row.product_list;
		         	/* alert(product_list); */
		         	$('#discount').val(row.discount);
		         	
		         	const parsedData = JSON.parse(product_list);
			         
					 $(parsedData).each(function(index) {
						r++;
							$('#product-' + (index + 1)).val(parsedData[index]['product']);
							$('#unit-' + (index + 1)).val(parsedData[index]['unit']);
							 $('#quantity-' + (index + 1)).val(parsedData[index]['quantity']); 
							$('#unit_rate-' + (index + 1)).val(parsedData[index]['unit_rate']);
							$('#total-' + (index + 1)).val(parsedData[index]['total']);
						
							
							//alert(r);
						});
					 
					 for(var i = 1; i <=r; i++){
						  var html = '';
						  html += '<tr>';
						  html += '<td style="width: 5%;"><input type="checkbox" class="form-control id d-flex flex-column-fluid h-20px w-20px mt-3" id="id-'+i+'" onClick="checkedBox('+i+')"></td>';
						  html += '<td style="width: 18%;" ><input type="text" class="form-control product" id="product-' + i +'" name="medicineName" data-product-id="'+ i + '" disabled><option value="" disabled selected hidden>Select</option></select></td>';
					      html += '<td style="width: 16%;"><input type="text" class="form-control unit" name="unit" id="unit-' + i + '" disabled><option value="" disabled selected hidden>Select</option></select></td>';
						  html += '<td style="width: 9%;"><input type="text" class="form-control  quantity" name="quantity" id="quantity-' + i + '" placeholder="quantity" disabled  oninput="weightConverter(' + i + ',this.value)"/></td>';
						  html += '<td style="width: 9%;"><input type="text" class="form-control  unit_rate" name="unit_rate" id="unit_rate-' + i + '" placeholder="unit_rate"  disabled/></td>';
						  html += '<td style="width: 12%;"><input type="text" class="form-control  total" name="total" id="total-' + i + '" placeholder="total" disabled/></td>';
						
						  $('.add_product').append(html);
				 }
					 const parsedData1 = JSON.parse(product_list);
					 $(parsedData1).each(function(index) {
							$('#product-' + (index + 1)).val(parsedData1[index]['product']);
							$('#unit-' + (index + 1)).val(parsedData1[index]['unit']);
							$('#quantity-' + (index + 1)).val(parsedData1[index]['quantity']);
							$('#unit_rate-' + (index + 1)).val(parsedData1[index]['unit_rate']);
							$('#total-' + (index + 1)).val(parsedData1[index]['total']);
							
						});	
				 
					}
			});
 	}
	});	
	
	function checkedBox(i){
		
		/* alert(i); */
		 if ($("#id-"+i).prop('checked')==true){ 
			   $("#quantity-"+i).prop('disabled', false);
			  
			
			 }else{
				
				 $("#quantity-"+i).prop('disabled', true);
				
					$("#quantity-"+i).val('');
					
					
			 }
	    
		}; 	
		
		
		function weightConverter(i,valNum) {
			
		
		
			 var calculate_unit_price = $("#unit_rate-"+i).val();
			 $("#total-"+i).val(calculate_unit_price*valNum); 
			 
		
			var calculate_total = 0;
			 for(i=1; i < 100 ; i++)
				{
			  
					 if ($("#id-"+i).prop('checked')==true){ 
							var calculate_unit_total =  $("#total-"+i).val();
							calculate_total += parseInt(calculate_unit_total);
							
							
			 document.getElementById('amount').value = calculate_total;
			 document.getElementById('total_amount').value = calculate_total;
			 document.getElementById('partially_paid_amount').value = calculate_total;
			 document.getElementById('balance_amount').value = calculate_total-calculate_total;
			// $("").val(calculate_total-calculate_total); 
					 }
				}
				}

	
	
	 $.ajax({
			url : base + "/bakeshackAPI/api/getSalesAndOrderDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"customer_code": ccode},
			success:function(data)
	    	{
				//alert(j);
				const row = data.find(d => d.customer_code == ccode);
				data.forEach((row)=> {
					
				if(row.customer_code == ccode && row.balance_amount > 0)
					{
					
					j++;
					//alert(ccode);
					
					}
				});
	    	}
		});
           if(j>=1)
        	   {
        	   $('.outstanding_table').show();
        	   }
	
			 for(var i = 1; i <= j; i++){
			 	  var html = '';
			 	  html += '<tr>'
			 	  html += ' <td><input type="checkbox" class="form-control checkbox Sr.No d-flex flex-column-fluid h-20px w-20px mt-3" id="table_id-'+i+'" onClick="checkedBox1('+i+')"></td>';
			 	 html += ' <td><input type="text" class="form-control Invoice Id d-flex flex-column-fluid" id="invoiceId-' + i +'" name="invoiceId" disabled></td>';
			 	 html += ' <td><input type="text" class="form-control Invoice Date d-flex flex-column-fluid" id="invoiceDate-' + i +'" name="invoiceDate" disabled></td>';
			 	 html += ' <td><input type="text" class="form-control Clinic Fee d-flex flex-column-fluid" id="clinicFee-' + i +'" name="clinicFee" disabled></td>';
			 	 html += ' <td><input type="text" class="form-control Paid d-flex flex-column-fluid" id="paid-' + i +'" name="paid" disabled></td>';
			 	 html += ' <td><input type="text" class="form-control To Be Paid d-flex flex-column-fluid" id="toBePaid-' + i +'" name="toBePaid" disabled></td>';
			 	 html += ' <td><input type="text" class="form-control Paid d-flex flex-column-fluid" id="nowPaying-'+i+'" oninput="calculator(' + i + ',this.value)" disabled></td>';
			 	 html += ' <td><input type="hidden" class="form-control Visit Id d-flex flex-column-fluid" id="visitId-' + i +'" name="visitId" hidden></td>';
			 	 html += ' <td><input type="hidden" class="form-control Payment Id d-flex flex-column-fluid" id="paymentId-' + i +'" name="paymentId" hidden></td>';

			 	 html += '</tr>';
			 	  $('.table_body').append(html);
	} 
	
			 var k=0;
	 			var Grand_Total=0;
				$.ajax({
					url : base + "/bakeshackAPI/api/getSalesAndOrderDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {"customer_code": ccode},
					success:function(data)
			 	{
						
						const row = data.find(d => d.customer_code != '');
						data.forEach((row)=> {
						
							if(row.customer_code == ccode && row.balance_amount > 0)
									{
							  k++;
							  
							 
							  Grand_Total = parseInt(Grand_Total) + parseInt(row.balance_amount);
							 /* alert(Grand_Total); */
								   $('#invoiceId-' + k).val(row.order_code);
									$('#invoiceDate-' + k).val(row.order_date);
									$('#clinicFee-' + k).val(row.amount);
									$('#paid-' + k).val(row.partial_paid_amount);
									$('#toBePaid-' + k).val(row.balance_amount);
									$('#visitId-' + k).val(row.sales_and_order_id);
									$('#paymentId-' + k).val(row.order_code);
							      
								}
						});
			 	}
				});	
				 $('#grand_total').val(Grand_Total); 
	
				 
				 function checkedBox1(i){
						
						
					 if ($("#table_id-"+i).prop('checked')==true){ 
						   $("#nowPaying-"+i).prop('disabled', false);
						
						 }else{
							//alert("not checked");
							 $("#nowPaying-"+i).prop('disabled', true);
							
								$("#nowPaying-"+i).val('');
								
								
						 }
				    
					}; 	
					
				    function calculator(i,valNum) {
						
			        	   var amount =  $("#amount").val();	   
			     	      $('#grand_total').val(Grand_Total - parseInt(amount));     
					
			
					 var calculate_price_total = parseInt($("#partially_paid_amount").val());
				  for(var j = 1 ;j<=k ;j++)
					 {
					  var calculate_price = $("#nowPaying-"+i).val();
					        calculate_price_total -= parseInt(calculate_price);
					       // alert(calculate_price_total);
			    	    	document.getElementById('paid_amount').value = calculate_price_total;
			    	    	
			    	    	var total =  $("#grand_total").val();	
			    	    	var total1 =  $("#paid_amount").val();	
						 document.getElementById('balance_amount').value = parseInt(total)-parseInt(-total1); 
				}
				
				
					
						}	
					
	 $('#upi_div').hide();
	 $('#nb_div').hide();
	 $('#cheque_div').hide();
	 $('#amount_div1').hide();
	 $('#bank_details1').hide();
	 $('#bank_details2').hide();
	 
	
	
	
	 //$('#return_date').val(date);
		
		 $.ajax({
				url : base + "/bakeshackAPI/api/getBankDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1},
				success:function(data)
			    {
					data.forEach((element)=> {
						
					        $('#received_bank').append($(document.createElement('option')).prop({
				                value: element.bank_id,
				                text: element.bank_name
				            }))
						
					});   
			    }
			});	
		
		 $.ajax({
				url : base + "/bakeshackAPI/api/getUpiDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1},
				success:function(data)
			    {
					data.forEach((element)=> {
						
					        $('#upi_id').append($(document.createElement('option')).prop({
				                value: element.upi_master_id,
				                text: element.upi_name
				            }))
						
					});   
			    }
			});	
		
		$('#received_bank').change(function(){
			 $('#bank_details1').show();
			 var bank = $(this).val();
			 $.ajax({
					url : base + "/bakeshackAPI/api/getBankDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.bank_id == bank);
							
						    
						       $('#branch_name').val(row.branch);
					 			$('#account_no').val(row.account_no);  
						
				    }
				});	
		});
		
	
		
		
		$('#paymentMode').change(function(){
			var payment_mode = $(this).val();
					
			if(payment_mode == 'upi'){
				$('#upi_div').show();
				$('#nb_div').hide();
				$('#cheque_div').hide();
			}else if(payment_mode == 'nb'){
				$('#upi_div').hide();
				$('#nb_div').show();
			    $('#cheque_div').hide();
			}else if(payment_mode == 'cheque'){
				$('#upi_div').hide();
				$('#nb_div').show();
				$('#cheque_div').hide();
			}else if(payment_mode == 'credit'){
				$('#upi_div').hide();
				$('#nb_div').hide();
				$('#cheque_div').hide();
				$('.checkbox').prop('disabled', true);
				$('#partially_paid_amount').val("00");
				
			}else{
				$('#upi_div').hide();
				$('#nb_div').hide();
				$('#cheque_div').hide();
			}
			
		});
		
		
		$('#if_partial').change(function(){
			
			
			 if ($("#if_partial").prop('checked')==true){ 
				 $('#amount_div1').show();
				
				 }else{
					
					 $('#amount_div1').hide();
						
						
				 }
		    
			}); 
		
		
		$('#calculate_total').click(function() {
			
			
			 var calculate_paid = 0;
		  /* alert(calculate_paid); */
			for(i=1; i <= j ; i++)
			{
		if ($("#table_id-"+i).prop('checked')==true){ 
			 var calculate_invoice_paid = $("#nowPaying-"+i).val();
			  calculate_paid = parseInt(calculate_paid) + parseInt(calculate_invoice_paid);
			
			 $('#paid_amount').val(calculate_paid);
			 var calculate_grand_total =  $("#grand_total").val();
			 var calculate_balance = parseInt(calculate_grand_total) - parseInt(calculate_paid);
			
				$('#balance_amount').val(calculate_balance);
		}
		}
		});
		
		var balance_amount = 0;
		
		$('#add_sales_order').click(function() {
					
			var customer_code = $('#customer_code').val();
			var order_date = $('#order_date').val();
			var return_date = $('#return_date').val();
			var order_code = $('#order_no').val();
			var delivery_address = $('#delivery_address').val();
			var amount = $('#amount').val();
			var discount= $('#discount').val();
			var payment_mode = $('#paymentMode').val();
			var upi_name = $('#upi_id').val();
			var total_amount = $('#total_amount').val();
			var amount1 = -total_amount;
			
			var partial_paid_amount = $('#partially_paid_amount').val();
			balance_amount = parseInt(total_amount) - parseInt(partial_paid_amount);
			var received_bank = $('#received_bank').val();
			var branch_name = $('#branch_name').val();
			var account_no = $('#account_no').val();
			var flag 		  = 1; // Addition
			
		
			
			 $("table tbody tr").each(function(index) {
				 if($(this).find('.id').prop('checked')==true){
				 		
				       var product = $(this).find('.product').val();
				       var unit =  $(this).find('.unit').val();
				       var quantity =  $(this).find('.quantity').val();
				       var unit_rate =  $(this).find('.unit_rate').val();
				       var total =  $(this).find('.total').val();

				       
				    $.ajax({
							url : base + "/bakeshackAPI/api/insertUpdateQuantityDetails",
							type : "post",
							dataType : "json",
							async : false,
							data : {
								
								"product_name" : product,
								"entry_date" : return_date,
								"expiry_date": 0,
								"product_batch" : 0,
								"unit" : unit,
								"price" : unit_rate,
								"opening_quantity" : 0,
								"purchase_quantity": 0,
								"purchase_return_quantity" : 0,
								"used_quantity" : 0,
								"sale_quantity" : 0,
								"sale_return_quantity" : quantity,
								"out_quantity": 0,
								"produced_quantity": 0,
								"transaction_field" : "Sale Return Product",
								"flag" :flag
								
								
								
								
							},
							error : function(xhr) {
								var msg = "(insertUpdateProduct)Sorry but there was an error : "
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

										var msg = "Product Quantity Data inserted Successfully.";
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
				 });
			
			
			
			
			
			
			 var productList = [];
			 $("table tbody tr").each(function(index) {
			 	if($(this).find('.id').prop('checked')==true){
			 		productList.push({ 
			         "product": $(this).find('.product').val(),
			         "unit": $(this).find('.unit').val(),
			         "quantity": $(this).find('.quantity').val(),
			         "unit_rate": $(this).find('.unit_rate').val(),
			         "total": $(this).find('.total').val()
			     	});
			 	}
			 });
			
		var jsonString = JSON.stringify(productList);
									
				
									
									
									  $.ajax({
										url : base + "/bakeshackAPI/api/insertUpdateSalesAndReturnDetails",
										type : "post",
										dataType : "json",
										async : false,
										data : {
											"customer_code" : customer_code,
											"order_date" : order_date,
											"return_date" : return_date,
											"order_code" : order_code,
											"delivery_address" : delivery_address,
											"amount" : amount,
											"discount" : discount,
											"payment_mode" : payment_mode,
											"upi_name" : upi_name,
											"total_amount" : total_amount,
											"partial_paid_amount" : partial_paid_amount,
											"balance_amount" : balance_amount,
											"given_bank" : received_bank,
											"account_no" : account_no,
											"product_list" : jsonString,
											"flag" : flag
										},
										error : function(xhr) {
											var msg = "(insertUpdateSalesAndOrderDetails)Sorry but there was an error : "
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

													var msg = "Order & Return Data inserted Successfully.";
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
									
									 var transaction_id ;
									  var latest_invoice_id;
									 $.ajax({
											url : base + "/bakeshackAPI/api/getLatestSalesReturnInvoice",
											type : "post",
											dataType : "json",
											async : false,
											data : {"invoice_code": latest_invoice_id},
											success:function(data)
									    	{
												//data.forEach((element)=> {
												const row = data.find(d => d.invoice_code == latest_invoice_id);
												data.forEach((row)=> {
												
												 latest_invoice_id = row.invoice_code;
												   transaction_id = row.transaction_code;
												});
									    	}
										});	
									
								/* 	alert(latest_invoice_id); */
								 
									  var invoice_id = latest_invoice_id; 	
									
									
									 $.ajax({
										    url : base + "/bakeshackAPI/api/insertUpdateInvoice",
											type : "post",
											dataType : "json",
											async : false,
											data : {
												
												
												
												"customer_code"    : customer_code,
												"order_code" 	   : order_code,
												"invoice_date"     : return_date  ,
												"paid_date"        : return_date,
												"invoice_amonut"   : -total_amount,
												"to_be_paid"       : -total_amount,
												"payment_mode"     : payment_mode,
												"paid_amount"      : -partial_paid_amount,
												"current_paid_amount"      : -partial_paid_amount,
												"balance_amt"      : -balance_amount,
												"invoice_code"     : invoice_id,
												"field"            : "Return_Sales_Order",
												"transaction_code" : transaction_id,
												"flag"             : flag
												
												
												
												
												
												
												
												
												
												
											},
											error : function(xhr) {
												var msg = "Data insertion/updation failed. Error : "
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

														var msg = "Invoice Data inserted/Updated Successfully.";
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
									
									
									 
										for(i=1; i <= j ; i++)
										{
									 if ($("#table_id-"+i).prop('checked')==true){ 
										   var a1 = $("#nowPaying-"+i).val();
										   var a2 = $("#invoiceId-"+i).val();
										   var a3 = $("#invoiceDate-"+i).val();
										   var a4 = $("#clinicFee-"+i).val();
										   var a5 = $("#paid-"+i).val();
										   var a6 = $("#visitId-"+i).val();
										   var a7 = $("#toBePaid-"+i).val();
										   var a10= $("#paymentId-"+i).val();
										  
										   var a8 = parseInt(a5) + parseInt(a1);
										   var a9 = parseInt(a4) - parseInt(a8);
										   
										
										
										   
										   
									   $.ajax({
												 url : base + "/bakeshackAPI/api/insertUpdateInvoice",
												type : "post",
												dataType : "json",
												async : false,
												data : {
													
													
													
													
													
													
													"customer_code"    : customer_code,
													"order_code" 	   : a10,
													"invoice_date"     : a3  ,
													"paid_date"        : order_date,
													"invoice_amonut"   : a4,
													"to_be_paid"       : a4,
													"payment_mode"     : payment_mode,
													"paid_amount"      : a8,
													"current_paid_amount"      : a1,
													"balance_amt"      : a9,
													"invoice_code"     : a2,
													"field"            : "Return_Sales_Order",
													"transaction_code" : transaction_id,
													"flag"             : flag
												
												},
												error : function(xhr) {
													var msg = "OutStanding Invoice   insertion/updation failed. Error : "
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

															var msg = "OutStanding Invoice Data inserted/Updated Successfully.";
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
										   
										   
										
										  $.ajax({
												url : base + "/bakeshackAPI/api/updateSalesAndOrderDetails",
												type : "post",
												dataType : "json",
												async : false,
												data : {
													"customer_code":customer_code,
													"partial_paid_amount"  : a8,
													"balance_amount" : a9,
													"sales_and_order_id" : a6,
													"flag"         : 1
												},
												error : function(xhr) {
													var msg = "Payment updation failed. Error : "
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

															var msg = "Sales & Order Data Updated Successfully.";
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
										}
										
										
										 Swal.fire({
										        title: "Are you sure?",
										        text: "You won't be able to revert this!",
										        icon: "warning",
										        showCancelButton: true,
										        confirmButtonText: "Yes, delete it!",
										        cancelButtonText: "No, cancel!",
										        reverseButtons: true
										    }).then(function(result) {
										        if (result.value) {
											 		var url = "sales_return_recipt.jsp" + '?customer_code=' + customer_code + '&order_code=' + order_code + '&invoice_id=' + invoice_id;
											  window.location.assign(url);
											  Swal.fire(
										                "Deleted!",
										                "Your file has been deleted.",
										                "success"
										            )
										            // result.dismiss can be "cancel", "overlay",
										            // "close", and "timer"
										        } else if (result.dismiss === "cancel") {
										           window.location.reload();
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