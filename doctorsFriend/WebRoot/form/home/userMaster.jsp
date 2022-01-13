<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAFNA";
try {
%>
<html lang="en">
<!--begin::Head-->
<head>
	
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
<!--end::Head-->
<!--begin::Body-->

<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<body id="kt_body"
style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-77.jpeg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<!--begin::Main-->
	<!--begin::Header Mobile-->
	
	<!--end::Header Mobile-->
	
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			
      <jsp:include page="/form/common/navbar.jsp"></jsp:include>

			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<jsp:include page="/form/common/header.jsp"></jsp:include>
							<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<div class="d-flex flex-column-fluid">
											<div class="container d-flex align-items-stretch justify-content-between"">
							<div class="col-xl-12 offset-xl-1">

								<h2
									class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3"  >User
									Master</h2>
								
									<div class="col-xl-10 offset-xl-0">
										<div class="example mb-10">
											<div class="example-preview">
												<div class="card card-custom">
													<form class="form" id="kt_form_1">
														<div class="card-body">
														
														<div class="col-xl-6 offset-xl-3">
															<div class="form-group" id="message"></div>
									<div class="form-group">
										<label>User Name</label><span class="text-danger">*</span> <input
											type="text" class="form-control form-control-solid"
											name="userName" id="userName" placeholder="Enter user Name"
											pattern="(?=.*[a-z])(?=.*[A-Z]).{8,}"
											title="Must Contain uppercase and Lowercase letter" required />
										<span class="msg text-danger" id="type1"> </span>
									</div>
									<div class="form-group">
										<label>Password</label><span class="text-danger">*</span> <input
											type="password" class="form-control form-control-solid"
											name="password" id="password" placeholder="Enter password"
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
											title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
											required />
									</div>
									<div class="form-group">
										<label>Role Type</label><span class="text-danger">*</span> <select
											class="form-control form-control-solid" name="role_Type"
											id="role_Type" required>
											<option value="" disabled selected hidden>Select
												Role</option>
										</select>
									</div>
									<div class="form-group">
										<label>Qualification</label><span class="text-danger">*</span>
										<select class="form-control form-control-solid"
											name="qualification" id="qualification" required>
											<option value="" disabled selected hidden>Select
												Qualification</option>
										</select>
									</div>
									<div class="form-group">
										<label>Birth Date</label><span class="text-danger">*</span> <input
											type="date" class="form-control form-control-solid"
											name="birthDate" id="birthDate"
											placeholder="Enter Birth Date" required />
									</div>
									<div class="form-group">
										<label>Address</label><span class="text-danger">*</span> <input
											type="text-field" class="form-control form-control-solid"
											name="address" id="adress" placeholder="Enter Address"
											required />
									</div>
									<div class="form-group">
										<label>District</label><span class="text-danger">*</span> <select
											class="form-control form-control-solid" name="district"
											id="district" required>
											<option value="" disabled selected hidden>Select
												district</option>
										</select>
									</div>
									<div class="form-group">
										<label>City</label><span class="text-danger">*</span> <select
											class="form-control form-control-solid" name="city" id="city"
											required>
											<option value="" disabled selected hidden>Select
												city</option>
										</select>
									</div>

									<div class="form-group">
										<label>Mobile Number</label> <input type="number"
											class="form-control form-control-solid" name="moNumber"
											id="moNumber" placeholder="Enter Mobile Number"
											min="0000000000" max="9999999999" maxlength="10" required />
									</div>
									<div class="form-group">
										<label>Email</label> <input type="email"
											class="form-control form-control-solid" name="email"
											id="email" placeholder="Enter Email" required />
									</div>
									<div class="form-group">
										<label>Government Id</label><span class="text-danger">*</span>
										<input type="text" class="form-control form-control-solid"
											name="gov_id" id="gov_id"
											placeholder="Enter Goverment ID number" required />
									</div>


									<div class="form-group">
										<label>Gender</label> <select name="gender" id="gender"
											class="form-control form-control-solid" required>
											<option value="" disabled selected hidden>Select
												Gender</option>
											<option value="male">Male</option>
											<option value="female">Female</option>
										</select>
									</div>
															</div>
															
														</div>
														<div class="card-footer">
									<div class="row">
										<div class="col-lg-3"></div>
										<div class="col-lg-6 offset-xl-2">
											<button type="submit" id="addUserDetails"
												class="btn font-weight-bold btn-primary mr-2">Submit</button>
											<button type="submit" id="updateUserDetails"
												class="btn btn-primary mr-2">Update</button>
											<button type="reset"
												class="btn font-weight-bold btn-secondary" id="cancel">Cancel</button>
										</div>
									</div>
								</div>
								<div class="card-body">

									<!--begin: Datatable-->
									<div class="datatable datatable-bordered datatable-head-custom"
										id="kt_datatable"></div>
									<!--end: Datatable-->
								</div>
													</form>
													<div class="alert alert-success  " role="alert"
								id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
													
													<!--end::Form-->
												</div>
											</div>
										</div>
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
				</div>
				<!--end::Entry-->



				<!--end::Content-->
				<!--begin::Footer-->
				
				<!--end::Footer-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<!--end::Main-->
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Navigation/Up-2.svg-->
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
	<style>
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

@
keyframes show_slide { 0%{
	transform: translateX(100%);
}

40
%
{
transform
:
translateX(
-10%
);
}
80
%
{
transform
:
translateX(
0%
);
}
100
%
{
transform
:
translateX(
-10px
);
}
}
@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}

