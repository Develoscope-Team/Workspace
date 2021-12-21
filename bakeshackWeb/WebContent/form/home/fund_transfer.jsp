<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAKESHACk";
try {
%>
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
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
				
					
					<!--begin::Entry-->
					<div class="d-flex flex-column">

						<!--begin::Container-->
						<div class="container  ">
							<h2 class="text-white font-weight-bold  my-2 mr-40">Fund
								Transfer</h2>
							<div class="row">
								<div class="col-xl-12 offset-0">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form method="get" class="form" id="kt_form_1">
															<div class="card-body">
																<div class="row  ">
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Payment Mode</label> <select name="sort_by"
																				id="payment_mode"
																				class="form-control form-control-solid">
																				<option value="" disable hidden field>Select
																					Mode</option>
																				<option value="cash">Cash</option>
																				<option value="upi">UPI</option>
																				<option value="nb">Net Banking</option>
																				<option value="cheque">Cheque</option>
																				<option value="credit">Credit</option>
																				<option value="credit">Wallet</option>
																				<option value="card_machine">Card Machine</option>

																			</select>

																		</div>
																		
																		<div class="form-group" id=current_cash>
																			<label>Current Amount</label> <span
																				class="text-danger" id="type">*</span><input
																				type="number"
																				class="form-control form-control-solid" id="current"
																				disabled />
																		</div>
																		
																		<div class="form-group" id="upi_div">
																			<label>UPI Name</label> <select type="text"
																				class="form-control form-control-solid"
																				name="upi_id" id="upi_id"
																				placeholder="Enter UPI Transaction Id">
																				<option value="" disable hidden field>select
																					UPI</option>
																			</select>
																		</div>
																		<div class="form-group" id="nb_div">

																			<label> Bank</label> <select
																				class="form-control form-control-solid"
																				id="received_bank">
																				<option value="" disable hidden field>Select
																					a bank</option>

																			</select>
																		</div>
						
																					<div class="form-group bank_deatails1111">
																						<label>Account Holder Name</label><span
																							class="text-danger" id="type">*</span> <input
																							type="text" name="account_holder_name"
																							id="account_holder_name"
																							class="form-control form-control-solid"
																							placeholder="Account Holder Name" required /> <span
																							class="msg text-danger" id="type1"> </span>
																					</div>
																		</div>
																	<span
																		class="svg-icon svg-icon-primary svg-icon-4x ml-10"><svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewBox="0 0 24 24"
																			version="1.1">
   																	 <g stroke="none" stroke-width="1" fill="none"
																				fill-rule="evenodd">
    															     <polygon points="0 0 24 0 24 24 0 24" />
        															 <rect fill="#000000" opacity="0.3"
																				transform="translate(13.000000, 6.000000) rotate(-450.000000) translate(-13.000000, -6.000000) "
																				x="12" y="8.8817842e-16" width="2" height="12"
																				rx="1" />
        															 <path
																				d="M9.79289322,3.79289322 C10.1834175,3.40236893 10.8165825,3.40236893 11.2071068,3.79289322 C11.5976311,4.18341751 11.5976311,4.81658249 11.2071068,5.20710678 L8.20710678,8.20710678 C7.81658249,8.59763107 7.18341751,8.59763107 6.79289322,8.20710678 L3.79289322,5.20710678 C3.40236893,4.81658249 3.40236893,4.18341751 3.79289322,3.79289322 C4.18341751,3.40236893 4.81658249,3.40236893 5.20710678,3.79289322 L7.5,6.08578644 L9.79289322,3.79289322 Z"
																				fill="#000000" fill-rule="nonzero"
																				transform="translate(7.500000, 6.000000) rotate(-270.000000) translate(-7.500000, -6.000000) " />
      															     <rect fill="#000000" opacity="0.3"
																				transform="translate(11.000000, 18.000000) scale(1, -1) rotate(90.000000) translate(-11.000000, -18.000000) "
																				x="10" y="12" width="2" height="12" rx="1" />
        															 <path
																				d="M18.7928932,15.7928932 C19.1834175,15.4023689 19.8165825,15.4023689 20.2071068,15.7928932 C20.5976311,16.1834175 20.5976311,16.8165825 20.2071068,17.2071068 L17.2071068,20.2071068 C16.8165825,20.5976311 16.1834175,20.5976311 15.7928932,20.2071068 L12.7928932,17.2071068 C12.4023689,16.8165825 12.4023689,16.1834175 12.7928932,15.7928932 C13.1834175,15.4023689 13.8165825,15.4023689 14.2071068,15.7928932 L16.5,18.0857864 L18.7928932,15.7928932 Z"
																				fill="#000000" fill-rule="nonzero"
																				transform="translate(16.500000, 18.000000) scale(1, -1) rotate(270.000000) translate(-16.500000, -18.000000) " />
   																	 </g>
																		</svg>
																		<!--end::Svg Icon--></span>

																	<div class="col-xl-5 ml-10">
																		<div class="form-group">
																			<label>Received Mode</label> <select name="sort_by"
																				id="payment_mode1"
																				class="form-control form-control-solid">
																				<option value="" disable hidden field>Select
																					Mode</option>
																				<option value="cash">Cash</option>
																				<option value="upi">UPI</option>
																				<option value="nb">Net Banking</option>
																				<option value="cheque">Cheque</option>
																				<option value="credit">Wallet</option>

																				<option value="card_machine">Card Machine</option>
																			</select>
																		</div>
																		
																		<div class="form-group" id="current_cash1">
																			<label>Current Amount</label> <span
																				class="text-danger" id="type">*</span><input
																				type="number"
																				class="form-control form-control-solid"
																				id="current1" disabled />
																		</div>
																		
																		
																		<div class="form-group" id="upi_div1">
																			<label>UPI Name</label> <select type="text"
																				class="form-control form-control-solid"
																				name="upi_id" id="upi_id1"
																				placeholder="Enter UPI Transaction Id">
																				<option value="" disable hidden field>select
																					UPI</option>
																			</select>
																		</div>
																		<div class="form-group" id="nb_div1">

																			<label> Bank</label> <select
																				class="form-control form-control-solid"
																				id="received_bank1">
																				<option value="" disable hidden field>Select
																					a bank</option>

																			</select>
																		</div>

																		
																		<div class="form-group bank_details2222">
																						<label>Account Holder Name</label><span
																							class="text-danger" id="type">*</span> <input
																							type="text" name="account_holder_name"
																							id="account_holder_name1"
																							class="form-control form-control-solid"
																							placeholder="Account Holder Name" required /> <span
																							class="msg text-danger" id="type1"> </span>
																					</div>
																	</div>
																</div>

															
																<div class="row">
																	<div class="col-xl-8 offset-2" >
																		<div class="form-group">
																			<label>Amount To Transfer</label><span
																				class="text-danger">*</span> <input
																				type="text" name="amount" id="amount"
																				class="form-control form-control-solid"
																				placeholder="Enter amount" required />
																		</div>
																	</div>
																</div>

															</div>
															<div class="card-footer text-center">
																<div class="row">
																	<div class="col-lg-3"></div>
																	<div class="col-lg-6">
																		<button type="button" id="show" 
																			class="btn font-weight-bold btn-primary mr-2 ">
																			Transfer</button>

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

						</div>
						<!--end::Content-->
						<%-- <!--begin::Footer-->
				<jsp:include page="../common/footer.jsp"></jsp:include>
				<!--end::Footer--> --%>
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
			<script type="text/javascript"
				src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
			<script
				src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>



			<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	
	 $('#upi_div').hide();
	 $('#nb_div').hide();
	 $('#cheque_div').hide();
	 $('#current_cash').hide();
	 $('.bank_deatails1').hide();
	 $('.bank_deatails11').hide();
	 $('.bank_deatails111').hide();
	 $('.bank_deatails1111').hide();
	 
	 $('#upi_div1').hide();
	 $('#nb_div1').hide();
	 $('#cheque_div1').hide();
	 $('#current_cash1').hide();
	 $('.bank_details2').hide();
	 $('.bank_details22').hide();
	 $('.bank_details222').hide();
	 $('.bank_details2222').hide();
	 
	
	
	

	 
	 
	 
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
	 
	$.ajax({
		url : base + "/bakeshackAPI/api/getBankDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
				
			        $('#received_bank1').append($(document.createElement('option')).prop({
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
				
			        $('#upi_id1').append($(document.createElement('option')).prop({
		                value: element.upi_master_id,
		                text: element.upi_name
		            }))
				
			});   
        }
	});	
	 
	
	
	
	
	$('#payment_mode').change(function(){
		var payment_mode = $(this).val();
				
		if(payment_mode == 'upi'){
			$('#upi_div').show();
			$('#current_cash').show();
			$('#nb_div').hide();
			$('#cheque_div').hide();
			 $('.bank_deatails1').hide();
			 $('.bank_deatails11').hide();
			 $('.bank_deatails111').hide();
			 $('.bank_deatails1111').hide();
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'upi')
							   {
						    	 $('#current').val(row.total);
						    	
							   }
							});
						
				    }
				});	
			 
			 
			 
			 
			 
			 
		}else if(payment_mode == 'nb'){
			$('#upi_div').hide();
			$('#current_cash').show();
			$('#nb_div').show();
		    $('#cheque_div').hide();
		    $('.bank_deatails1').show();
			 $('.bank_deatails11').show();
			 $('.bank_deatails111').show();
			 $('.bank_deatails1111').show();
			 
			 
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'nb')
							   {
						    	 $('#current').val(row.total);
						    
							   }
							});
						
				    }
				});	
		}else if(payment_mode == 'cheque'){
			$('#upi_div').hide();
			$('#current_cash').hide();
			$('#nb_div').show();
			$('#current_cash').show();
			$('#cheque_div').hide();
			 $('.bank_deatails1').show();
			 $('.bank_deatails11').show();
			 $('.bank_deatails111').show();
			 $('.bank_deatails1111').show();
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'cheque')
							   {
						    	 $('#current').val(row.total);
						    	
							   }
							});
						
				    }
				});	
			 
			 
			 
			 
		}else if(payment_mode == 'credit'){
			$('#upi_div').hide();
			$('#current_cash').show();
			$('#nb_div').hide();
			$('#cheque_div').hide();
			 $('.bank_deatails1').hide();
			 $('.bank_deatails11').hide();
			 $('.bank_deatails111').hide();
			 $('.bank_deatails1111').hide();
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'credit')
							   {
						    	 $('#current').val(row.total);
						    	
							   }
							});
						
				    }
				});	

			
		}else{
			$('#upi_div').hide();
			$('#nb_div').hide();
			$('#cheque_div').hide();
			$('#current_cash').show();
			 $('.bank_deatails1').hide();
			 $('.bank_deatails11').hide();
			 $('.bank_deatails111').hide();
			 $('.bank_deatails1111').hide();
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'cash')
							   {
						    	 $('#current').val(row.total);
						    	
							   }
							});
						
				    }
				});	

		}
		
	});	
	 $('#received_bank').change(function(){
		 var bank = $(this).val();
		// alert(bank);
		 $.ajax({
				url : base + "/bakeshackAPI/api/getBankDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1},
				success:function(data)
			    {
					const row = data.find(d => d.bank_id == bank);
						
					    
					       $('#Bank_name').val(row.bank_name);
					       $('#account_no').val(row.account_no);
					       $('#IFSC_code').val(row.IFSC_code);
				 			$('#account_holder_name').val(row.account_holder_name);  
					
			    }
			});	
	});
	$('#payment_mode1').change(function(){
		var payment_mode = $(this).val();
				
		if(payment_mode == 'upi'){
			$('#upi_div1').show();
			$('#nb_div1').hide();
			$('#current_cash1').show();
			$('#cheque_div1').hide();
			 $('.bank_details2').hide();
			 $('.bank_details22').hide();
			 $('.bank_details222').hide();
			 $('.bank_details2222').hide();
			 
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'upi')
							   {
						    	 $('#current1').val(row.total);
						    	
							   }
							});
						
				    }
				});	
			 
			 
			 
		}else if(payment_mode == 'nb'){
			$('#upi_div1').hide();
			$('#nb_div1').show();
			$('#current_cash1').show();
		    $('#cheque_div1').hide();
		    $('.bank_details2').show();
			 $('.bank_details22').show();
			 $('.bank_details222').show();
			 $('.bank_details2222').show();
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'nb')
							   {
						    	 $('#current1').val(row.total);
						    	
							   }
							});
						
				    }
				});	
			 
		}else if(payment_mode == 'cheque'){
			$('#upi_div1').hide();
			$('#nb_div1').show();
			$('#current_cash1').show();
			$('#cheque_div1').hide();
			 $('.bank_details2').show();
			 $('.bank_details22').show();
			 $('.bank_details222').show();
			 $('.bank_details2222').show();
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'cheque')
							   {
						    	 $('#current1').val(row.total);
						    	
							   }
							});
						
				    }
				});	
		}else if(payment_mode == 'credit'){
			$('#upi_div1').hide();
			$('#nb_div1').hide();
			$('#cheque_div1').hide();
			$('#current_cash1').show();
			$('#partially_paid_amount1').val("00");
			 $('.bank_details2').hide();
			 $('.bank_details22').hide();
			 $('.bank_details222').hide();
			 $('.bank_details2222').hide();
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'credit')
							   {
						    	 $('#current1').val(row.total);
						    	
							   }
							});
						
				    }
				});	
			
		}else{
			$('#upi_div1').hide();
			$('#nb_div1').hide();
			$('#cheque_div1').hide();
			 $('.bank_details2').hide();
			 $('.bank_details22').hide();
			 $('.bank_details222').hide();
			 $('.bank_details2222').hide();
			 $('#current_cash1').show();
			 
			 
			 $.ajax({
					url : base + "/bakeshackAPI/api/getPaymentModeWiseTotal",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1},
					success:function(data)
				    {
						const row = data.find(d => d.payment_mode != '');
						data.forEach((row)=> {
						    if(row.payment_mode == 'cash')
							   {
						    	 $('#current1').val(row.total);
						    
							   }
							});
						
				    }
				});	
		}
		
	});
	
	 $('#received_bank1').change(function(){
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
						
					    
					       $('#Bank_name1').val(row.bank_name);
					       $('#account_no1').val(row.account_no);
					       $('#IFSC_code1').val(row.IFSC_code);
				 			$('#account_holder_name1').val(row.account_holder_name);  
					
			    }
			});	
	});
	 
	
	 var today = new Date();
	 var dd = today.getDate();
	 if(dd < 10)
		 {
		    dd = '0' + dd;
		 }
	 var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+ dd;
	 
	//alert(current);
	
	
	$('#show')
	.click(
			function() {
				var sender_current_amount=$('#current').val();
				
				var sender_payment_mode = $('#payment_mode').val();
				var sender_upi_name = $('#upi_id').val();
				var sender_select_bank = $('#received_bank').val();
				var sender_bank_name = $('#Bank_name').val();
				var sender_acc_no = $('#account_no').val();
				var sender_ifsc_code = $('#IFSC_code').val();
				var sender_acc_holder_name = $('#account_holder_name').val();
				
			
				
				var receiver_payment_mode = $('#payment_mode1').val();
				var receiver_upi_name = $('#upi_id1').val();
				var receiver_select_bank = $('#received_bank1').val();
				var receiver_current_amount = $('#current1').val();
				var receiver_bank_name = $('#Bank_name1').val();
				var receiver_acc_no = $('#account_no1').val();
				var receiver_ifsc_code = $('#IFSC_code1').val();
				var receiver_acc_holder_name = $('#account_holder_name1').val();
				var amount = $('#amount').val();
				
				var flag = 1; // Addition
			
				var sender_current_amount1 = sender_current_amount;
				
				if(sender_current_amount1 > amount)
				{
					alert("Insufficient funds");
				} else{
				
				 if (amount  != "") {
					
					$.ajax({
								url : base
										+ "/bakeshackAPI/api/insertUpdatefundTransferMaster",
								type : "post",
								dataType : "json",
								async : false,
								data : {
									"sender_payment_mode" : sender_payment_mode,
									"sender_upi_name" : sender_upi_name,
									"sender_select_bank" : sender_select_bank,
									"sender_current_amount1" : sender_current_amount1,
									"sender_bank_name" : sender_bank_name,
									"sender_acc_no" : sender_acc_no,
									"sender_ifsc_code" : sender_ifsc_code,
									"sender_acc_holder_name" : sender_acc_holder_name,
									"receiver_payment_mode" : receiver_payment_mode,
									"receiver_upi_name" : receiver_upi_name,
									"receiver_select_bank" : receiver_select_bank,
									"receiver_current_amount" : receiver_current_amount,
									"receiver_bank_name" : receiver_bank_name,
									"receiver_acc_no" : receiver_acc_no,
									"receiver_ifsc_code" : receiver_ifsc_code,
									"receiver_acc_holder_name" : receiver_acc_holder_name,
									"amount" : amount,
									
									"flag" :flag
								},
								
								error : function(xhr) {
									var msg = "(insertUpdatefund_transfer_master)Sorry but there was an error : "
											+ xhr.status
											+ " "
											+ xhr.statusText;
									alert(msg);
								},
								success : function(response) {
									if (response != null) {

										if (response >= 1) {

											var msg = "Transfer Data inserted Successfully.";
											alert(msg);

										} 
									}
								}

							});
					
					
					
					
					 $.ajax({
						    url : base + "/bakeshackAPI/api/insertUpdateInvoice",
							type : "post",
							dataType : "json",
							async : false,
							data : {
								
								"customer_code"       : 0,
								"order_code" 	      : 0,
								"invoice_date"        : date,
								"paid_date"           : date,
								"invoice_amonut"      : amount,
								"field"               : "Fund Transfer",
								"to_be_paid"          : -amount,
								"paid_amount"         : -amount,
								"current_paid_amount" : -amount,
								"payment_mode"     : sender_payment_mode,
								"balance_amt"      : 0,
								"transaction_code" : 00000000,
								"flag"             : 1
								
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
					
					
					 $.ajax({
						    url : base + "/bakeshackAPI/api/insertUpdateInvoice",
							type : "post",
							dataType : "json",
							async : false,
							data : {
								
								"customer_code"       : 0,
								"order_code" 	      : 0,
								"invoice_date"        : date,
								"paid_date"           : date,
								"invoice_amonut"      : amount,
								"field"               : "Received Fund ",
								"to_be_paid"          : amount,
								"paid_amount"         : amount,
								"current_paid_amount" : amount,
								"payment_mode"        : receiver_payment_mode,
								"balance_amt"         : 0,
								"transaction_code"    : 00000000,
								"flag"                : 1
								
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
				
				}
			
			
         window.location.reload();
				
			})

"use strict";

</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>