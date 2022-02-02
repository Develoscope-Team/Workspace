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
	String session1 = (String) session.getAttribute("login_id");
	if (session.getAttribute("login_id") != null) {
		String sessionName = (String) session.getAttribute("login_id");
	} else
		response.sendRedirect("../common/login.jsp");
%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
						<div
							class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap mr-1">
								<!--begin::Heading-->
								<div class="d-flex flex-column">
									<!--begin::Title-->
									<h2 class="text-white font-weight-bold my-2 mr-5">User Master</h2>
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
													<div class="form-group" id="message"></div>
													<div class="row mt-5 ml-5 mr-5">
														<div class="form-group col-md-6">
															<label>User Name</label><span class="text-danger">*</span>
															<input type="text"
																class="form-control form-control-solid" name="userName"
																id="userName" placeholder="Enter user Name"
																pattern="(?=.*[a-z])(?=.*[A-Z]).{8,}"
																title="Must Contain uppercase and Lowercase letter"
																required /> <span class="msg text-danger" id="type1">
															</span>
														</div>
														<div class="form-group col-md-6">
															<label>Login ID</label><span class="text-danger">*</span>
															<input type="text"
																class="form-control form-control-solid" name="login_id"
																id="login_id" placeholder="Enter Login ID"
																pattern="(?=.*[a-z])(?=.*[A-Z]).{8,}"
																title="Must Contain uppercase and Lowercase letter"
																required />
														</div>
													</div>
													<div class="row mt-5 ml-5 mr-5">
														<div class="form-group col-md-6">
															<label>Password</label><span class="text-danger">*</span>
															<input type="password"
																class="form-control form-control-solid" name="password"
																id="password" placeholder="Enter password"
																pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
																title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
																required /> <span class="msg text-danger" id="type2">
															</span>
														</div>
														<div class="form-group col-md-6">
															<label> Confirm Password</label> <span
																class="text-danger">*</span> <span id='message1'></span><input
																type="confirm_password"
																class="form-control form-control-solid"
																name="confirm_password" id="confirm_password"
																placeholder="Enter password"
																pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
																title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
																required />
														</div>
													</div>
													<div class="row mt-5 ml-5 mr-5">
														<div class="form-group col-md-6">
															<label>Gender</label> <select name="gender" id="gender"
																class="form-control form-control-solid" required>
																<option value="" disabled selected hidden>Select
																	Gender</option>
																<option value="male">Male</option>
																<option value="female">Female</option>
															</select>
														</div>
														<div class="form-group col-md-6">
															<label>Role Type</label><span class="text-danger">*</span>
															<select class="form-control form-control-solid"
																name="role_Type" id="role_Type" required>
																<option value="" disabled selected hidden>Select
																	Role</option>
															</select>
														</div>
													</div>
													<div class="row mt-5 ml-5 mr-5">
														<div class="form-group col-md-6">
															<label>Qualification</label><span class="text-danger">*</span>
															<input type="text"
																class="form-control form-control-solid"
																name="qualification" id="qualification" required />
														</div>
														<div class="form-group col-md-6">
															<label>Birth Date</label><span class="text-danger">*</span>
															<input type="text"
																class="form-control form-control-solid" name="birthDate"
																placeholder="YYYY-MM-DD" id="birthDate" placeholder="Enter Birth Date" required />
														</div>
													</div>
													<div class="row mt-5 ml-5 mr-5">
														<div class="form-group col-md-6">
															<label>Address</label><span class="text-danger">*</span>
															<input type="text-field"
																class="form-control form-control-solid" name="address"
																id="address" placeholder="Enter Address" required />
														</div>
														<div class="form-group col-md-6">
															<label>District</label><span class="text-danger">*</span>
															<input type="text"
																class="form-control form-control-solid" name="district"
																id="district" required />
														</div>
													</div>
													<div class="row mt-5 ml-5 mr-5">
														<div class="form-group col-md-6">
															<label>City</label><span class="text-danger">*</span> <input
																type="text" class="form-control form-control-solid"
																name="city" id="city" required />
														</div>
														<div class="form-group col-md-6">
															<label>Mobile Number</label> <input type="number"
																class="form-control form-control-solid" name="moNumber"
																id="moNumber" placeholder="Enter Mobile Number"
																min="0000000000" max="9999999999" maxlength="10"
																required />
														</div>
													</div>
													<div class="row mt-5 ml-5 mr-5">
														<div class="form-group col-md-6">
															<label>Email</label> <input type="email"
																class="form-control form-control-solid" name="email"
																id="email" placeholder="Enter Email" required /> <span
																class="msg text-danger" id="type11"> </span>
														</div>
													</div>
													<div class="text-center">
														<button type="button" id="addUserDetails"
															class="btn btn-primary mr-2">Submit</button>
														<button type="submit" id="updateUserDetails"
															class="btn btn-primary mr-2">Update</button>
														<button type="button" class="btn btn-secondary"
															id="cancel">Cancel</button>
													</div>
													<!--end::Form-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-12 offset-xl-0">
								<div class="card card-custom gutter-b">
									<div class="card-body">
										<div class="input-icon ml-10" style="width: 30%;">
											<input type="text" class="form-control form-control-solid"
												placeholder="Search..." id="txt_searchall" /> <span>
												<i class="flaticon2-search-1 text-muted"></i>
											</span>
										</div>
										<br />
										<!--begin: Datatable-->
										<table data-toggle="table" class='a'
											data-classes="table table-hover table-condensed "
											data-striped="true" data-sort-name="Quality"
											data-sort-order="desc" data-pagination="false"
											data-scroll="false" data-height=550 id="table-id">
											<thead>
												<tr>
													<th class="col-sm-1 text-center" data-field="NO"
														data-sortable="true">No</th>
													<th class="col-sm-3 text-center" data-field="User-name"
														data-sortable="true">User Name</th>
													<th class="col-sm-3 text-center" data-field="Role-Type"
														data-sortable="true">Role Type</th>

													<th class="col-sm-2 text-center" data-field="Action"
														data-sortable="true">Action</th>
												</tr>
											</thead>
											<tbody class="data">
											</tbody>
										</table>
										<!--end: Datatable-->
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
								<div class="alert alert-warning " role="alert"
									id="warning_alert">
									<div class="alert-text">
										<span id="warning_msg"></span>
									</div>
								</div>
							</div>
						</div>
						<!--end::Container-->
					</div>
				</div>
				<!--end::Entry-->
			</div>
			<!--end::Content-->
		</div>
		<!--end::Wrapper-->
	</div>
	<!--end::Page-->
