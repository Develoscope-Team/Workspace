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
									<h2 class="text-white font-weight-bold my-2 mr-5">Sales &
										Returns Entry</h2>

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
																		<label>Customer Code</label> <input type="text"
																			class="form-control form-control-solid"
																			id="customer_code" />
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
																											fill="#000000" fill-rule="nonzero"
																											opacity="0.3" />
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




																				<div id="kt_quick_search_toggle"
																					data-toggle="dropdown" data-offset="0px,1px"></div>

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
																<div class="card1 card-custom gutter-b">
																<div class="col-xl-12"style="overflow-x:auto;">

																	<table class="table text-center" id="Mtable">
																	<thead>
																	<tr>
																		<!-- <th scope="col">No</th> -->
																		<th scope="col">Sales & order ID</th>
																		<th scope="col">Order Code</th>
																		<th scope="col">Invoice date</th>
																		<th scope="col">Action</th>

																	</tr>
																</thead>

																<tbody class="add_product" id="add-product"></tbody>


															</table>
															</div>
															</div>
													</form>
												</div>
												<!--end::Container-->
											</div>
										</div>
									</div>
								</div>
							</div>

							<!--end::Entry-->
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
	
	
	 var j=0;
		
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
					}else{
						$('#customer_code').val("");
					}
		        }
			});	
			
			/* alert(ccode); */
			
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
						
					if(row.customer_code == ccode )
						{
						
						j++;
						/* alert(j); */
						
						}
					});
		    	}
			});	
			
			for(var i = 1; i <= j; i++){
			 	  var html = '';
			 	  html += '<tr>'
				/*   html += '<td>' + i + '</td>'; */
		 	      html += '<td><input type="text-center" class=" " id="sales_order_id-' + i +'" name="sales_order_id" style="background-color:#FFFFFF; border:0px; width: 80px; text-align:center" disabled></td>';
			// 	  html += '<td><input type="text-center" class=" " id="invoice_code-' + i +'" name="invoice_code" style="background-color:#FFFFFF; border:0px;  text-align:center" disabled></td>';
		 		  html += '<td><input type="text-center" class=" " id="order_code-' + i +'" name="order_code" style="background-color:#FFFFFF; border:0px;  text-align:center" disabled></td>';
			      html += '<td><input type="text-center" class=" " id="invoice_date-' + i +'" name="invoice_date" style="background-color:#FFFFFF; border:0px;  text-align:center" disabled></td>';
			 	  html += '<td><a type="button"   onClick="nextPage(' + i + ')";  id="nextPage-' + i +'" class="btn_edit btn font-weight-bold btn-primary btn-icon btn-primary text-center"  style="border:0px; width:50px; text-align:center; " ><i class="la la-edit"></i></a>'+
	               '<a type="button"   onClick="viewOrder(' + i + ')";  id="nextPage4-' + i +'" class="btn_edit btn font-weight-bold btn-light-success btn-icon btn-primary text-center ml-3"  style="border:0px; width:50px;  text-align:center; " title="View Order"><i class="la flaticon-eye"></i></a></td>';

			 	  html += '</tr>';
			 	  $('.add_product').append(html);
	}
			var k=0;
 			
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
					
						if(row.customer_code == ccode )
								{
						  k++;
						  $('#sales_order_id-' + k).val(row.sales_and_order_id);
						//	$('#invoice_code-' + k).val(row.invoice_code);
							$('#invoice_date-' + k).val(row.order_date);
							$('#order_code-' + k).val(row.order_code);
						 
							}
					});
		 	}
			});	
			
			
			
	 });
			
		
		
		
		 
	 
		 function nextPage(i){
		
			  let customer_name = $('#customer_name').val();
	          let customer_code =  $('#customer_code').val();
              let sales_order_id =  $('#sales_order_id-'+i).val();
		 	  let invoice_code = $('#invoice_code-'+i).val();
		 	  let invoice_date = $('#invoice_date-'+i).val();
		 	  let order_code = $('#order_code-'+i).val();
		 		/* alert(customer_name); */
		 		var url = "sales-return-master.jsp" + '?customer_name=' + customer_name + '&customer_code=' + customer_code + '&sales_order_id=' + sales_order_id;
		 		//var url = "sales-return-master.jsp"  ;

				window.location.assign(url);
		 
		 }
		 
		 function viewOrder(i){
				
			  let customer_name = $('#customer_name').val();
	          let customer_code =  $('#customer_code').val();
		 	  let order_code = $('#order_code-'+i).val();
		 		/* alert(customer_name); */
            var url = "sales_order_receipt.jsp" + '?customer_code=' + customer_code + '&order_code=' + order_code + '&transaction_id=' + 0;
		 		//var url = "sales-return-master.jsp"  ;

				window.location.assign(url);
		 
		 }
		 
		 
		 
</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>