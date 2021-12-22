
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

<html lang="en">
<!--begin::Head-->
<head>
<base href="">
<meta charset="utf-8" />
<title>Doctors Friend</title>
<meta name="description" content="Updates and statistics" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="canonical" href="https://keenthemes.com/metronic" />

<jsp:include page="../common/cssfiles.jsp"></jsp:include>

<link rel="shortcut icon"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/logo.png" />
</head>

    <% 
    	String adminUserName = "";
    	String adminPassword = "";
    	
    	if(request.getParameter("adminUserName")!=null && !request.getParameter("adminUserName").equals("")){
    		adminUserName = request.getParameter("adminUserName");
    	}
    	if(request.getParameter("adminPassword")!=null && !request.getParameter("adminPassword").equals("")){
    		adminPassword = request.getParameter("adminPassword");
    	}
    
    %>


<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed subheader-enabled aside-enabled aside-static page-loading">
	<div class="d-flex flex-column flex-root">
		<!--begin::Login-->
		<div
			class="login login-1 login-signin-on d-flex flex-column flex-lg-row flex-column-fluid bg-white"
			id="kt_login">
			<div
				class="login-content flex-row-fluid d-flex flex-column justify-content-center position-relative overflow-hidden p-7 mx-auto">
				<div class="d-flex flex-column-fluid flex-center">
					<div class="login-form login-signin">
						<!--begin::Form-->
						<form class="form" novalidate="novalidate"
							id="kt_login_signin_form">
							<div class="form-group">
								<label class="font-size-h6 font-weight-bolder text-dark">Login
									ID</label> <input
									class="form-control form-control-solid h-auto py-6 px-6 rounded-lg"
									type="text"  id="loginid" name="loginid" autocomplete="off" />
							</div>
							<div class="form-group">
								<div class="d-flex justify-content-between mt-n5">
									<label class="font-size-h6 font-weight-bolder text-dark pt-5">Password</label>
								</div>
								<input
									class="form-control form-control-solid h-auto py-6 px-6 rounded-lg"
									type="password" id="pass" name="pass" autocomplete="off" />
							</div>
							<div class="pb-lg-0 pb-5">
								<button type="submit" id="kt_login_singin_form_submit_button"
									class="btn btn-primary font-weight-bolder font-size-h6 px-8 py-4 my-3 mr-3">Sign
									In</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";
	</script>
	<script>
		var KTAppSettings = {
			"breakpoints" : {
				"sm" : 576,
				"md" : 768,
				"lg" : 992,
				"xl" : 1200,
				"xxl" : 1200
			},
			"colors" : {
				"theme" : {
					"base" : {
						"white" : "#ffffff",
						"primary" : "#6993FF",
						"secondary" : "#E5EAEE",
						"success" : "#1BC5BD",
						"info" : "#8950FC",
						"warning" : "#FFA800",
						"danger" : "#F64E60",
						"light" : "#F3F6F9",
						"dark" : "#212121"
					},
					"light" : {
						"white" : "#ffffff",
						"primary" : "#E1E9FF",
						"secondary" : "#ECF0F3",
						"success" : "#C9F7F5",
						"info" : "#EEE5FF",
						"warning" : "#FFF4DE",
						"danger" : "#FFE2E5",
						"light" : "#F3F6F9",
						"dark" : "#D6D6E0"
					},
					"inverse" : {
						"white" : "#ffffff",
						"primary" : "#ffffff",
						"secondary" : "#212121",
						"success" : "#ffffff",
						"info" : "#ffffff",
						"warning" : "#ffffff",
						"danger" : "#ffffff",
						"light" : "#464E5F",
						"dark" : "#ffffff"
					}
				},
				"gray" : {
					"gray-100" : "#F3F6F9",
					"gray-200" : "#ECF0F3",
					"gray-300" : "#E5EAEE",
					"gray-400" : "#D6D6E0",
					"gray-500" : "#B5B5C3",
					"gray-600" : "#80808F",
					"gray-700" : "#464E5F",
					"gray-800" : "#1B283F",
					"gray-900" : "#212121"
				}
			},
			"font-family" : "Poppins"
		};
	</script>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/global/plugins.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/custom/prismjs/prismjs.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/scripts.bundle.js"></script>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/widgets.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/custom/login/login-general.js"></script>

<script type="text/javascript">
    	
var basePath='<%=basePath%>';    
var base='<%=base%>';  
    	
    	$('#kt_login_singin_form_submit_button').click(function(){

		
    		/* var loginid = $('#loginid').val();
        	var pass = $('#pass').val();
        	
  	    			$.ajax({	
  	            		url: base+"/dssAPI/dfapi/getAdminLoginDetails",
  	            		type : "post",
  	            		dataType:"json",
  		          		async:false,
  	            		data: {"UserName": loginid ,"Password": pass},
  	            		beforeSend: function() {
  	            			var btn = KTUtil.getById("kt_login_singin_form_submit_button");

  		          			KTUtil.addEvent(btn, "click", function() {
  		          			    KTUtil.btnWait(btn, "spinner spinner-right spinner-white pr-15", "Please wait");

  		          			    setTimeout(function() {
  		          			        KTUtil.btnRelease(btn);
  		          			    }, 1000);
  		          			});
  	            	    },
  	            	 	error: function(xhr){
  	             	    	var msg = "(getAdminLoginDetails)Sorry but there was an error : "+ xhr.status + " " + xhr.statusText;
  	             			alert(msg);
  	             		},
  	             		success: function(response){
  	             			if(response!=null){
  	            	    		// debugger;
  	            	    		//var obj1 = JSON.parse(response);
  	            	    		
  	            	    		if(response == 1){
  	            	    			//return false;
  	            	    		
  	            	    			window.location.replace("form/home/index.jsp");

  	            	    		}else{
  	            	    		 	Swal.fire({
  	        			                text: "Login failed!",
  	        			                icon: "error",
  	        			                buttonsStyling: false,
  	        							confirmButtonText: "Ok, got it!",
  	        							customClass: {
  	        								confirmButton: "btn font-weight-bold btn-light-primary"
  	        							}
  	        			            }).then(function() {
  	        							KTUtil.scrollTop();
  	        						});
  	            	    		}
  	            	    	}
  	            	    }
  	            		
  	            	}); */
  	            	
    		$('#kt_login_singin_form_submit_button').click(function(){
        		
    		    
        		
        		var login_id = $('#loginid').val();
            	//alert(login_id);
            	var password = $('#pass').val();
            	//alert(password);
        		
            	if(login_id == "admin"  && password == "admin@123")
            	{
            		
            		var url = "/doctorsFriend/form/home/index.jsp";

            		window.location.assign(url);
            	}
            	else{
            		alert("login id and password doesn't match !");
            		
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