<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"	xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"	height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2" height="10" rx="1" />
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
$('#password, #confirm_password').on('keyup', function () {
	  if ($('#password').val() == $('#confirm_password').val()) {
	    $('#message1').html('Matching').css('color', 'green');
	  } else 
	    $('#message1').html('Not Matching').css('color', 'red');
	});
$("#userName").change(function(){
	var text=	$("#userName").val();
	var letters = /^[A-Za-z().]+$/;
	 if(text.match(letters))
     {
		 $('.msg').text('');
	      return true;
     }
   else
     {
	   $('.msg').text('Please Enter Letters Only.');
	   $("#userName").val("");
     return false;
     }
	});
$("#passoward").change(function(){
	var text=	$("#passoward").val();
	 var phoneno = /^\d{8} {0,7} $/;
	 if(text.match(password))
     {
		 $('#type2').text('');
	      return true;
     }
   else
     {
	   $('#type2').text('Please Enter Minimum 8 Digits.');
    $("#passoward").val('');
     return false;
     }
	});
$("#email").change(function(){
	var text=	$("#email").val();
	 var phoneno = (/^([A-Za-z0-9_\-\.])+\@([gmail|GMAIL])+\.(com)$/);
	if (text.match(email)) {
		 $('#type11').text('');
    return true;
	}else  {
		   $('#type11').text('Please Enter valid gmail.');
	    $("#email").val('');
	     return false;
	     }
});