40
%
{
transform
:
translateX(
0%
);
}
80
%
{
transform
:
translateX(
-10%
);
}
100
%
{
transform
:
translateX(
100%
);
}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
	<!--end::Scrolltop-->
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	
	<script type="text/javascript">

var basePath='<%=basePath%>';    
var base='<%=base%>';

$("#userName").change(function(){
	var text=	$("#userName").val();
	var letters = /^[A-Za-z() .]+$/;
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

const email = document.getElementById("email");

email.addEventListener("input", function (event) {
  if (email.validity.typeMismatch) {
    email.setCustomValidity("I am expecting an e-mail address!");
  } else {
    email.setCustomValidity("");
  }
});
$.ajax({
	url : base + "/dssAPI/dfapi/getRoleDetails",
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


$.ajax({
	url : base + "/dssAPI/dfapi/getCityDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"flag":1},
	success:function(data)
    {
		data.forEach((element)=> {
			
		        $('#city').append($(document.createElement('option')).prop({
	                value: element.city_name,
	                text: element.city_name
	            }))
			
		});   
    }
});	
$.ajax({
	url : base + "/dssAPI/dfapi/getDistrictDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"flag":1},
	success:function(data)
    {
		data.forEach((element)=> {
			
		        $('#district').append($(document.createElement('option')).prop({
	                value: element.district_name,
	                text: element.district_name
	            }))
			
		});   
    }
});	
$.ajax({
	url : base + "/dssAPI/dfapi/getQualificationDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"flag":1},
	success:function(data)
    {
		data.forEach((element)=> {
			
		        $('#qualification').append($(document.createElement('option')).prop({
	                value: element.degree_name,
	                text: element.degree_name
	            }))
			
		});   
    }
});	

$('#updateUserDetails').hide();
$("#addUserDetails").show();



	$('#addUserDetails')
			.click(
					function() {
						
					
							var letters = /^[A-Za-z() .]+$/;
				        var users_name = $('#userName').val();
						var password = $('#password').val();
						var birth_date = $('#birthDate').val();
						var role_Type = $('#role_Type').val();
						var address = $('#address').val();
						var district = $('#district').val();
						var city = $('#city').val();
						var moNumber = $('#moNumber').val();
						var email = $('#email').val();
						var gov_id = $('#gov_id').val();
						var gender = $('#gender').val();
						var flag = 1; // Addition

						if(users_name != ""  && users_name.match(letters) && password != "" && role_Type != "" && address != "" && birth_date != " " && moNumber != ""&& email != "" && city != "" && gov_id != " " && gender != "" && district !=  " "){
						$.ajax({
									url : base + "/dssAPI/dfapi/insertUpdateUsersDetails",
									type : "post",
									dataType : "json",
									async : false,
									data : {
										"users_name" : users_name,
										"password" : password,
										"birth_date" : birth_date,
										"role_type" : role_Type,
										"address" : address,
										"district_desc" : district,
										"city_desc" : city,
										"gender" : gender,
										"mobile_no" : moNumber,
										"email_id" : email,
										"gov_id" : gov_id,
										"flag" : flag
									},
									error : function(xhr) {
										var msg = "(Data insertion failed. Error : "
												+ xhr.status
												+ " "
												+ xhr.statusText;
										alert(msg);
									},
									success : function(response) {
										if (response != null) {

											if (response == 1) {

												var msg = "Users Data inserted Successfully.";
												alert(msg);

											} 
										}
									}

								});
						}		
 
					})
				
					
"use strict";
// Class definition

var KTDatatableRemoteAjaxDemo = function() {
    // Private functions
	
    // basic demo
    var demo = function() {
		var medicineId=null;
        var datatable = $('#kt_datatable').KTDatatable({
            // datasource definition
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: base + "/dssAPI/dfapi/getUsersDetails",
                        // sample custom headers
                        // headers: {'x-my-custom-header': 'some value', 'x-test-header': 'the value'},
                        map: function(raw) {
                            // sample data mapping
                            var dataSet = raw;
                            if (typeof raw.data !== 'undefined') {
                                dataSet = raw.data;
                            }
                            return dataSet;
                        },
                    },
                },
                pageSize: 10,
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true,
            },

            // layout definition
            layout: {
							scroll: true, // enable/disable datatable scroll both horizontal and vertical when needed.
							height: 550, // datatable's body's fixed height
							footer: false, // display/hide footer
						},

            // column sorting
            sortable: false,

            pagination: false,

            search: {
                input: $('#kt_datatable_search_query'),
                key: 'generalSearch'
            },

            // columns definition
            columns: [{
                field: 'users_id',
                title: '#',
                sortable: 'asc',
                width: 30,
                type: 'number',
                selector: false,
                textAlign: 'center',
            }, {
                field: 'users_name',
                title: 'Users Name',
            }, {
                field: 'role_type',
                title: 'Role Type',
                
            },{
                field: 'birth_date',
                title: 'Birth Date',
                
            }, {
                field: 'mobile_no',
                title: 'Mobile No',
                
            },{
                field: 'email_id',
                title: 'Email Id',
                
            }, {
                field: 'Actions',
                title: 'Actions',
                sortable: false,
                width: 125,
                overflow: 'visible',
                autoHide: false,
                template: function(row) {
                    return '\
                        <a href="javascript:deleteById('+row.users_id+');" class="btn_delete btn-sm btn-clean btn-icon" title="Delete">\
                            <span class="svg-icon svg-icon-md">\
                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">\
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">\
                                        <rect x="0" y="0" width="24" height="24"/>\
                                        <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"/>\
                                        <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/>\
                                    </g>\
                                </svg>\
                            </span>\
                        </a>\
                    ';
                },
            }],

        });

		
    };

    return {
        // public functions
        init: function() {
            demo();
        },
    };
}();

jQuery(document).ready(function() {
    KTDatatableRemoteAjaxDemo.init();
});	
	$('#cancel')
	.click(
			function() {		
			window.location.reload();
			})

//Delete data by city_id
function deleteById(id){
	alert("hello");
	
	var users_id = id;
	var flag = 3;
	
	$.ajax({
		url : base + "/dssAPI/dfapi/insertUpdateUsersDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"users_id" : users_id,
			"users_name" : "0",
			"password" : "0",
			"birth_date" : "0",
			"role_type" : "0",
			"address" : "0",
			"district_desc" : "0",
			"city_desc" : "0",
			"gender" : "0",
			"mobile_no" : "0",
			"email_id" : "0",
			"gov_id" : "0",
			"flag" : flag
		},
		
		error : function(xhr) {
			var msg = "(Data deletion failed. Error : "
					+ xhr.status
					+ " "
					+ xhr.statusText;
			alert(msg);
		},
		success : function(response) {
			if (response != null) {

				if (response >=1) {

					var msg = "User details Data deleted Successfully.";
					alert(msg);
					location.reload(true);

				} 
			}
		}

	});
	 
}
</script>


</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>