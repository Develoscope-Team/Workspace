
<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	String dbConnVar = "BAFNA";
	try {
%>

<!DOCTYPE html>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/jsfiles.jsp"></jsp:include>
<html lang="en">
	
	<head><base href="../../../../">
		<meta charset="utf-8" />
		<title>Login Page </title>
		<meta name="description" content="Login page example" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<link rel="canonical" href="https://keenthemes.com/metronic" />
		<!--begin::Fonts-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Page Custom Styles(used by this page)-->
	</head>
	<!--end::Head-->
	<!--begin::Body-->
	<body id="kt_body" class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed subheader-enabled aside-enabled aside-static page-loading">
		<!--begin::Main-->
		<div class="d-flex flex-column flex-root">
			<!--begin::Login-->
			<div class="login login-6 login-signin-on login-signin-on d-flex flex-column-fluid" id="kt_login">
				<div class="d-flex flex-column flex-lg-row flex-row-fluid text-center" style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-3.jpg); background-repeat: no-repeat;
                       background-size: cover;   height: 100vh; top: 0;">
					<!--begin:Aside-->
					<div class="d-flex w-80 flex-center p-15"  style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-35.jpg); background-repeat: no-repeat;   width: 100%;
                           height: 100vh; background-size: cover; top: 0;">
						<div class="login-wrapper">
							<!--begin:Aside Content-->
							
							<div class="text-dark-75">
							
							 	<%-- <a href="#" >
									<img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/gif/logo.png" class="mt-0 max-h-200px" alt="" />
								</a>  --%>
								<!-- <h2 class="mb-8 mt-2 font-weight-bold">JOIN OUR GREAT COMMUNITY</h2> -->
								<!-- <h3 class="mb-5  font-weight-bold text-#0000FF" style="color:#C70039 ">The ultimate Bootstrap &amp; Angular 6 admin theme framework for next generation web apps.</h3> -->
								
							</div>
							<!--end:Aside Content-->
						</div>
					</div>
					<!--end:Aside-->
					<!--begin:Divider-->
					<div class="login-divider">
						<div></div>
					</div>
					<!--end:Divider-->
					<!--begin:Content-->
					<div class="d-flex w-100 flex-center p-15 position-relative overflow-hidden">
						<div class="login-wrapper">
							<!--begin:Sign In Form-->
							<div class="login-signin">
								<div class="text-center  mt-10 mb-5 ">
							
									<h2 class="font-weight-bold">Sign In</h2>
									<p class="text-muted font-weight-bold">Enter your username and password</p>
								</div>
								<form class="form text-left" id="kt_login_signin_form">
									<div class="form-group py-2 m-0">
										<input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="text" id="login_id" placeholder="Username" name="username" autocomplete="off" />
									</div>
									<div class="form-group py-2 border-top m-0">
										<input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="Password" id="pass"placeholder="Password" name="password" />
									</div>
									<div class="form-group d-flex flex-wrap justify-content-between align-items-center mt-5">
										<div class="checkbox-inline">
											<label class="checkbox m-0 text-muted font-weight-bold">
											<input type="checkbox" name="remember" />
											<span></span>Remember me</label>
										</div>
										<a href="javascript:;" id="kt_login_forgot" class="text-muted text-hover-primary font-weight-bold ml-2">Forget Password ?</a>
									</div>
									<div class="text-center mt-15">
										<button id=kt_login_singin_form_submit_button class="btn btn-primary btn-pill shadow-sm py-4 px-9 font-weight-bold">Sign In</button>
									</div>
								</form>
							</div>
							<!--end:Sign In Form-->
							<!--begin:Sign Up Form-->
							<!-- <div class="login-signup">
								<div class="text-center mb-10 mb-lg-20">
									<h3 class="">Sign Up</h3>
									<p class="text-muted font-weight-bold">Enter your details to create your account</p>
								</div>
								<form class="form text-left" id="kt_login_signup_form">
									<div class="form-group py-2 m-0">
										<input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="text" placeholder="Fullname" name="fullname" />
									</div>
									<div class="form-group py-2 m-0 border-top">
										<input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="text" placeholder="Email" name="email" autocomplete="off" />
									</div>
									<div class="form-group py-2 m-0 border-top">
										<input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="password" placeholder="Password" name="password" />
									</div>
									<div class="form-group py-2 m-0 border-top">
										<input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="password" placeholder="Confirm Password" name="cpassword" />
									</div>
									<div class="form-group mt-5">
										<div class="checkbox-inline">
											<label class="checkbox checkbox-outline font-weight-bold">
											<input type="checkbox" name="agree" />
											<span></span>I Agree the
											<a href="#" class="ml-1">terms and conditions</a>.</label>
										</div>
									</div>
									<div class="form-group d-flex flex-wrap flex-center">
										<button id="kt_login_signup_submit" class="btn btn-primary btn-pill font-weight-bold px-9 py-4 my-3 mx-2">Submit</button>
										<button id="kt_login_signup_cancel" class="btn btn-outline-primary btn-pill font-weight-bold px-9 py-4 my-3 mx-2">Cancel</button>
									</div>
								</form>
							</div> -->
							<!--end:Sign Up Form-->
							<!--begin:Forgot Password Form-->
							<!-- <div class="login-forgot">
								<div class="text-center mb-10 mb-lg-20">
									<h3 class="">Forgotten Password ?</h3>
									<p class="text-muted font-weight-bold">Enter your email to reset your password</p>
								</div>
								<form class="form text-left" id="kt_login_forgot_form">
									<div class="form-group py-2 m-0 border-bottom">
										<input class="form-control h-auto border-0 px-0 placeholder-dark-75" type="text" placeholder="Email" name="email" autocomplete="off" />
									</div>
									<div class="form-group d-flex flex-wrap flex-center mt-10">
										<button id="kt_login_forgot_submit" class="btn btn-primary btn-pill font-weight-bold px-9 py-4 my-3 mx-2">Submit</button>
										<button id="kt_login_forgot_cancel" class="btn btn-outline-primary btn-pill font-weight-bold px-9 py-4 my-3 mx-2">Cancel</button>
									</div>
								</form>
							</div> -->
							<!--end:Forgot Password Form-->
						</div>
					</div>
					<!--end:Content-->
				</div>
			</div>
			<!--end::Login-->
		</div>
		<!--end::Main-->
		<script>var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";</script>
		<!--begin::Global Config(global config for global JS scripts)-->
		<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#6993FF", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#E1E9FF", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>
		<!--end::Global Config-->
		<!--begin::Global Theme Bundle(used by all pages)-->
		<!--end::Global Theme Bundle-->
		<!--begin::Page Scripts(used by this page)-->
		<!--end::Page Scripts-->
