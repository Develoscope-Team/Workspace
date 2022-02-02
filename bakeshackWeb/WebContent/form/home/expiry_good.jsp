<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
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
/* .alert.show {
	animation: show_slide 1s ease forwards;
} */
/* @keyframes show_slide { 0%{
	transform: translateX(100%);
} */
/* 40%{transform:translateX(-10%);}
80%{transform:translateX(0%);}
100%{transform:translateX(-10px);}
}
@keyframes hide_slide { 0%{
	transform: translateX(-10px);
}
40%{transform:translateX(0%);}
80%{transform:translateX(-10%);}
100%{transform:translateX(100%);}
} */
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
<link rel="shortcut icon" href="assets/BakeShack_IM/media/logos/favicon.ico" />
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
			<div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">
							 <h2 class="text-white font-weight-bold my-2 mr-5 mb-15 mt-13">Expiry Goods</h2> 
							<div class="col-12 offset-0">
								<div class="card card-custom gutter-b">
									<div class="card-body">
										<div class="example mb-10">
											<div class="example-preview">
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														<div class="card-body">
															<div class="row">
																<div class="form-group col-md-6">
																	<div class="form-group">
																<label>Product</label> <select
																	class="form-control form-control-solid" id="product_name" name="product_name">
																	<option value="" disabled selected hidden>Select
																		Product</option>
																</select>
															</div>
														</div>
																<div class="form-group col-md-6">
																	<label>Product Qty</label> <input type="text"
																		id="product_qty"
																		class="form-control form-control-solid"
																		placeholder="Enter Qty" />
																</div>
															</div>
															<div class="row">
																<div class="form-group col-md-6">
																	<label>Price </label> <input type="text"
																		id="price"
																		class="form-control form-control-solid"
																		placeholder="Enter price" />
																</div>
																<div class="form-group col-md-6">
																	<label>Reason</label>
																	<input type="text" name="resion" id="resion" maxlength="200"
																		class="form-control form-control-solid" rows="5" />
																	<h7><span class="msg text-info" id="type4">enter maximum 200 letters in input box </span></h7>
																</div>
															</div>
															<div class="row">
																<div class="form-group col-md-6">
																	<label>Product Date</label> <input type="text"
																		id="product_date"
																		class="form-control form-control-solid" />
																</div>
																<div class="form-group col-md-6">
																	<label>Expiry Date</label> <input type="text"
																		id="expiry_date"
																		class="form-control form-control-solid" />
																</div>
															</div>
														<div class="text-center">
															<button type="submit" id="verify"
																class="btn btn-primary mr-2">Verify</button>
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
							<div class="alert alert-success" role="alert"
								id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
							<div class="alert alert-danger" role="alert" id="danger_alert">
								<div class="alert-text">
									<span id="danger_msg"></span>
								</div>
							</div>
							<div class="alert alert-warning" role="alert" id="warning_alert">
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
	 var today = new Date();
	 var dd=today.getDate();
	 if(dd < 10){
		 dd = '0' + dd;
	 }
	 var mm=today.getMonth()+1;
	 if(mm < 10){
		 mm = '0' + mm;
	 }
	 var date = today.getFullYear()+'-'+mm+'-'+ dd;
	 
	 // minimum setup
     $('#product_date,#expiry_date').datepicker({
      rtl: KTUtil.isRTL(),
      todayHighlight: true,
      orientation: "bottom left",
     	format:'yyyy-mm-dd'
     });
	 $('#product_date').val(date);
	 $('#expiry_date').val(date);
		$.ajax({
			url : base + "/bakeshackAPI/api/getProductDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1},
			success:function(data)
	        {
				data.forEach((element)=> {
				        $('#product_name').append($(document.createElement('option')).prop({
			                value: element.product_name,
			                text: element.product_name
			            }))
				});   
	        }
		});	
		 var j=0;
		var r=0;
		   var rcode = 0;
		  var unit1 =0;
			 $('#product_name').change(function(){
				 var product_name = $(this).val();
					$.ajax({
						url : base + "/bakeshackAPI/api/getProductDetails",
						type : "post",
						dataType : "json",
						async : false,
						data : {"flag":1,},
						success:function(data)
				        {
							const row = data.find(d => d.product_name == product_name);
							if(row != null){
								unit1 = row.unit;
								$('#price').val(row.selling_price);
								$('#price').addClass("text-muted");
							}else{
								$('#price').val("");
							}
				        }
					});	
			 })
		$('#verify').click(function() {
					var product_name = $('#product_name').val();
					var product_qty = $('#product_qty').val();
					var price = $('#price').val();
					var resion = $('#resion').val();
					var product_date = $('#product_date').val();
					var expiry_date = $('#expiry_date').val();
					var flag = 1; // Addition
					if (product_name  != "" ) {
						$.ajax({
									url : base + "/bakeshackAPI/api/insertUpdateExpiryGood",
									type : "post",
									dataType : "json",
									async : false,
									data : {
										"product_name" : product_name,
										"product_qty" : product_qty,
										"price"  : price,
										"resion" : resion,
										"product_date" : product_date,
										"expiry_date" : expiry_date,
										"flag" :flag
									},
									error : function(xhr) {
										var msg = "(insertUpdateExpiry_good)Sorry but there was an error : "
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
												var msg = "Expiry_good Data inserted Successfully.";
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
							url : base + "/bakeshackAPI/api/insertUpdateQuantityDetails",
							type : "post",
							dataType : "json",
							async : false,
							data : {
								"product_name" : product_name,
								"entry_date" : expiry_date,
								"unit" : unit1,
								"selling_price" : 0,
								"opening_quantity" : 0,
								"purchase_quantity": 0,
								"purchase_return_quantity" : 0,
								"used_quantity" : 0,
								"sale_quantity" : 0,
								"sale_return_quantity" : 0,
								"out_quantity" :product_qty,
								"produced_quantity": 0,
								"transaction_field" : "Expired Product",
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
				})
		$(document).ready(function (){
			   var table = $('#table-id').DataTable();
			});
	
</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>