// minimum setup
$('#birthDate').datepicker({
 rtl: KTUtil.isRTL(),
 todayHighlight: true,
 orientation: "bottom left",
format: 'yyyy-mm-dd'
});
$.ajax({
	url : base + "/bakeshackAPI/api/getRoleDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"flag":1},
	success:function(data)
    {
		data.forEach((element)=> {
		        $('#role_Type').append($(document.createElement('option')).prop({
	                value: element.role_type,
	                text: element.role_type
	            }))
		});   
    }
});	
$('#updateUserDetails').hide();
$("#addUserDetails").show();
	$('#addUserDetails').click(function() {
						var letters = /^[A-Za-z() .]+$/;
				        var users_name = $('#userName').val();
				        var login_id = $('#login_id').val();
						var password = $('#confirm_password').val();
						var birth_date = $('#birthDate').val();
						var role_Type = $('#role_Type').val();
						var address = $('#address').val();
						var district = $('#district').val();
						var city = $('#city').val();
						var moNumber = $('#moNumber').val();
						var email = $('#email').val();
						var gender = $('#gender').val();
						var flag = 1; // Addition
						var qualification = $('#qualification').val();
						alert(qualification);
						if(users_name != ""  && users_name.match(letters) && password != "" && role_Type != "" && address != "" && birth_date != " " && moNumber != ""&& email != "" && city != ""  && gender != "" && district !=  " "){
						$.ajax({
									url : base + "/bakeshackAPI/api/insertUpdateUsersDetails",
									type : "post",
									dataType : "json",
									async : false,
									data : {
										"users_name" : users_name,
										"login_id" : login_id,
										"password" : password,
										"birth_date" : birth_date,
										"role_type" : role_Type,
										"address" : address,
										"district_desc" : district,
										"city_desc" : city,
										"gender" : gender,
										"mobile_no" : moNumber,
										"email_id" : email,
										"qualification": qualification,
										"flag" : flag
									},
									error : function(xhr) {
										var msg = "(Data insertion failed. Error : "
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

											if (response == 1) {

												var msg = "Users Data inserted Successfully.";
												 $('#success_msg').text(msg);
												 $('#success_alert').addClass("show");
										           $('#success_alert').removeClass("hide");
										           $('#success_alert').addClass("showAlert");
										           setTimeout(function(){
										             $('#success_alert').removeClass("show");
										             $('#success_alert').addClass("hide");
										           },2000);
												location.reload(true);
											} 
										}
									}
								});
						}	
						window.location.reload();
					})
"use strict";
// Class definition
	$('#cancel').click(function() {		
			window.location.reload();
			})
			var users_id;
			var html = "";
			$.ajax({
				url : base + "/bakeshackAPI/api/getUsersDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"users_id": users_id},
				success:function(data)
				{
					const row = data.find(d => d.users_id == users_id);
					data.forEach((row)=> {
						html +="<tr id= tr-id-2 class= tr-class-2>"
						html += "<td>"+row.users_id+"</td>"; 
						html += "<td>"+row.users_name+"</td>";
				        html += "<td>"+row.role_type+"</td>";
			     	    html += '<td><a href="javascript:update('+row.users_id+');" class="btn_action btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="12" height="2" rx="1"/></g></svg></span>'
			     	       	+ '<a href="javascript:deleteById('+row.users_id+');" class="btn_action btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
				        html +="</tr>"
					});
					 $(".data").html(html);
				}
			});	
			$(document).ready(function (){
				   var table = $('#table-id').DataTable();
				});
				$('#cancel').click(function() {		
						window.location.reload();
						})
