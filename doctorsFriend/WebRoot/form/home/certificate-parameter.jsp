<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "BAFNA";
	try {
%>


<jsp:include page="../common/header.jsp"></jsp:include>




<body onafterprint="printP()" id="kt_body"
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
						<div class="container">

							<h2
								class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3">Generate
								Certificate</h2>

							<div class="row">
								<div class="col-xl-12">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form method="get" action="certificatePrint.jsp" class="form" id="kt_form_1">
															<div class="card-body">
																<div class="form-group">
																	<label>Select Certificate</label><span
																		class="text-danger">*</span> <select
																		class="form-control form-control-solid"
																		name="cert_code" id="cert_code">
																	
																		<option value="" disabled selected hidden>Select
																			Certificate</option>
																		<option value="fit">Fit Certificate</option>
																		<option value="unfit">Unfit Certificate</option>
																		<option value="ref_letter">Reference Letter</option>
																	</select>
																</div>

																<div id="cert_form">
																	<div class="form-group">
																	<label>Patient Name</label><span
																		class="text-danger">*</span> <input type="text"
																		name="patient_code" id="patient_code"
																		class="form-control form-control-solid"
																		placeholder="Enter Patient name" />
																			<span class="msg text-danger" id="type1"> </span>
																</div>
																<div id="DD">
																<div class="form-group">
																		<label>Date</label> <input type="text"
																			class="form-control form-control-solid form-control-lg"
																			name="date" id="date1" />
																	</div>
																</div>
																<div id="in_ref">
																	<div class="form-group">
																	<label>Ref. Doctor Name</label><span
																		class="text-danger">*</span> <input type="text"
																		name="ref_dr" id="ref_dr"
																		class="form-control form-control-solid"
																		placeholder="Enter Dr name" />
																		<span class="msg text-danger" id="type2"> </span>
																</div>
																
																<div class="form-group">
																	<label>Extra Content</label>
																	<input type="text" name="extra_content" id="extra_content" maxlength="200"
																		class="form-control" rows="5" />
																		
																	
																	<h7><span class="msg text-info" id="type4">enter maximum 200 letters in input box </span></h7>
																</div>
																</div>

																<div id="not_in_ref">
																	<div class="form-group">
																		<label>Age</label> <input type="number" name="age"
																			id="age" class="form-control form-control-solid"
																			placeholder="Enter Age" />
																			<span class="msg text-danger" id="type3"> </span>
																	</div>

																	<div class="form-group">
																		<label>Residence </label> <input type="text"
																			name="residence" id="residence"
																			class="form-control form-control-solid"
																			placeholder="Enter Residence" />
																	</div>

																	<div class="form-group">
																	<label>From Date</label><span class="text-danger">*</span>
																	<input type="date"
																			class="form-control form-control-solid form-control-lg"
																			placeholder="DD/MM/YYYY" name="date" id="date" />
																	<!-- <div class="input-group" id="kt_daterangepicker">
																		<input type="text" class="form-control" name="date" id="date"
																			placeholder="Select date range" />
																		<div class="input-group-append">
																			<span class="input-group-text"><i
																				class="la la-calendar-check-o"></i></span>
																		</div>
																	</div> -->
																</div>


																	<div class="form-group">
																		<label class="rest_label">Date/Days</label><span class="text-danger">*</span>
																		<input 
																			type='number' class="form-control" name="rest_days"
																			id="rest_days" placeholder="Enter Rest Days" /> 
																		<input
																			type='date' class="form-control form-control-solid form-control-lg" name="rest_date" id="rest_date"
																			placeholder="DD/MM/YYYY" />
																			
																	</div>
																</div>

																<div class="form-group">
																	<label>Complaint</label><span class="text-danger">*</span>
																	<select class="form-control form-control-solid"
																		name="complaint_name" id="complaint_name">
																		<option value="" disabled selected hidden>Select
																			Complaint</option>
																	</select>
																</div>

																 <div class="form-group">
																	<input type="text"
																		class="form-control form-control-solid form-control-lg" name="complaint_desc"
																		id="complaint_desc" />
																</div> 
																<div class="form-group" id="extra1">
																	<label>Extra Content</label>
																	<input type="text" name="extra_content1" id="extra_content" maxlength="200"
																		class="form-control" rows="5" />
																		
																	
																	<h7><span class="msg text-info" id="type4">enter maximum 200 letters in input box </span></h7>
																</div>
																
																</div>

															</div>
															<!-- <div class="text-center">
																<button type="submit" id="addCertParam"
																	class="btn btn-primary mr-2">Submit</button>
																<button type="submit" id="updateCertParam"
																	class="btn btn-primary mr-2">Update</button>
																<button type="reset" class="btn btn-secondary">Cancel</button>
															</div> -->
															
														 <div class="text-center">
                        							<button type="submit" class="btn btn-primary font-weight-bold" id="print">Print Certificate</button>
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
	<!--end::Main-->

	<jsp:include page="../common/jsfiles.jsp"></jsp:include>

	<script type="text/javascript">
	
	$('#cert').hide();
	$('#cert_form').hide();
	
	$("#patient_code").change(function(){
		var text=	$("#patient_code").val();
		var letters = /^[A-Za-z(). ]+$/;
		 if(text.match(letters))
	     {
				
			 $('#type1').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type1').text('Please Enter Letters Only.');
	    $("#patient_code").val('');
	     return false;
	     }
		});
	
	$("#ref_dr").change(function(){
		var text=	$("#ref_dr").val();
		var letters = /^[A-Za-z.() ]+$/;
		 if(text.match(letters))
	     {
				
			 $('#type2').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type2').text('Please Enter Letters Only.');
	    $("#ref_dr").val('');
	     return false;
	     }
		});
	
	$("#age").change(function(){
		var text=	$("#age").val();
		var letters =/^[1-9]?[0-9]{0,2}$|^100$/;
		 if(text.match(letters))
	     {
				
			 $('#type3').text('');
		      return true;
	     }
	   else
	     {
		  
		   $('#type3').text('Please Enter Digits Only.');
	    $("#age").val('');
	     return false;
	     }
		});
	
	$("#extra_content").change(function(){
	    var inputStr = $("#extra_content").val();
	    if(inputStr.length<200)
	        $("#type4").html(" "); 
	    else
	        $("#extra_content").html(" ");      
	})
	$('#patient_code').change(function(){
		var value = $(this).val();
		$('.setPatient_name').text(value).css({"font-weight": "500", "text-decoration": "underline"});
	})
	
	$('#age').change(function(){
		var value = $(this).val();
		$('.setAge').text(value).css({"font-weight": "500", "text-decoration": "underline"});
	})
	
	$('#date').change(function(){
		console.log('value');
		var value = $(this).val();
		console.log('value');
		$('.setDate').text(value).css({"font-weight": "500", "text-decoration": "underline"});
	})
	
	$('#residence').change(function(){
		var value = $(this).val();
		$('.setResidence').text(value).css({"font-weight": "500", "text-decoration": "underline"});
	})
	
	$('#rest_days').change(function(){
		var value = $(this).val();
		$('.setRest_days').text(value).css({"font-weight": "500", "text-decoration": "underline"});
	})
	
	$('#rest_date').change(function(){
		var value = $(this).val();
		$('.setRest_date').text(value).css({"font-weight": "500", "text-decoration": "underline"});
	})
	
	$('#ref_dr').change(function(){
		var value = $(this).val();
		$('#setRef_dr').text(value).css({"font-weight": "500", "text-decoration": "underline"});
	})
	
	$('#extra_content').change(function(){
		var value = $(this).val();
		$('#setExtra_content').text(value);
	})
		
	
	$('#cert_code').change(function(){
	
		var cert_code = $(this).val();
		$('#cert_form').show();
		$('#cert').show();
		$('#cert_hidder').hide();
		console.log(cert_code);
		
		if(cert_code == 'fit'){
			$('#cert_name').text('Fitness Certificate')
			$('#unfit').hide();
			$('#ref_letter').hide();
			$('#rest_days').hide();
			$('#rest_date').show();
			$('.rest_label').text("Resume Date");
			$('#fit').show();
			$('#not_in_ref').show();
			$('#in_ref').hide();
			$('#DD').hide();
			$('#extra_content').show();
			
		}
		
		if(cert_code == 'unfit'){
			$('#cert_name').text('Fitness Certificate')
			$('#fit').hide();
			$('#ref_letter').hide();
			$('#rest_date').hide();
			$('#rest_days').show();
			$('.rest_label').text("Rest Days");
			$('#unfit').show();
			$('#not_in_ref').show();
			$('#in_ref').hide();
			$('#DD').hide();
			$('#extra_content').show();
		}
		
		if(cert_code == 'ref_letter'){
			$('#cert_name').text('Reference Letter')
			$('#fit').hide();
			$('#unfit').hide();
			$('#not_in_ref').hide();
			$('#in_ref').show();
			$('#ref_letter').show();
			$('#DD').show();
			$('#extra1').hide();
		}
		
	})
	
	
	
	$( document ).ready(function() {
		var date = new Date();
		var today = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
		$('#date1').val(today);
	});
	
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	
	$('#complaint_desc').hide();

	$.ajax({
		url : base + "/dssAPI/dfapi/getComplaints",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
				
			        $('#complaint_name').append($(document.createElement('option')).prop({
		                value: element.complaint_desc,
		                text: element.complaint_name
		            }))
				
			});   
        }
	});	
	
	$('#complaint_name').change(function(){
 		
	 	$('#complaint_desc').show();
	 	
	 	var complaint_name = $(this).val();
		$('#complaint_desc').val(complaint_name); 
 	});
	
	$('#complaint_desc, #complaint_name').change(function(){
 			 	
	 	var complaint_desc = $(this).val();
		$('.setComplaint').text(complaint_desc).css({"font-weight": "500", "text-decoration": "underline"});
 	});

		$('#updateCertParam').hide();
		$("#addCertParam").show();

		
		var KTBootstrapDaterangepicker = function() {

			// Private functions
			var demos = function() {
				// minimum setup
				$('#date').date({
					buttonClasses : ' btn',
					applyClass : 'btn-primary',
					cancelClass : 'btn-secondary',
					locale: {
					    format: 'DD/MM/YYYY'
					   }
				});
				
				
				$('#rest_date').date({
					   rtl: KTUtil.isRTL(),
					   todayHighlight: true,
					   orientation: "bottom left",
						
						    format: 'dd/mm/yyyy'
						   
					  });

			}

			return {
				// public functions
				init : function() {
					demos();
				}
			};
		}();

		jQuery(document).ready(function() {
			KTBootstrapDaterangepicker.init();
		});
		
		
		
		
		
		
		
		/* $("#print").click(function () {
			$(this).hide();
			$('#cert').show();
			$('#cert_hidder').show();
			//$( "p" ).css( "fontSize", "27px" ); 
			//$( "h4" ).css( "fontSize", "32px" );
			//$( "h1" ).css( "fontSize", "40px" );
		    $("#cert").printThis();
		    
		   
		    
		}); */
		

		

		
	</script>

	<script type="text/JavaScript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.print/1.6.0/jQuery.print.js">
	
	
	function printP() {
	  alert("This document is now being printed");
	}
	
	
	
	</script>

</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>



