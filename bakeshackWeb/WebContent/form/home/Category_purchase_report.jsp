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
									<h2 class="text-white font-weight-bold my-2 mr-5">Category Wise Purchese Report
									<!--end::Title-->

								</div>
								<!--end::Heading-->
							</div>
							<!--end::Info-->

						</div>
					</div>
					<!--end::Subheader-->
					<!--begin::Entry-->
					<div class="d-flex">
						<!--begin::Container-->
						<div class="container ">
							
							<div class="row">
								<div class="col-xl-12">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form method="get" class="form" id="kt_form_1">
															<div class="card-body">
																<div class="row">
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Category Name</label><span class="text-danger">*</span>
																			<div class="typeahead">
																				<select class="form-control form-control-solid"
																			name="product" id="category_name">
																			<option value="" disabled selected hidden>Select
																				Product</option>
																		</select>
																			</div>
																		</div>
																	</div>
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Category Code</label> <input type="text"
																				class="form-control form-control-solid form-control-lg"
																				name="category_code" id="category_code" disabled />
																		</div>
																	</div>
																</div>
																<!-- <div class="row  ">
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>Sorted By:</label> <select name="sort_by"
																				id="sort_by" class="form-control form-control-solid">
																				<option value="visit_id">Visit ID</option>
																				<option value="patient_code">patient code</option>
																				<option value="patient_name">patient name</option>
																				<option value="visit_date">visit date</option>
																				<option value="gender">gender</option>
																				<option value="city_desc">city</option>
																				<option value="age">Age</option>
																				<option value="blood_group">blood group</option>
																			</select>
																		</div>
																	</div>
																	<div class=" col-xl-5 form-group row mt-6 ml-1">
																		<label class="col-form-label " id="ascending">Ascending</label>
																		<div class="col-3">
																			<span
																				class="switch switch-outline switch-icon switch-danger switch-sm ">
																				<label> <input type="checkbox" name="select"
																					id="order" /> <span></span>
																			</label> <label class="col-form-label ml-3" id="decending">Decending</label>
																			</span>
																		</div>
																	</div>
																</div> -->
																<div class="row ">
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>From Date</label> <input type="date"
																				class="form-control h-40px  " name="from_date"
																				id="from_date" />
																		</div>
																	</div>
																	<div class="col-xl-5">
																		<div class="form-group">
																			<label>To Date</label> <input type="date"
																				class="form-control h-40px  " name="till_date"
																				id="till_date" />
																		</div>
																	</div>

																</div>
															</div>
															<div class="card-footer text-center">
																<div class="row">
																	<div class="col-lg-3"></div>
																	<div class="col-lg-6">
																		<button type="button" id="show" onclick="printP()"
																			class="btn font-weight-bold btn-primary mr-2 ">Show
																			Report</button>

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
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/main.js"></script>


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';

	 var today = new Date();
	 var dd=today.getDate();
	 if(dd < 10){
		 dd = '0' + dd;
	 }
	 var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+ dd;
	 $('#from_date').val(date);
	 $('#till_date').val(date);
	
	 $.ajax({
			url : base + "/bakeshackAPI/api/getCategoryDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1},
			success:function(data)
		    {
				data.forEach((element)=> {
					
				        $('#category_name').append($(document.createElement('option')).prop({
			                value: element.category_name,
			                text: element.category_name
			            }))
					
				});   
		    }
		});	
	
	
	 var ccode=0;
	 $('#category_name').change(function(){
			
			var category_name = $(this).val();
			$.ajax({
				url : base + "/bakeshackAPI/api/getCategoryDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1,},
				success:function(data)
		        {
					const row = data.find(d => d.category_name == category_name);
					if(row != null){
					   ccode = row.category_id; 
					
						
						$('#category_code').val(row.category_id);
						$('#category_code').addClass("text-muted");
						
						
					}else{
						$('#category_code').val("");
					}
		        }
			});
	 });
	 
	
		
		    function printP() {
		    	
		    	
		    	var category_name = $('#category_name').val();
		    	var category_code = ccode;
		    	var from_date = $('#from_date').val();
		    	var till_date = $('#till_date').val();
		    	
		    	  if(from_date.length > 1 && till_date.length > 1){
		    	
			  var url ="category_purchase_report_print.jsp" + '?category_code=' + category_code  + '&category_name=' + category_name  +  '&from_date=' + from_date + '&till_date=' + till_date ;
           
				window.location.assign(url);  
				
		    	  }
		            else{
		            	alert("Please select the Date Range");
		            }
			}  


	</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>