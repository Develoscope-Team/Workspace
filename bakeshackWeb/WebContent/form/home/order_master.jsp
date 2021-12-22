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
</head>
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">

	<div id="kt_header_mobile" class="header-mobile">
		<!--begin::Toolbar-->
		<div class="d-flex align-items-center">
			<button class="btn p-0 burger-icon burger-icon-left ml-4"
				id="kt_header_mobile_toggle"></button>
			<button class="btn btn-icon btn-hover-transparent-white p-0 ml-3"
				id="kt_header_mobile_topbar_toggle">
				<span class="svg-icon svg-icon-xl"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/General/User.svg-->
					<svg xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
						height="24px" viewBox="0 0 24 24" version="1.1">
							<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
								<polygon points="0 0 24 0 24 24 0 24" />
								<path
							d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
							fill="#000000" fill-rule="nonzero" opacity="0.3" />
								<path
							d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
							fill="#000000" fill-rule="nonzero" />
							</g>
						</svg> <!--end::Svg Icon-->
				</span>
			</button>
		</div>
		<!--end::Toolbar-->
	</div>
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
									<h2 class="text-white font-weight-bold my-2 mr-5">Order
										Booking</h2>

									<!--end::Title-->

								</div>
								<!--end::Heading-->
							</div>
							<div class="d-flex align-items-center">

								<a href="sales-order-master.jsp"
									class="btn btn-light-primary font-weight-boldest py-3 px-6 mr-6"><i
									class="fa fas fa-calculator mr-2"></i>Billing</a>


							</div>

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
																		<label>Customer Name</label><span class="text-danger"></span>
																		<div class="typeahead">
																			<input type="text"
																				class="form-control form-control-solid form-control-lg"
																				name="customerName" id="customer_name" /><span
																				class="msg text-danger" id="type1"> </span>
																		</div>

																	</div>

																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Order Date</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid form-control-lg"
																			placeholder="DD/MM/YYYY" name="order_dat"
																			id="order_date" />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Customer Code</label> <input type="text"
																			class="form-control form-control-solid"
																			id="customer_code" disabled />
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Delivery Date</label> <input type="date"
																			data-date-inline-picker="true"
																			class="form-control form-control-solid"
																			id="delivery_date" />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Mobile</label> <input type="text"
																			class="form-control form-control-solid"
																			id="mobile_no" /> <span class="msg text-danger"
																			id="type2"> </span>
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
																<div class="col-lg-5">
																	<div class="form-group">
																		<label>Billing Address</label>
																		<textarea rows="2"
																			class="form-control form-control-solid"
																			id="billing_address"></textarea>
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
																<div class="col-lg-6">
																	<div class="form-group">
																		<label>Delivery Address</label>
																		<textarea rows="2"
																			class="form-control form-control-solid"
																			id="delivery_address"></textarea>
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
																			<th scope="col">Quantity</th>
																			<th scope="col">Unit Rate</th>
																			<th scope="col">Total</th>
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

															<div class="row">
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
															</div>

															<div class="row">
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


															<div class="row">
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
															</div>



															<div class="row" id="bank_details1">
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
																			 <div class="input-icon ml-10" style = "width: 30%;">
																<input type="text" class="form-control form-control-solid" placeholder="Search..." id="txt_searchall" />
																<span>
																	<i class="flaticon2-search-1 text-muted"></i>
																</span>
															</div>
																			<!-- <div class="input-icon ml-10" style="width: 30%;">
																				<input type="text"
																					class="form-control form-control-solid"
																					placeholder="Search..." id="txt_searchall" /> <span>
																					<i class="flaticon2-search-1 text-muted"></i>
																				</span>
																			</div> -->
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
 --%>
	<%-- <script src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
 --%>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/main.js"></script>


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	
	$('#partially_paid_amount').val('00');
	$('#discount').val("00");
	 $('#credit_div').hide();
	
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
	
	
	
	 $('#upi_div').hide();
	 $('#nb_div').hide();
	 $('#cheque_div').hide();
	 $('#amount_div1').hide();
	 $('#bank_details1').hide();
	 $('#bank_details2').hide();
	 
	 var j=0;
	 var today = new Date();
	 var dd = today.getDate();
	 if(dd < 10)
		 {
		    dd = '0' + dd;
		 }
	 var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+ dd;
	 $('#order_date').val(date);
	 $('#delivery_date').val(date);
	 
	 var order_code;
	 $.ajax({
			url : base +"/bakeshackAPI/api/getLatestOrder",
			type : "post",
			dataType : "json",
			async : false,
			success:function(data)
	    	{
				//data.forEach((element)=> {
				const row = data.find(d => d.order_code != 0);
				data.forEach((row)=> {
				//alert(row.order_code);
				$('#order_no').val(row.order_code);
				   
				});
	    	}
		});	
	 
		 var cName = [];
			
			$.ajax({
			url : base + "/bakeshackAPI/api/getCustomerDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1},
			success:function(data)
	     {
				if(data != null){
					data.forEach(function(e){
						cName.push(e.customer_name);
					})
				}  
	     }
			});
			
			 var bloodhound = new Bloodhound({
	             datumTokenizer: Bloodhound.tokenizers.whitespace,
	             queryTokenizer: Bloodhound.tokenizers.whitespace,
	             // `states` is an array of state names defined in "The Basics"
	             local: cName
	         });

	         $('#customer_name').typeahead({
	             hint: true,
	             highlight: true,
	             minLength: 1
	         }, {
	             name: 'cName',
	             source: bloodhound
	         });
	         var Grand_Total = 0; 
	     	var ccode = 0;
	         $('#customer_name').change(function(){
	        		
	 			var customer_name = $(this).val();
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
         })
		

	 var medData;
		var r=0;
		var table_len=(Mtable.rows.length);
		$('#add_user ').click(function () {
		
			
				
				var customer_name = $('#customer_name').val();
				var mobile_no = $('#mobile_no').val();
				var address = $('#billing_address').val();
				var flag 		  = 1; 
											
				
				if(customer_name != '' ){
					$.ajax({
						url : base + "/bakeshackAPI/api/insertUpdateCustomer",
						type : "post",
						dataType : "json",
						async : false,
						data : {
							
							"customer_name" : customer_name,
							"mobile_no" : mobile_no,
							"address" : address,
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

									var msg = "Customer Data inserted/Updated Successfully.";
									alert(msg);

								} 										}
						}

					});
				}
				$.ajax({
					url : base +"/bakeshackAPI/api/getCustomerDetails",
					type : "post",
					dataType : "json",
					async : false,
					success:function(data)
			    	{
						//data.forEach((element)=> {
						const row = data.find(d => d.customer_name == customer_name);
						data.forEach((row)=> {
				       
						$('#customer_name').val(row.customer_name);
						$('#customer_code').val(row.customer_code);
						$('#mobile_no').val(row.mobile_no);
						$('#billing_address').val(row.address);
						$('#delivery_address').val(row.address);
						   
						});
			    	}
				});	
			
		})
		
						
 var pName=[];
		     	$.ajax({
					url : base + "/bakeshackAPI/api/getSaleableProductDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
			     {
						if(data != null){
							data.forEach(function(e){
								pName.push(e.product_name);
							})
						}  
			     }
					});
					
					 var bloodhound = new Bloodhound({
			             datumTokenizer: Bloodhound.tokenizers.whitespace,
			             queryTokenizer: Bloodhound.tokenizers.whitespace,
			             // `states` is an array of state names defined in "The Basics"
			             local: pName
			         });			
		$('#add ').click(function () {
			
			var i =table_len;
			
			  
			  var html = ''; 
			  html += '<tr>';
			  html += '<td style="width: 3%;">' + i + '</td>';
			  html += '<td style="width: 12%;" ><input type="text" class="typeahead form-control Product" id="product-' + i +'" name="product" data-product-id="'+ i + '" placeholder="Product"></input></td>';
			  html += '<td style="width: 12%;"><input type="text" class="form-control Unit" name="unit" id="unit-' + i + '" placeholder="Category"></input></td>';
			  html += '<td style="width: 12%;"><input type="text" class="form-control Quantity" name="raw_qty" id="raw_qty-' + i + '" placeholder="Raw Qty" oninput="weightConverter(' + i + ',this.value)"></input></td>';
			  html += '<td style="width: 12%;"><input type="text" class="form-control Price" name="unit_rate" id="unit_rate-' + i + '" placeholder="Unit Rate"></input></td>';
			  html += '<td style="width: 12%;"><input type="text" class="form-control Unit_Total" name="unit_total" id="unit_total-' + i + '" placeholder="Unit_total"></input></td>';
			  html += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';

			 $('.add_product').append(html); 
			  
				 $('.add_product #product-'+ i).dblclick(function () {
					   mname=(this.id);
					  var str = mname;
			           matches = str.match(/(\d+)/);
					  $("#medicineModel").modal();
					});
				 $('#raw_qty- '+ i).change(function () {
					 var raw_qty = $(this).val();
				
					 
				 })
				 $.ajax({
						url : base + "/bakeshackAPI/api/getUnitDetails",
						type : "post",
						dataType : "json",
						async : false,
						data : {"flag":1},
						success:function(data)
					    {
							data.forEach((element)=> {
								
							        $('#unit').append($(document.createElement('option')).prop({
						                value: element.unit_id,
						                text: element.unit_desc
						            }))
								
							});   
					    }
					});	
				 table_len++;
				
				 
				 /*  $('#product-'+ i).typeahead({
		             hint: true,
		             highlight: true,
		             minLength: 1
		         }, {
		             name: 'pName',
		             source: bloodhound
		         });
				 	 
		
				 $('#product-'+ i).change(function(){
		        		
			 			var product_name = $(this).val();
			 			$.ajax({
			 				url : base + "/bakeshackAPI/api/getSaleableProductDetails",
			 				type : "post",
			 				dataType : "json",
			 				async : false,
			 				data : {"flag":1,},
			 				success:function(data)
			 		        {
			 					const row = data.find(d => d.product_name == product_name);
			 					if(row != null){
			 						// ccode = row.customer_code; 
			 					  
			 						  $('#product-'+ i).val(row.product_name);
			 				            $("#unit-"+ i).val(row.unit);
			 				        	$("#unit_rate-"+ i).val(row.selling_price);
			 					}
			 		        }
			 			});	
		         })   */
				
				 
				 
				 
				 

				 $('.add_product').on('click','.btn_delete',function(){
				$(this).closest('tr').remove();	
				
				 var calculate_total =0;
				 var discount = $('#discount').val();
				 for(var j = 1 ;j<100 ;j++)
				 {
					 
					 if($("#unit_total-"+j).val() != null){
					 var calculate_unit_total =  $("#unit_total-"+j).val();	 
					
					 calculate_total += parseInt(calculate_unit_total);
					 document.getElementById('amount').value = calculate_total;
					 document.getElementById('total_amount').value = parseInt(calculate_total)-parseInt(discount);
					 document.getElementById('partially_paid_amount').value =  parseInt(calculate_total)-parseInt(discount);
					 }
				 }
				
				
				
				
			});
	});
				
				
			
			function weightConverter(i,valNum) {
				 var calculate_unit_price = $("#unit_rate-"+i).val();
				 $("#unit_total-"+i).val(calculate_unit_price*valNum); 
				 var calculate_total =0;
				 for(var j = 1 ;j<table_len ;j++)
				 {
					 
					 if($("#unit_total-"+j).val() != null){
					 var calculate_unit_total =  $("#unit_total-"+j).val();	 
					 calculate_total += parseInt(calculate_unit_total);
					 document.getElementById('amount').value = calculate_total;
					 document.getElementById('total_amount').value = calculate_total;
					 document.getElementById('partially_paid_amount').value = calculate_total;
					 }
				 }
          }
				
				
				
				
		
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
				url : base + "/bakeshackAPI/api/getBankDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1},
				success:function(data)
			    {
					data.forEach((element)=> {
						
					        $('#received_bank_for_check').append($(document.createElement('option')).prop({
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
		
		
		$("#discount").change(function(){
			var amount1 = $('#amount').val();
			var discount = $('#discount').val();
			var invoice_total = amount1-discount;
			$('#total_amount').val(invoice_total);
			$('#partially_paid_amount').val(invoice_total);
			
			});
		
		$('#paymentMode').change(function(){
			var payment_mode = $(this).val();
					
			if(payment_mode == 'upi'){
				$('#upi_div').show();
				$('#nb_div').hide();
				$('#cheque_div').hide();
				 $('#credit_div').hide();
			}else if(payment_mode == 'nb'){
				$('#upi_div').hide();
				$('#nb_div').show();
			    $('#cheque_div').hide();
			    $('#credit_div').hide();
			}else if(payment_mode == 'cheque'){
				$('#upi_div').hide();
				$('#nb_div').show();
				$('#cheque_div').hide();
				 $('#credit_div').hide();
			}else if(payment_mode == 'credit'){
				$('#upi_div').hide();
				$('#nb_div').hide();
				$('#cheque_div').hide();
				$('.checkbox').prop('disabled', true);
				$('#partially_paid_amount').val("00");
				 $('#credit_div').show();
					$('#credit_period').val("00");
				
			}else{
				$('#upi_div').hide();
				$('#nb_div').hide();
				$('#cheque_div').hide();
				$('#credit_div').hide(); 
			}
			
		});
		
		
		$('#if_partial').change(function(){
			
			
			 if ($("#if_partial").prop('checked')==true){ 
				 $('#amount_div1').show();
				
				 }else{
					
					 $('#amount_div1').hide();
						
						
				 }
		    
			}); 
		
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
                      url: base + "/bakeshackAPI/api/getSaleableProductDetails",
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
                      <a href="javascript:update('+row.product_id+');" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details" id="edit">\
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
		// public functions
		init : function() {
			demo2();
		}
	};
}();

jQuery(document).ready(function() {
	KTBootstrapDaterangepicker.init();
});	


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
	

function update(id){
	
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

var balance_amount = 0;
$('#add_sales_order').click(function() {
					
			var customer_code = $('#customer_code').val();
			var order_date = $('#order_date').val();
			var delivery_date = $('#delivery_date').val();
			var order_code = $('#order_no').val();
			var delivery_address = $('#delivery_address').val();
			var amount = $('#amount').val();
			var discount= $('#discount').val();
			var payment_mode = $('#paymentMode').val();
			var upi_name = $('#upi_id').val();
			var credit_period = $('#credit_period').val();
			var total_amount = $('#total_amount').val();
			var partial_paid_amount = $('#partially_paid_amount').val();
			balance_amount = parseInt(total_amount) - parseInt(partial_paid_amount);
			var received_bank = $('#received_bank').val();
			var branch_name = $('#branch_name').val();
			var account_no = $('#account_no').val();
			var flag 		  = 1; // Addition
			
			
			var product_count=0;
			 var productList = [];
			 $("table tbody tr").each(function(index) {
				
					
				 if($(this).find('.product').val() != null){
						product_count++;
						
			 		 productList.push({ 
			         "product": $(this).find('.Product').val(),
			         "unit": $(this).find('.Unit').val(),
			         "quantity": $(this).find('.Quantity').val(),
			         "unit_rate": $(this).find('.Price').val(),
			         "total": $(this).find('.Unit_Total').val()
			     	}); 
			 	}
				
			 });
			
		var jsonString = JSON.stringify(productList);
/* 		alert(jsonString);
 */									    $.ajax({
										url : base + "/bakeshackAPI/api/insertUpdateOrderBookingDetails",
										type : "post",
										dataType : "json",
										async : false,
										data : {
											"customer_code" : customer_code,
											"delivery_address" : delivery_address,
											"order_date" : order_date,
											"delivery_date" : delivery_date,
											"order_code" : order_code,	
											"product_list" : jsonString,
											"amount" : amount,
											"discount" : discount,
											"payment_mode" : payment_mode,
											"upi_name" : upi_name,
											"total_amount" : total_amount,
											"partial_paid_amount" : partial_paid_amount,
											"balance_amount" : balance_amount,
											"received_bank" : received_bank,
											"account_no" : account_no,
											"cancelation_date" :"",
											"credit_period" : credit_period,
											"status" : 1 ,
											"flag" : flag
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

													var msg = "Order Booking Data inserted Successfully.";
													alert(msg);

												} 
											}
										}

									}); 
									
									  var transaction_code;
								
									  $.ajax({
											url : base + "/bakeshackAPI/api/getOrderInvoiceTransactionCode",
											type : "post",
											dataType : "json",
											async : false,
											data : {"transaction_code": transaction_code},
											success:function(data)
									    	{
												//data.forEach((element)=> {
												const row = data.find(d => d.transaction_code == transaction_code);
												data.forEach((row)=> {
												 transaction_code = row.transaction_code;
												});
									    	}
										});	  
									
									
								 
								
									if(partial_paid_amount != 0)
									{
									   $.ajax({
										    url : base + "/bakeshackAPI/api/insertUpdateInvoice",
											type : "post",
											dataType : "json",
											async : false,
											data : {
												
												
												"customer_code"       : customer_code,
												"order_code" 	      : order_code,
												"invoice_date"        : order_date,
												"paid_date"           : order_date,
												"invoice_amonut"      : amount,
												"field"               : "Order_Advance",
												"to_be_paid"          : total_amount,
												"paid_amount"         : partial_paid_amount,
												"current_paid_amount" : partial_paid_amount,
												"payment_mode"        : payment_mode,
												"balance_amt"         : balance_amount,
												"transaction_code"    : transaction_code,
												"advance_paid"        : partial_paid_amount,
												"flag"                : flag
											},
											error : function(xhr) {
												var msg = "Data insertion/updation failed. Error : "
														+ xhr.status
														+ " "
														+ xhr.statusText;
												alert(msg);
											},
											success : function(response) {
												if (response != null) {

													if (response >= 1) {

														var msg = "Invoice Data inserted/Updated Successfully.";
														alert(msg);
														
														

													}
												}
											}

										}); 
									  
									}
									
									
										  if (confirm("Do You Wish To Print Invoice!")) {
												
											  //var url = "receipt.jsp";
											  
										 		var url = "order_booking_receipt.jsp" + '?customer_code=' + customer_code + '&order_code=' + order_code + '&transaction_code=' + transaction_code + '&partial_paid_amount=' + partial_paid_amount ;

											  window.location.assign(url);
												 } else {
													  window.location.reload();
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