<script type="text/javascript">	
	    	
var basePath='<%=basePath%>';    
var base='<%=base%>';  
		$('#kt_login_singin_form_submit_button').click(function(){
         		var login_id = $('#login_id').val();
            	var password = $('#pass').val();
            	
            		$.ajax({
	 				url : base + "/dssAPI/dfapi/getUsersDetails",
	 				type : "post",
	 				dataType : "json",
	 				async : false,
	 				data : {"flag":1,},
	 				success:function(data)
	 		        {
	 					const row = data.find(d => d.login_id == login_id);
	 					if(login_id == row.login_id && password == row.password){
	 						var url = "/doctorsFriend/form/home/index.jsp"  + '?login_id=' + login_id ;  
	 						Swal.fire({
	            		        title: "WelCome!",
	            		        text: "Have A Good Day " + row.users_name,
	            		        icon: "success",
	            		        timer: 3000,
	            		        onOpen: function() {
	            		            Swal.showLoading()
	            		        }
	            		    }).then(function(result) {
	            		        if (result.dismiss === "timer") {
	            		        	window.location.assign(url);
	            		        }
	            		    })
	 					}else{
	 						Swal.fire({
	            		        title: "Wrong!",
	            		        text: "Please Enter Correct Credentials",
	            		        icon: "danger",
	            		        timer: 3000,
	            		        onOpen: function() {
	            		            Swal.showLoading()
	            		        }
	            		    }).then(function(result) {
	            		        if (result.dismiss === "timer") {
	            		        	window.location.reload();
	            		        }
	            		    })
	 						
	 		        }
	 		        } 
	 			});	
             
        	});        	 
    </script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>