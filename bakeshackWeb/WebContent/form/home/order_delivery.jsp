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
								
								<div class=" d-flex flex-column">
									<!--begin::Title-->
									<h2 class="text-white font-weight-bold my-2 mr-5">
										Booking Order Delivery</h2>
								</div>
								</div>
								<!--end::Heading-->
								<div class="d-flex align-items-center">
								
									<a href="sales-order-master.jsp" class="btn btn-light-primary font-weight-boldest py-3 px-6 mr-6"><i class="fa fas fa-calculator mr-2"></i>Billing</a>
								
								
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
																		<th style="width: 10%;"  > ID</th>
																		<th style="width: 20%;">Order Code</th>
																		<th style="width: 30%;">Order date</th>
																	   <th style="width: 10%;"> Status</th>
																		<th style="width: 35%;">Action</th>

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
			
			
			
			$.ajax({
				url : base + "/bakeshackAPI/api/getOrderMasterDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"customer_code": ccode},
				success:function(data)
		    	{
					
					const row = data.find(d => d.customer_code == ccode);
					data.forEach((row)=> {
						
					if(row.customer_code == ccode )
						{
						
						j++;
						
						
						}
					});
		    	}
			});	
			
			for(var i = 1; i <= j; i++){
			 	  var html = '';
			 	  html += '<tr>'
		 	      html += '<td><input type="text-center" class=" " id="order_booking_id-' + i +'" name="order_booking_id" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
		 		  html += '<td><input type="text-center" class=" " id="order_code-' + i +'" name="order_code" style="background-color:#FFFFFF; border:0px;  text-align:center" disabled></td>';
			 	  html += '<td><input type="text-center" class=" " id="invoice_date-' + i +'" name="invoice_date" style="background-color:#FFFFFF; border:0px;  text-align:center" disabled></td>';
                  html += '<td><span class="label font-weight-bold label-lg label-light-danger label-inline" id="status1-' + i +'"></span>'+
                               '<span class="label font-weight-bold label-lg label-light-success label-inline" id="status2-' + i +'"></span>'+
                               '<span class="label font-weight-bold label-lg label-light-primary label-inline" id="status3-' + i +'"></span></td>';			 
		 		  html += '<td><a type="button"   onClick="nextPage(' + i + ')";  id="nextPage1-' + i +'" class="btn_edit btn font-weight-bold btn-light-primary btn-icon btn-primary text-center mr-3"  style="border:0px; width:30px; height:30px; text-align:center; " title="Billing Order" ><i class="fa fas fa-calculator"></i></a>'+
		 		              '<a type="button"   onClick="modifyOrder(' + i + ')";  id="nextPage2-' + i +'" class="btn_edit btn font-weight-bold btn-secondary btn-icon btn-primary text-center mr-3"  style="border:0px; width:30px; height:30px; text-align:center; " title="Modify Order" ><i class="la flaticon2-edit"></i></a>'+
		 		              '<a type="button"   onClick="deleteOrder(' + i + ')";  id="nextPage3-' + i +'" class="btn_edit btn font-weight-bold btn-light-danger btn-icon btn-primary text-center mr-3"  style="border:0px; width:30px; height:30px; text-align:center; " title="Cancel Order" ><i class="la flaticon-cancel"></i></a>'+
		 		               '<a type="button"   onClick="viewOrder(' + i + ')";  id="nextPage4-' + i +'" class="btn_edit btn font-weight-bold btn-light-success btn-icon btn-primary text-center mr-3"  style="border:0px; width:30px; height:30px; text-align:center; " title="View Order"><i class="la flaticon-eye"></i></a></td>';
                html += '<td><input type="text-center" class=" " id="invoice_code-' + i +'" name="invoice_code" style="background-color:#FFFFFF; border:0px;  text-align:center" hidden></td>';

		 		               html += '</tr>';
			 	  $('.add_product').append(html);
	}
			var k=0;
 			
			$.ajax({
				url : base + "/bakeshackAPI/api/getOrderMasterDetails",
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
						  var status = row.status;
						  if(status == '0')
							  {
							  
								$('#status1-' + k).text('Canceled');
								$('#status2-' + k).hide();
								$('#status3-' + k).hide();
								$('#nextPage1-' + k).hide();
								$('#nextPage2-' + k).hide();
								$('#nextPage3-' + k).hide();
								
							  }
						  else if(status == '1'){
							  $('#status1-' + k).hide();
								$('#status2-' + k).text('Pending');
								$('#status3-' + k).hide();
							 
						  }
						  else{
							  $('#status1-' + k).hide();
								$('#status2-' + k).hide();
								$('#status3-' + k).text('Delivered');
								$('#nextPage1-' + k).hide();
								$('#nextPage2-' + k).hide();
								$('#nextPage3-' + k).hide();
							 
						  }
						  $('#order_booking_id-' + k).val(row.order_master_id);
							$('#invoice_code-' + k).val(row.invoice_code);
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
              let order_booking_id =  $('#order_booking_id-'+i).val();
		 	  let invoice_code = $('#invoice_code-'+i).val();
		 	  let invoice_date = $('#invoice_date-'+i).val();
		 	  let order_code = $('#order_code-'+i).val();
		 		var url = "order_booking_conformation.jsp" + '?customer_name=' + customer_name + '&customer_code=' + customer_code + '&order_code=' + order_code;

				window.location.assign(url);
		 
		 }
		 
		 function modifyOrder(i){
				
			  let customer_name = $('#customer_name').val();
	          let customer_code =  $('#customer_code').val();
             let order_booking_id =  $('#order_booking_id-'+i).val();
		 	  let invoice_code = $('#invoice_code-'+i).val();
		 	  let invoice_date = $('#invoice_date-'+i).val();
		 	  let order_code = $('#order_code-'+i).val();
		 		var url = "order_modification.jsp" + '?customer_name=' + customer_name + '&customer_code=' + customer_code + '&order_code=' + order_code;

				window.location.assign(url);
		 
		 }
		 
		 
		 function deleteOrder(i){
				
			  let customer_name = $('#customer_name').val();
	          let customer_code =  $('#customer_code').val();
             let order_booking_id =  $('#order_booking_id-'+i).val();
		 	  let invoice_code = $('#invoice_code-'+i).val();
		 	  let invoice_date = $('#invoice_date-'+i).val();
		 	  let order_code = $('#order_code-'+i).val();
		 		var url = "order_cancellation_screen.jsp" + '?customer_name=' + customer_name + '&customer_code=' + customer_code + '&order_code=' + order_code;

				window.location.assign(url);
		 
		 }
		 
		 function viewOrder(i){
				
			  let customer_name = $('#customer_name').val();
	          let customer_code =  $('#customer_code').val();
             let order_booking_id =  $('#order_booking_id-'+i).val();
		 	  let invoice_code = $('#invoice_code-'+i).val();
		 	  let invoice_date = $('#invoice_date-'+i).val();
		 	  let order_code = $('#order_code-'+i).val();
		 		var url = "order_booking_receipt.jsp" + '?customer_code=' + customer_code + '&order_code=' + order_code + '&invoice_id=' + invoice_code;

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