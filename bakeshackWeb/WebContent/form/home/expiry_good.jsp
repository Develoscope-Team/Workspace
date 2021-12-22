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
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
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
<link rel="shortcut icon" href="assets/BakeShack_IM/media/logos/favicon.ico" />

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
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">

							 <h2
								class="text-white font-weight-bold my-2 mr-5 mb-10">Expiry Goods</h2> 


							<div class="col-xl-12 offset-xl-0">
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
																	<label>Resion</label>
																	<input type="text" name="resion" id="resion" maxlength="200"
																		class="form-control" rows="5" />
																		
																	
																	<h7><span class="msg text-info" id="type4">enter maximum 200 letters in input box </span></h7>
																</div>
															</div>
															<div class="row">
																<div class="form-group col-md-6">
																	<label>Product Date</label> <input type="date"
																		id="product_date"
																		class="form-control form-control-solid" />
																</div>
																<div class="form-group col-md-6">
																	<label>Expiry Date</label> <input type="date"
																		id="expiry_date"
																		class="form-control form-control-solid" />
																</div>
															</div>
															
														<div class="text-center">
															<button type="submit" id="verify"
																class="btn btn-primary mr-2">Verify</button>
															
														</div>
													</form>
													<!--end::Form-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 	<div class="card card-custom gutter-b">
									<div class="card-body">
									<div class="quick-search quick-search-inline ml-20 w-300px "
								id="kt_quick_search_inline">
								begin::Form
								<form method="get" class="quick-search-form">
									<div class="input-group rounded bg-light">
										<div class="input-group-prepend">
											<span class="input-group-text"> <span
												class="svg-icon svg-icon-lg"> begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/General/Search.svg
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
														</svg> end::Svg Icon
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
								end::Form
								begin::Search Toggle
								<div id="kt_quick_search_toggle" data-toggle="dropdown"
									data-offset="0px,1px"></div>
								end::Search Toggle
								begin::Dropdown
								<div
									class="dropdown-menu dropdown-menu-left dropdown-menu-lg dropdown-menu-anim-up">
									<div class="quick-search-wrapper scroll" data-scroll="true"
										data-height="350" data-mobile-height="200"></div>
								</div>
								end::Dropdown
							</div>
							<br />
										begin: Datatable
										<table data-toggle="table" class='a'
											data-classes="table table-hover table-condensed "
											data-striped="true" data-sort-name="Quality"
											data-sort-order="desc" data-pagination="false"
											data-scroll="false" data-height=550 id="table-id">
											<thead>
												<tr>
													<th class="col-sm-1 text-center" data-field="NO"
														data-sortable="true">No</th>
													<th class="col-sm-2 text-center" data-field="Product-Name"
														data-sortable="true">Product Name</th>
													<th class="col-sm-1 text-center" data-field="Product-Qty"
														data-sortable="true">Product Qty</th>
														<th class="col-sm-1 text-center" data-field="Price"
														data-sortable="true"> Price</th>
														<th class="col-sm-2 text-center" data-field="Resion"
														data-sortable="true"> Resion</th>
														<th class="col-sm-1 text-center" data-field="Product Date"
														data-sortable="true"> Product Date</th>
														<th class="col-sm-1 text-center" data-field="Expiry Date"
														data-sortable="true"> Expiry Date</th>
													
													<th class="col-sm-3 text-center" data-field="Action"
														data-sortable="false">Action</th>


												</tr>

											</thead>
											<tbody class="data text-center">


											</tbody>
										</table>
										end: Datatable
									</div>
								</div> -->
							

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
	 var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+ dd;
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
		


		$('#verify')
		.click(
				function() {

					var product_name = $('#product_name').val();
					var product_qty = $('#product_qty').val();
					var price = $('#price').val();
					var resion = $('#resion').val();
					var product_date = $('#product_date').val();
					var expiry_date = $('#expiry_date').val();
					var flag = 1; // Addition

					if (product_name  != "" ) {
						$
								.ajax({
									url : base
											+ "/bakeshackAPI/api/insertUpdateExpiryGood",
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
										alert(msg);
									},
									success : function(response) {
										if (response != null) {

											if (response >= 1) {

												var msg = "Expiry_good Data inserted Successfully.";
												alert(msg);

											} 
										}
									}

								});
						
						
						$
						.ajax({
							url : base
									+ "/bakeshackAPI/api/insertUpdateQuantityDetails",
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
								alert(msg);
							},
							success : function(response) {
								if (response != null) {

									if (response >= 1) {

										var msg = "Product Quantity Data inserted Successfully.";
										alert(msg);

									} 
								}
							}

						});
						
						
					}

				})

	 var expiry_good_id;
		var html = "";

		$.ajax({
			url : base + "/bakeshackAPI/api/getExpiryGoodDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"expiry_good_id": expiry_good_id},
			success:function(data)
			{
				  
				
				const row = data.find(d => d.expiry_good_id == expiry_good_id);
				data.forEach((row)=> {
					/* alert(row.expiry_good_id);
					alert(row.product_name);
					alert(row.product_qty);
					alert(row.price);
					alert(row.product_date); */
					html +="<tr id= tr-id-2 class= tr-class-2>"
					html += "<td>"+row.expiry_good_id+"</td>"; 
					 html += "<td>"+row.product_name+"</td>";
			            html += "<td>"+row.product_qty+"</td>";
			            html += "<td>"+row.price+"</td>";
			            html += "<td>"+row.resion+"</td>";
			            html += "<td>"+row.product_date+"</td>";
			            html += "<td>"+row.expirt_date+"</td>";
			         
		     	       	/*  html += '<td><a href="javascript:update('+row.expiry_good_id+');" class="btn_action btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="12" height="2" rx="1"/></g></svg></span>'
		         

		     	       	+ '<a href="javascript:deleteById('+row.expiry_good_id+');" class="btn_action btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>'; */
			            html +="</tr>"
				
				
				});
				 $(".data").html(html);
			}
			
		});	



		$(document).ready(function (){
			   var table = $('#table-id').DataTable();
			 
			});
		// Update data by subcategory name and id
	/* 	function update(expiry_good_id) {
			$('.btn_action').hide();

			$('#updateSubcategory').show();
			$("#addSubcategory").hide();
			
			
			
			
			
			$.ajax({
				url : base + "/bakeshackAPI/api/getSubcategoryDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1,},
				success:function(data)
		        {
					
					const row = data.find(d => d.subcategory_id == subcategory_id);
					
					console.log(row);
					
					if(row != null){
						$('#subcategory_desc').val(row.subcategory_name);
						
						$.ajax({
							url : base + "/bakeshackAPI/api/getCategoryDetails",
							type : "post",
							dataType : "json",
							async : false,
							data : {"flag":1,},
							success:function(data)
					        {
								
								const raw = data.find(d => d.category_name == row.category);
								
								console.log(row);
								
								if(raw != null){
									$('#category').val(raw.category_id);
								}
					        }
						});
						
					}
		        }
			});	
		}
			 */
</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>
