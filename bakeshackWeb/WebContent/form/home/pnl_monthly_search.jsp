<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
.alert.show {
	animation: show_slide 1s ease forwards;
}
@keyframes show_slide { 0%{	transform: translateX(100%);}
40%{transform:translateX(-10%);}
80%{transform:translateX(0%);}
100%{transform:translateX(-10px);}
}
@keyframes hide_slide { 0%{	transform: translateX(-10px);}
40%{transform:translateX(0%);}
80%{transform:translateX(-10%);}
100%{transform:translateX(100%);}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
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
						<div class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap mr-1">
								<!--begin::Heading-->
								<div class="d-flex flex-column">
									<!--begin::Title-->
									<h2 class="text-white font-weight-bold my-2 mr-5"> Monthly Profit and Loss Statement</h2>
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
																<div class="row ">
																	<div class="col-xl-6">
																		<div class="form-group">
																			<label>From Date</label> <select type="date"
																				class="form-control form-control-solid h-40px" id="ddlYears">
																				<option value="" disabled selected hidden>Select Year</option>
																				</select>
																		</div>
																	</div>
																	<div class="col-xl-6">
																		<div class="form-group">
																			<label>From Date</label> <select type="date"
																				class="form-control form-control-solid h-40px" id="month">
																				<option value="" disabled selected hidden>Select
																		Month</option>
																				<option value="01">January</option>
																				<option value="02">February</option>
																				<option value="03">March</option>
																				<option value="04">April</option>
																				<option value="05">May</option>
																				<option value="06">June</option>
																				<option value="07">July </option>
																				<option value="08">August</option>
																				<option value="09">September</option>
																				<option value="10">October</option>
																				<option value="11">November</option>
																				<option value="12">December</option>
																				</select>
																		</div>
																	</div>
																	</div>
																<div class="row ">
																	<div class="col-xl-6">
																		<div class="form-group">
																			<label>From Date</label> <input type="text"
																				class="form-control form-control-solid h-40px  " name="from_date"
																				id="from_date" />
																		</div>
																	</div>
																	<div class="col-xl-6">
																		<div class="form-group">
																			<label>To Date</label> <input type="text"
																				class="form-control form-control-solid h-40px  " name="till_date"
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
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"	height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2" height="10" rx="1" />
						<path	d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>

<script type="text/javascript"	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/custom/spinners.js"></script>
<script type="text/javascript"	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/main.js"></script>
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
	 $('#from_date').val(date);
	 $('#till_date').val(date);
	 
	// minimum setup
     $('#from_date,#till_date').datepicker({
      rtl: KTUtil.isRTL(),
      todayHighlight: true,
      orientation: "bottom left",
     format:'yyyy-mm-dd'
     });
	 window.onload = function () {
	        //Reference the DropDownList.
	        var ddlYears = document.getElementById("ddlYears");
	        //Determine the Current Year.
	        var currentYear = (new Date()).getFullYear();
	        //Loop and add the Year values to DropDownList.
	        for (var i = 2010; i <= currentYear; i++) {
	            var option = document.createElement("OPTION");
	            option.innerHTML = i;
	            option.value = i;
	            ddlYears.appendChild(option);
	        }
	    };
	 $('#month').change(function(){
			var month = $(this).val();
			var year = $('#ddlYears').val();
			 var date = year+'-'+ month +'-'+ '01';
			 $('#from_date').val(date);
			var last_day = new Date(year, month , 0).getDate();
			 var till_date = year +'-'+ month +'-'+ last_day;
			$('#till_date').val(till_date);
	 });
 function printP() {
		    	var from_date = $('#from_date').val();
		    	var till_date = $('#till_date').val();
		    	  if(from_date.length > 1 && till_date.length > 1){
			  var url ="daily_sales_and_expenses.jsp" + '?from_date=' + from_date + '&till_date=' + till_date ;
				window.location.assign(url);  
		    	  }
		            else{
		            	 $('#warning_msg').text("Please select the Date Range");
						 $('#warning_alert').addClass("show");
				           $('#warning_alert').removeClass("hide");
				           $('#warning_alert').addClass("showAlert");
				           setTimeout(function(){
				             $('#warning_alert').removeClass("show");
				             $('#warning_alert').addClass("hide");
				           },2000);
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