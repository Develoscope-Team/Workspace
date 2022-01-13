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
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
 <link rel="stylesheet" href="style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
      <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<html lang="en">
	<!--begin::Head-->
	
	<!--end::Head-->
	<!--begin::Body-->
	<body id="kt_body" style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack016.jpg)" class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
		<!--begin::Main-->
		<div class="d-flex flex-column flex-root">
			<!--begin::Login-->
			<div class="login login-3 login-signin-on d-flex flex-row-fluid" id="kt_login">
				<div class="d-flex flex-center bgi-size-cover bgi-no-repeat flex-row-fluid" style=" opacity: 4; background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack016.jpg);">
				<div class ="p-3 mb-2 bg-transparent text-dark " >
					<div class="login-form text-center text-black p-7 position-relative overflow-hidden ">
						<!--begin::Login Header-->
						<div class="d-flex flex-center mb-15">
							<a href="#">
								<img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/Bake-Shack-Logo.png" class="max-h-100px" alt="" />
							</a>
						</div>
						<!--end::Login Header-->
						<!--begin::Login Sign in form-->
						<div class="bg-dark-o-90 rounded " style="width:100%">
						<div class="login-signin text-white">
							<div class="mb-20  ">
								 <h3>  &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</h3> 
								<h3>  WelCome to Bake Shack</h3> 
							</div>
							<form class="form"  id="kt_login_signin_form">
								<div class="form-group ml-5 mr-5" style="width:90%">
									<input class="form-control h-auto text-white placeholder-white  bg-dark-o-90 rounded-pill border-0 py-4 px-8 mb-5" id="loginid" type="text" placeholder="Userid" name="username" autocomplete="off" />
								</div>
								<div class="form-group ml-5 mr-5" style="width:90%">
									<input class="form-control h-auto text-white placeholder-white  bg-dark-o-90 rounded-pill border-0 py-4 px-8 mb-5" id="pass" type="password" placeholder="Password" name="password" />
								</div>
								<div class="form-group d-flex flex-wrap justify-content-between align-items-center px-8">
									<div class="checkbox-inline   ">
										<label class="checkbox checkbox-outline checkbox-white text-white m-0 ml-10 ">
										<input type="checkbox" name="remember" />
										<span></span>Remember me </label>
									</div>
<!-- 									<a href="javascript:;" id="kt_login_forgot" class="text-black font-weight-bold">&#160;Forget Password ?</a>
 -->								</div>
								<div class="form-group text-center mt-10">
									<button id="kt_login_singin_form_submit_button" class="btn btn-pill btn-outline-white font-weight-bold opacity-90 px-15 py-3">Sign In</button>
								</div>
							</form>
							<div class="ml-15  " style="width:300px">
								
								<!-- <a href="javascript:;" id="kt_login_signup" class="text-white font-weight-bold">Reset Password</a> -->
							</div>
							<div class="mb-20  ">
								 <h3>  &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</h3> 
								
							</div>
						</div>
						</div>
						<!--end::Login Sign in form-->
						
						
					</div>
					</div>
				</div>
			</div>
			<!--end::Login-->
		</div>
		</script>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/plugins/global/plugins.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/plugins/custom/prismjs/prismjs.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/scripts.bundle.js"></script>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/widgets.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/custom/login/login-general.js"></script>
		<script type="text/javascript">
    	
var basePath='<%=basePath%>';    
var base='<%=base%>';  
    		$('#kt_login_singin_form_submit_button').click(function(){
         		var login_id = $('#loginid').val();
            	var password = $('#pass').val();
        		
            	
            	$.ajax({
	 				url : base + "/bakeshackAPI/api/getUsersDetails",
	 				type : "post",
	 				dataType : "json",
	 				async : false,
	 				data : {"flag":1,},
	 				success:function(data)
	 		        {
	 					const row = data.find(d => d.login_id == login_id);
	 					if(row != null){
	 						
	 						var url = "/bakeshackWeb/form/home/index.jsp"  + '?login_id=' + login_id ;  
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
            	
            	
            	
            	
            	
            	
            	
            	
            	
            	/* if(login_id == "admin"  && password == "admin@123")
            	{
            		
            		var url = "/bakeshackWeb/form/home/index.jsp";
          		    Swal.fire({
            		        title: "WelCome!",
            		        text: "Have A Good Day Admin.",
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
    
            	}
            	else{
            		alert("login id and password doesn't match !");
            		
            	} */
        	});
        	
        	            	 
    
    	
   
    
    </script>
		
	</body>
	<!--end::Body-->
</html>
<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>