function update(id) {
			$('#updateUserDetails').show();
			$("#addUserDetails").hide();
			$(".btn_action").hide();
			$(window).scrollTop(0);
			$.ajax({
		        type:"POST",
		        dataType: "json",
		        data:{"users_id": id},
				async : false,
		        url: base + "/bakeshackAPI/api/getUsersDetails",
		        success:function(data)
		        {
		            const row = data.find(d => d.users_id ==id);
		          $('#userName').val(row.users_name);
			        $('#login_id').val(row.login_id);
					 $('#confirm_password').val(row.password);
					 $('#password').val(row.password);
				    $('#birthDate').val(row.birth_date);
					$('#role_Type').val(row.role_type);
					$('#address').val(row.address);
					$('#district').val(row.district_desc);
					$('#city').val(row.city_desc);
					 $('#moNumber').val(row.mobile_no);
					 $('#email').val(row.email_id);
					$('#gender').val(row.gender);
					 $('#qualification').val(row.qualification);
		        }
		     });
			$('#updateUserDetails').click(function() {
								var letters = /^[A-Za-z() .]+$/;
						        var users_name = $('#userName').val();
						        var login_id = $('#login_id').val();
								var password = $('#confirm_password').val();
								var birth_date = $('#birthDate').val();
								var role_Type = $('#role_Type').val();
								var address = $('#address').val();
								var district = $('#district').val();
								var city = $('#city').val();
								var moNumber = $('#moNumber').val();
								var email = $('#email').val();
								var gender = $('#gender').val();
								var qualification = $('#qualification').val();
								var flag = 2; // Addition
								if(users_name != ""  && users_name.match(letters)  && role_Type != ""  && birth_date != " " && moNumber != ""&& email != "" && city != ""  && gender != "" && district !=  " "){
									$.ajax({
											url : base + "/bakeshackAPI/api/insertUpdateUsersDetails",
											type : "post",
											dataType : "json",
											async : false,
											data : {
												"users_name" : users_name,
												"login_id" : login_id,
												"password" : password,
												"birth_date" : birth_date,
												"role_type" : role_Type,
												"address" : address,
												"district_desc" : district,
												"city_desc" : city,
												"gender" : gender,
												"mobile_no" : moNumber,
												"email_id" : email,
												"users_id" : id,
												"qualification": qualification,
												"flag" : flag
											},
											error : function(xhr) {
												var msg = "(Data insertion failed. Error : "
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

													if (response == 1) {

														var msg = "Users Data Updated Successfully.";
														 $('#success_msg').text(msg);
														 $('#success_alert').addClass("show");
												           $('#success_alert').removeClass("hide");
												           $('#success_alert').addClass("showAlert");
												           setTimeout(function(){
												             $('#success_alert').removeClass("show");
												             $('#success_alert').addClass("hide");
												           },2000);
														window.location.reload();
													} 
												}
											}
										});
								}
							})
		}
		$('#cancel').click(function() {
			window.location.reload();
		})						
//Delete data by city_id
function deleteById(users_id){
			var users_id = users_id;
			Swal.fire({
		        title: "Are you sure?",
		        text: "You won't be able to revert this!",
		        icon: "warning",
		        showCancelButton: true,
		        confirmButtonText: "Yes, delete it!",
		        cancelButtonText: "No, cancel!",
		        reverseButtons: true
		    }).then(function(result) {
		        if (result.value) {
	var flag = 3;
	$.ajax({
		url : base + "/bakeshackAPI/api/insertUpdateUsersDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"users_id" : users_id,
			"flag" : flag
		},
		error : function(xhr) {
			var msg = "(Data deletion failed. Error : "
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

				if (response >=1) {

					var msg = "User details Data deleted Successfully.";
					 $('#danger_msg').text(msg);
					$('#danger_alert').addClass("show");
		   	           $('#danger_alert').removeClass("hide");
		   	           $('#danger_alert').addClass("showAlert");
		   	           setTimeout(function(){
		   	             $('#danger_alert').removeClass("show");
		   	             $('#danger_alert').addClass("hide");
		   	           },2000);
					location.reload(true);
				} 
			}
		}
	});
    } else if (result.dismiss === "cancel") {
        window.location.reload();
    }
});
}
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
				 document.addEventListener('keypress', function (e) {
					    if (e.keyCode === 13 || e.which === 13) {
					        e.preventDefault();
					        return false;
					    }
					}); 				 
</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>