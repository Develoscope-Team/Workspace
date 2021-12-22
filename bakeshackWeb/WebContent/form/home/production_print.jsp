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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
	
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
				id="kt_header_mobile_toggle">
				 
			</button>
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
						<!--begin::Container-->
							<div class="container mt-10" style="font-size: 16px;">
								<!-- begin::Card-->
								<div class="card card-custom overflow-hidden">
									<div class="card-body p-0">
										<!-- begin: Invoice-->
										<!-- begin: Invoice header-->
										<div class="row justify-content-center bgi-size-cover bgi-no-repeat py-8 px-8 py-md-20 px-md-0" >
											<div class="col-md-10 ">
												
										
													<h1 class=" text-black font-weight-boldest mb-10 mt-25 text-center ">Production Print</h1>
													
												
												
								<div id="name" class="col-md-12">
												<span
													class="d-flex justify-content-between align-items-baseline">

													<div class="d-flex justify-content-start">
														<div class="  font-weight-bolder ml-3 ">Product Name:
														</div>
														<span class="font-weight-bolder ml-2" id="product_name"></span>
													</div>

													<div class="d-flex justify-content-start">
														<div class="  font-weight-bolder ">Production Date:</div>
														<span class="font-weight-bolder " id="product_date"></span>
													</div>
												</span>

											</div>
											</br>

											<div  class="col-md-12">
												<span
													class="d-flex justify-content-between align-items-baseline">

													<div class="d-flex justify-content-start">
														<div class="  font-weight-bolder ml-3 ">Product Qty:
														</div>
														<span class="font-weight-bolder ml-2" id="product_qty"></span>
													</div>

													<div class="d-flex justify-content-start">
														<div class="  font-weight-bolder ">Expiry Date:</div>
														<span class="font-weight-bolder " id="expiry_date"></span>
													</div>
												</span>

											</div>



										</div>
									</div>
									<!-- end: Invoice header-->
									<!-- begin: Invoice body-->
									<div
										class="row justify-content-center py-8 px-8 py-md-10 px-md-0 ml-3">
										<div class="col-md-10">
										<h2
												class=" text-black font-weight-bolder  text-center mb-5 " style="font-size: 18px;"><u> Raw Material List</u></h2>
										
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th class="pl-0 font-weight-bold text-muted "
																style="font-size: 16px;" id="no">Sr.No</th>
															<th class="text-center font-weight-bold text-muted "
																style="font-size: 16px;" id="raw_material">Raw Material Name</th>
															<th class="text-center font-weight-bold text-muted "
																style="font-size: 16px;" id="unit">Unit</th>
															<th class="text-center font-weight-bold text-muted "
																style="font-size: 16px;" id="raw_qty">Raw Qty.</th>
															<th class="text-center pr-0 font-weight-bold text-muted "
																style="font-size: 16px;" id="actual_qty">Actual Qty. </th>
																<th class="text-center pr-0 font-weight-bold text-muted "
																style="font-size: 16px;" id="qty_diffe">Qty Difference </th>
														</tr>
													</thead>
													<tbody class="t_body text-center">

													</tbody>
												</table>
											</div>
										</div>
									</div>

									<!-- end: Invoice body-->
									<div class="row   col-md-10 justify-content-center mt-15 ml-35">
										<div class="col-md-10">
											<div class="  font-weight-bold text-right ">
												<span>Verified by, </span></br> </br> </br> <span>
													Signature.</span> 
												<!-- 												 <button type="button" class="btn btn-primary font-weight-bold" onclick="window.print();">Print Invoice</button> 
 -->
											</div>
										</div>
									</div>
									<!-- begin: Invoice footer-->
									
									
										<!-- end: Invoice footer-->
										<!-- begin: Invoice action-->
										
									<div class="modal" id="bankModel" tabindex="-1"
										role="dialog" aria-labelledby="staticBackdrop"
										aria-hidden="true">
										<div class="modal-dialog  modal-dialog-scrollable"
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
													<div class="form-group" id="nb_div">
									
										<label>Received Bank</label> <select
													class="form-control form-control-solid" id="received_bank">
													 <option value="">Select a bank</option>
													 
													 </select> 
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
										<div
										class="row col-md-10 justify-content-center offset-1 mt-10 mb-10">
										<div class="col-md-10" id="print_button">


											<button type="button"
												class="btn-print btn-primary font-weight-bold" id="print_button1"
												>Print Invoice</button>

										</div>
									</div>
										<!-- end: Invoice action-->
										<!-- end: Invoice-->
									</div>
								</div>
								<!-- end::Card-->
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
	<script src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	    
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const production_id = urlParams.get('production_id');
	var ccode=0;
	var r=0;
	$('#product_name').text(production_id);
	$.ajax({
			url : base + "/bakeshackAPI/api/getProductionDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				const row = data.find(d => d.production_id == production_id);
				if(row != null){
					ccode = row.production_id; 
				
					$('#product_name').text(row.product_name);
					$('#product_date').text(row.product_date);
					$('#product_qty').text(row.product_qty);
					$('#expiry_date').text(row.expiry_date);
				
				   	const parsedData = JSON.parse(row.product_req);
				    $(parsedData).each(function(index) {
						r++;
							$('#product_name-' + (index + 1)).val(parsedData[index]['product_name']);
							$('#unit-' + (index + 1)).val(parsedData[index]['unit']);
							 $('#raw_qty-' + (index + 1)).val(parsedData[index]['raw_qty']); 
							$('#actual_qty-' + (index + 1)).val(parsedData[index]['actual_qty']);
						
						});
			
				    for(var i = 1; i <=r; i++){
						  var html = '';
						  html += '<tr>'
							  html += '<td  style="width: 50px; text-align:left; font-size: 16px; ">' + i + '</td>';
					 	      html += '<td><input type="text" class=" form-control Product Details d-flex flex-column-fluid" id="product_name-' + i +'" name="product_nmae" style="background-color:#FFFFFF; border:0px; width: 200px; text-align:left; font-size: 16px;" disabled></td>';
						 	  html += '<td><input type="text" class=" form-control unit  d-flex flex-column-fluid" id="unit-' + i +'" name="unit" style="background-color:#FFFFFF; border:0px; width: 120px; text-align:center; font-size: 16px;" disabled></td>';
					 		  html += '<td><input type="text" class=" form-control raw qty   d-flex flex-column-fluid" id="raw_qty-' + i +'" name="raw_qty" style="background-color:#FFFFFF; border:0px; width: 100px; text-align:center; font-size: 16px;" disabled></td>';
					 		  html += '<td><input type="text" class=" form-control actual qty   d-flex flex-column-fluid" id="actual_qty-' + i +'" name="actual_qty" style="background-color:#FFFFFF; border:0px; width: 120px; text-align:center; font-size: 16px;" disabled></td>';
					 		  html += '<td><input type="text" class=" form-control qty Diff   d-flex flex-column-fluid" id="qty_diffe-' + i +'" name="qty_diffe" style="background-color:#FFFFFF; border:0px; width: 120px; text-align:center; font-size: 16px;" disabled></td>';

						 	 html += '</tr>';
						  $('.t_body').append(html);
				 }
					 const parsedData1 = JSON.parse(row.product_req);
					 $(parsedData1).each(function(index) {
							$('#product_name-' + (index + 1)).val(parsedData1[index]['product_name']);
							$('#unit-' + (index + 1)).val(parsedData1[index]['unit']);
							$('#raw_qty-' + (index + 1)).val(parsedData1[index]['req_qty']);
							$('#actual_qty-' + (index + 1)).val(parsedData1[index]['actual_qty']);
							$('#qty_diffe-' + (index + 1)).val(parsedData1[index]['req_qty'] - parsedData1[index]['actual_qty']);
						
						});	
					
				}
	        }
		});	
	
		
			$("#print_button1").click(function(){
			
				$("#print_button").hide();
				window.print();
				
				
			}
					)
	</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>